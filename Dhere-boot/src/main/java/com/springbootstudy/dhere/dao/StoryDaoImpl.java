package com.springbootstudy.dhere.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Marker;
import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.domain.Tag;

@Repository
public class StoryDaoImpl implements StoryDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String NAME_SPACE = "com.springbootstudy.dhere.mappers.StoryMapper";
	
	@Override
	public void postWrite (Story story) {
		sqlSession.insert(NAME_SPACE+".postWrite", story);
	}

	// 게시물 리스트 가져오기
//	@Override
//	public List<Story> getStoryList() {
//		return sqlSession.selectList(NAME_SPACE + ".getStoryList");
//	}
	
	@Override
	public List<Story> getStoryList() {
	    return sqlSession.selectList(NAME_SPACE + ".getStoryList");
	}
	
	// 게시물 리스트 가져오기 (+페이징)
	@Override
	public List<Story> getStoryListPaged(int offset, int limit, String selectedJob, String searchKeyword, String sort) {
		Map<String, Object> params = new HashMap<>();
		params.put("offset", offset);
		params.put("limit", limit);
		params.put("selectedJob", selectedJob);
        params.put("searchKeyword", searchKeyword);
        params.put("sort", sort);
		return sqlSession.selectList(NAME_SPACE + ".getStoryListPaged", params);
	}
	
	// 태그 리스트 가져오기
	@Override
	public List<Tag> getTagList(int storyNo) {
	    return sqlSession.selectList(NAME_SPACE + ".getTagList", storyNo);
	}
	
	
	// 직종별 게시물 리스트 출력
	@Override
	public List<Story> storyList(String selectedJob) {
		return sqlSession.selectList(NAME_SPACE + ".getStoryListPaged", selectedJob);
	}
	
	/*
	// 검색 결과 리스트 출력
	@Override
	public List<Story> searchList(String searchKeyword) {
		return sqlSession.selectList(NAME_SPACE + ".getStoryListPaged", searchKeyword);
	}

	// 정렬 리스트 출력
	@Override
	public List<Story> sortList(String sort) {
		return sqlSession.selectList(NAME_SPACE  + ".getStoryListPaged", sort);
	}
	*/

	// 게시물 디테일 가져오기(syj)
	@Override
	public Story getStoryDetail(int storyNo) {
	    return sqlSession.selectOne(NAME_SPACE + ".getStoryDetail", storyNo);
	}
	
	// 게시물 디테일_이미지 가져오기(syj)
	@Override
	public List<Image> getStoryDetailImage(int storyNo) {
		return sqlSession.selectList(NAME_SPACE + ".getStoryDetailImage", storyNo);
	}
	
	// // 게시물 디테일_태그 가져오기(syj)
	@Override
	public List<Tag> getStoryDetailTag(int storyNo) {
		return sqlSession.selectList(NAME_SPACE + ".getStoryDetailTag", storyNo);
	}
	
	// 게시물 조회 수 증가시키기(syj)
	@Override
	public void increaseReadCount(int storyNo) {
	    sqlSession.update(NAME_SPACE + ".increaseReadCount", storyNo);
	}
	
	// 게시물 좋아요 증가시키기(syj)
	@Override
	public int increaseThank(int storyNo) {
	    sqlSession.update(NAME_SPACE + ".increaseThank", storyNo);
	    return sqlSession.selectOne(NAME_SPACE + ".selectThankCount", storyNo);
	}
	
	// 게시물 삭제하기(syj)
	@Override
	public void deleteStory(int storyNo) {
		sqlSession.delete(NAME_SPACE + ".deleteStory", storyNo);
	}
	@Override
	public void deleteScrapByStoryNo(int storyNo) {
		sqlSession.delete(NAME_SPACE + ".deleteScrapByStoryNo", storyNo);
	}
	@Override
	public void deleteReplyByStoryNo(int storyNo) {
		sqlSession.delete(NAME_SPACE + ".deleteReplyByStoryNo", storyNo);
	}
	@Override
	public void deleteMarkerByStoryNo(int storyNo) {
		sqlSession.delete(NAME_SPACE + ".deleteMarkerByStoryNo", storyNo);
	}
	@Override
	public void deleteTagPostByStoryNo(int storyNo) {
		sqlSession.delete(NAME_SPACE + ".deleteTagPostByStoryNo", storyNo);
	}
	@Override
	public void deleteTagByStoryNo(int storyNo) {
		sqlSession.delete(NAME_SPACE + ".deleteTagByStoryNo", storyNo);
	}
	@Override
	public void deleteImageByStoryNo(int storyNo) {
		sqlSession.delete(NAME_SPACE + ".deleteImageByStoryNo", storyNo);
	}
	
	// 게시물 수정하기 읽어오기(syj)
	@Override
	public void updateStory(Story story) {
		sqlSession.update(NAME_SPACE + ".updateStory", story);
	}
	
	// 게시물 수정하기(syj)
	@Override
	public void updateStoryProcess(Story story) {
 		sqlSession.update(NAME_SPACE + ".updateStoryProcess", story);
 		System.out.println(story.getTitle());
 		System.out.println(story.getContent1());
 		System.out.println(story.getContent2());
 		System.out.println(story.getContent3());
 		System.out.println(story.getContent4());
	}
	
	 // 직종 리스트 가져오기
	@Override
	public List<Job> getJobList(){
		List<Job> jList=sqlSession.selectList(NAME_SPACE+".getJobList");
		System.out.println(jList);
		return sqlSession.selectList(NAME_SPACE+".getJobList");
	}
	
	// 게시글 이미지 추가하기
	@Override
	public void insertImage(Image image) {
		sqlSession.insert(NAME_SPACE+".insertImage",image);
	}
	
	//tag 추가하기
	@Override
	public void insertTag(Tag tag) {
		sqlSession.insert(NAME_SPACE+".insertTag", tag);
	}
	//tagPost추가하기
	@Override
	public void insertTagPost(Tag tag) {
		sqlSession.insert(NAME_SPACE+".insertTagPost", tag);
	}


	
@Override
	public List<Story> sList(String email) {
		return sqlSession.selectList(NAME_SPACE + ".sList", email);
	}

//마커 정보 입력
	@Override
	public void insertMarker(Marker marker) {
		sqlSession.insert(NAME_SPACE+".insertMarker",marker);
	}

	// 마커 리스트에 담기(syj)
	@Override
	public List<Marker> markerList(int storyNo) {
		return sqlSession.selectList(NAME_SPACE  + ".markerList", storyNo);
	}


	

}
