package com.springbootstudy.dhere.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.domain.Reply;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.domain.Tag;
import com.springbootstudy.dhere.service.ProductService;
import com.springbootstudy.dhere.service.ReplyService;
import com.springbootstudy.dhere.service.StoryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StoryController {

	@Autowired
	private StoryService storyService;

	@Autowired
	private ProductService productService;

	@Autowired
	private ReplyService replyService;

	// src/main/resources/static/resources/images/desk/** 정적경로 파일 업로드 테스트
	private static final String DEFAULT_PATH = "src/main/resources/static/resources/images/desk/";

	// #######################################################
	// ##### JSP 뷰 시작
	// #######################################################

	// 데스크 셋업 리스트 출력 (메인)
	// 카테고리 별 제품 리스트 출력
	@GetMapping(value = { "/", "/main" })
	public String Main(Model model,
			@RequestParam(value = "storyNo", defaultValue = "1") int storyNo,
			@RequestParam(value = "productCategory", required = false, defaultValue = "All") String productCategory) {

		List<Job> jList = storyService.getJobList();
		model.addAttribute("jList", jList);
		
		//Map<String, List<Story>> map = storyService.getStoryList();
		//map.put("sList", storyService.getStoryList());
		
		Map<String, List<Story>> map = storyService.getStoryList();
	    List<Story> sList = map.get("sList"); 
	    model.addAttribute("sList", sList);
		
		/*
		List<Story> sList = storyService.getStoryList();
		model.addAttribute("sList", sList);
		*/
		
		List<Product> pList = productService.productList(productCategory);
		model.addAttribute("pList", pList);

		return "main";
	}
	
	// 게시물 리스트 출력 (+페이징)
    @GetMapping("/getStoryList")
    public ResponseEntity<List<Story>> getPartialList(
            @RequestParam("offset") int offset,
            @RequestParam("limit") int limit) {
    	
        List<Story> items = storyService.getStoryListPaged(offset, limit);
        return ResponseEntity.ok(items);
    }
	
	// 게시물 디테일(syj)
	@GetMapping("/storyDetail")
	public String storyDetail(Model model, HttpSession session,
			@RequestParam("storyNo") int storyNo) {

		// 댓글 출력 로직 추가
		List<Reply> rList = replyService.getReply(storyNo);
		model.addAttribute("rList", rList);

		// 조회수 증가 로직 추가
		storyService.increaseReadCount(storyNo);

		Story storyDetail = storyService.getStoryDetail(storyNo);
		model.addAttribute("storyDetail", storyDetail);

		List<Image> iList = storyService.getStoryDetailImage(storyNo);
		model.addAttribute("iList", iList);

		List<Tag> tList = storyService.getStoryDetailTag(storyNo);
		model.addAttribute("tList", tList);

		return "storyDetail";
	}

	///////////////////////////////////////////////////////////////////
	// 게시물 좋아요 증가시키기(syj)
	@PostMapping("/increaseThank")
	@ResponseBody
	public Map<String, Object> increaseThank(
			@RequestParam("storyNo") int storyNo) {

		// 여기서 storyService.increaseThank(storyNo) 메서드는 데이터베이스에서 storyNo에 해당하는 게시물의 좋아요
		// 수를 증가시키는 로직을 수행합니다.
		int newLikes = storyService.increaseThank(storyNo);
		Map<String, Object> response = new HashMap<>();
		response.put("likes", newLikes);

		return response;
	}

	///////////////////////////////////////////////////////////////////
	// 게시물 삭제(syj)
	@PostMapping("/deleteStory")
	public String deleteStory(HttpServletResponse response,
			@RequestParam("storyNo") int storyNo) {

		storyService.deleteStory(storyNo);

		return "redirect:main";
	}

	///////////////////////////////////////////////////////////////////
	// 게시물 수정하기 읽어오기(syj)
	@GetMapping("/updateStory")
	public String updateStory(Model model, HttpServletResponse response,
			@RequestParam("storyNo") int storyNo) {

		Story story = storyService.getStoryDetail(storyNo);

		model.addAttribute("story", story);

		return "updateStory";
	}

	///////////////////////////////////////////////////////////////////
	// 게시물 수정하기(syj)
	@PostMapping("updateStoryProcess")
	public String updateStoryProcess(
			HttpServletResponse response, PrintWriter out,
			@ModelAttribute Story story) {

		// storyService 클래스를 이용해 게시물을 수정한다.
		storyService.updateStoryProcess(story);

		return "redirect:main";
	}

	// 게시글 쓰기
	@PostMapping(value = "/postWrite")
	public String postWrite(Model model,
			HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "content1") String content1,
			@RequestParam(value = "content2") String content2,
			@RequestParam(value = "content3") String content3,
			@RequestParam(value = "content4") String content4,
			@RequestParam(value = "categoryNo") int categoryNo,
			@RequestParam(value = "hashtag", required = false) List<String> tagList,
			@RequestParam(value = "additionalImages", required = false) List<MultipartFile> multipartFile)
			throws IOException {

		String nickname = (String) session.getAttribute("nickname");
		Member member = (Member) session.getAttribute("member");
		String email = member.getEmail();

		Story story = new Story();

		story.setTitle(title);
		story.setContent1(content1);
		story.setContent2(content2);
		story.setContent3(content3);
		story.setContent4(content4);
		story.setCategoryNo(categoryNo);
		story.setEmail(email);
		story.setNickname(nickname);
		System.out.println(nickname);

		storyService.postWrite(story);

		System.out.println(tagList);

		// 태그 리스트 추가
		if (tagList != null && !tagList.isEmpty()) {
			for (String hashtag : tagList) {
				Tag tag = new Tag();
				tag.setTagName(hashtag);
				tag.setStoryNo(story.getStoryNo());
				storyService.insertTag(tag);
				storyService.insertTagPost(tag);
			}
		}

		// 이미지 리스트 추가
		if (multipartFile != null && !multipartFile.isEmpty()) {

			for (MultipartFile imageFile : multipartFile) {
				Image image = new Image();

				// ##################################################################
				// 프로젝트 외부 폴더를 이미지 저장소로 사용 - 프로젝트가 실행되는 최상위 루트부터 참조
				// /resources/images/desk/** 절대경로 방식 참조
				/*
				 * File parent = new File(DEFAULT_PATH);
				 * log.info("parent abs path : " + parent.getAbsolutePath());
				 * log.info("parent path : " + parent.getPath());
				 * log.info("exist : " + parent.exists() + ", dir : " + parent.isDirectory());
				 * 
				 * // 존재하지 않으면 filePath의 경로에 있는 모든 폴더를 생성한다.
				 * if(!parent.exists()) {
				 * parent.mkdirs();
				 * }
				 * 
				 * UUID uid = UUID.randomUUID();
				 * 
				 * // UUID + 원본 파일
				 * // String saveName = uid.toString() + "_" + imageFile.getOriginalFilename();
				 * 
				 * // UUID만 사용
				 * // 원본 파일에서 확장자만 추출
				 * String extension =
				 * StringUtils.getFilenameExtension(imageFile.getOriginalFilename());
				 * String saveName = uid.toString() + "." + extension;
				 * File file = new File(parent.getAbsolutePath(), saveName);
				 * log.info("file abs path : " + file.getAbsolutePath());
				 * log.info("file path : " + file.getPath());
				 * 
				 * // 업로드 되는 파일을 upload 폴더로 저장한다.
				 * imageFile.transferTo(file);
				 * image.setFileName(file.getName());
				 * image.setStoryNo(story.getStoryNo());
				 * storyService.insertImage(image);
				 */

				// END 프로젝트 외부 폴더를 이미지 저장소로 사용 - 프로젝트가 실행되는 최상위 루트부터 참조
				// ##################################################################

				// ##################################################################
				// src/main/resources/resources/images/desk/** 스프링 부트 기본 리소스 경로 파일 업로드 테스트

				/*
				 * File parent = new File(DEFAULT_PATH);
				 * log.info("parent abs path : " + parent.getAbsolutePath());
				 * log.info("parent path : " + parent.getPath());
				 * log.info("exist : " + parent.exists() + ", dir : " + parent.isDirectory());
				 * 
				 * // 존재하지 않으면 filePath의 경로에 있는 모든 폴더를 생성한다.
				 * if(!parent.exists()) {
				 * parent.mkdirs();
				 * }
				 * 
				 * UUID uid = UUID.randomUUID();
				 * 
				 * // UUID + 원본 파일
				 * // String saveName = uid.toString() + "_" + imageFile.getOriginalFilename();
				 * 
				 * // UUID만 사용
				 * // 원본 파일에서 확장자만 추출
				 * String extension =
				 * StringUtils.getFilenameExtension(imageFile.getOriginalFilename());
				 * String saveName = uid.toString() + "." + extension;
				 * File file = new File(parent.getAbsolutePath(), saveName);
				 * log.info("file abs path : " + file.getAbsolutePath());
				 * log.info("file path : " + file.getPath());
				 * 
				 * // 업로드 되는 파일을 upload 폴더로 저장한다.
				 * imageFile.transferTo(file);
				 * image.setFileName(file.getName());
				 * image.setStoryNo(story.getStoryNo());
				 * storyService.insertImage(image);
				 */

				// END src/main/resources/resources/images/desk/** 스프링 부트 기본 리소스 경로 파일 업로드 테스트
				// ##################################################################

				// ##################################################################
				// src/main/resources/static/resources/images/desk/** 정적경로 파일 업로드 테스트

				File parent = new File(DEFAULT_PATH);
				log.info("parent abs path : " + parent.getAbsolutePath());
				log.info("parent path : " + parent.getPath());
				log.info("exist : " + parent.exists() + ", dir : " + parent.isDirectory());

				// 존재하지 않으면 filePath의 경로에 있는 모든 폴더를 생성한다.
				if (!parent.exists()) {
					parent.mkdirs();
				}

				UUID uid = UUID.randomUUID();

				// UUID + 원본 파일
				// String saveName = uid.toString() + "_" + imageFile.getOriginalFilename();

				// UUID만 사용
				// 원본 파일에서 확장자만 추출
				String extension = StringUtils.getFilenameExtension(imageFile.getOriginalFilename());
				String saveName = uid.toString() + "." + extension;
				File file = new File(parent.getAbsolutePath(), saveName);
				log.info("file abs path : " + file.getAbsolutePath());
				log.info("file path : " + file.getPath());

				// 업로드 되는 파일을 upload 폴더로 저장한다.
				imageFile.transferTo(file);
				image.setFileName(file.getName());
				image.setStoryNo(story.getStoryNo());
				storyService.insertImage(image);

				// END src/main/resources/static/resources/images/desk/** 정적경로 파일 업로드 테스트
				// ##################################################################

				// ##################################################################
				// src/main/webapp/resources/images/desk/** 상대경로 방식 파일 업로드 테스트

				/*
				 * // Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
				 * // getRealPath()는 "src/main/webapp" 아래에서 지정한 경로를 찾는다 - 상대경로 방식
				 * String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
				 * File parent = new File(filePath);
				 * log.info("parent abs path : " + parent.getAbsolutePath());
				 * log.info("parent path : " + parent.getPath());
				 * log.info("exist : " + parent.exists() + ", dir : " + parent.isDirectory());
				 * 
				 * // 존재하지 않으면 filePath의 경로에 있는 모든 폴더를 생성한다.
				 * if(!parent.exists()) {
				 * parent.mkdirs();
				 * }
				 * 
				 * UUID uid = UUID.randomUUID();
				 * 
				 * // UUID + 원본 파일
				 * String saveName = uid.toString() + "_" + imageFile.getOriginalFilename();
				 * 
				 * // UUID만 사용
				 * // 원본 파일에서 확장자만 추출
				 * //String extension =
				 * StringUtils.getFilenameExtension(imageFile.getOriginalFilename());
				 * //String saveName = uid.toString() + "." + extension;
				 * File file = new File(parent, saveName);
				 * log.info("file abs path : " + file.getAbsolutePath());
				 * log.info("file path : " + file.getPath());
				 * 
				 * // 업로드 되는 파일을 upload 폴더로 저장한다.
				 * imageFile.transferTo(file);
				 * image.setFileName(file.getName());
				 * image.setStoryNo(story.getStoryNo());
				 * storyService.insertImage(image);
				 */

				// END src/main/webapp/resources/images/desk/** 상대경로 방식 파일 업로드 테스트
				// ##################################################################
			}
		}
		return "redirect:main";
	}

	@GetMapping(value = "/postWriteForm")
	public String postWriteForm(Model model) {

		List<Job> jList = storyService.getJobList();
		// System.out.println(jList.get(0).getCategoryName());
		model.addAttribute("jList", jList);

		return "postWriteForm";
	}

	// 제품 디테일
	@GetMapping("/productDetail")
	public String productDetail(Model model,
			@RequestParam("productNo") int productNo) {

		System.out.println(productNo);

		Product product = productService.getProduct(productNo);

		model.addAttribute("product", product);

		return "productDetail";
	}

	// #######################################################
	// ##### Thymeleaf 뷰 시작
	// #######################################################
	@GetMapping("/thView")
	public String productDetail(Model model) {

		return "th/thViewTest";
	}
}
