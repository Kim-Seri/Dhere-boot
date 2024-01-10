package com.springbootstudy.dhere.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springbootstudy.dhere.dao.StoryDao;
import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Marker;
import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.domain.Tag;

@Service
public class StoryServiceImpl implements StoryService {

	@Autowired
	private StoryDao storyDao;

	@Override
	public List<Story> sList(String email) {
		return storyDao.sList(email);
	}

	// 게시물 리스트 가져오기
//	@Override
//	public List<Story> getStoryList() {
//		return storyDao.getStoryList();
//	}

	@Override
	public Map<String, List<Story>> getStoryList() {
		Map<String, List<Story>> map = new HashMap<>();
	    List<Story> sList = storyDao.getStoryList();

	    // 각 Story 객체에 태그 정보 추가
	    for (Story story : sList) {
	        List<Tag> tags = storyDao.getStoryDetailTag(story.getStoryNo());
	        story.setTags(tags);
	    }

	    map.put("sList", sList);
	    return map;
	}
	
	@Override
	public List<Story> getStoryListPaged(int offset, int limit, String selectedJob, String searchKeyword, String sort) {
		return storyDao.getStoryListPaged(offset, limit, selectedJob, searchKeyword, sort);
	}

	
	
	// 게시물 리스트 가져오기 (+페이징)
//	@Override
//	public List<Story> getStoryListPaged(int offset, int limit) {
//		return storyDao.getStoryListPaged(offset, limit);
//	}
	

	//게시글 작성하기(story)
	@Override
	public void postWrite(Story story) {
		storyDao.postWrite(story);
	}

	// 게시물 상세보기 (syj)
	@Override
	public Story getStoryDetail(int storyNo) {
		return storyDao.getStoryDetail(storyNo);
	}

	// 게시물 디테일_이미지 가져오기(syj)
	@Override
	public List<Image> getStoryDetailImage(int storyNo) {
		return storyDao.getStoryDetailImage(storyNo);
	}

	// 게시물 디테일_태그 가져오기(syj)
	@Override
	public List<Tag> getStoryDetailTag(int storyNo) {
		return storyDao.getStoryDetailTag(storyNo);
	}

	// 게시물 조회 수 증가시키기(syj)
	@Override
	public void increaseReadCount(int storyNo) {
		storyDao.increaseReadCount(storyNo);
	}

	// 게시물 좋아요 증가시키기(syj)
	@Override
	public int increaseThank(int storyNo) {
		return storyDao.increaseThank(storyNo);
	}

	// 게시물 삭제하기(syj)
	@Transactional
	@Override
	public void deleteStory(int storyNo) {
		storyDao.deleteScrapByStoryNo(storyNo);
		storyDao.deleteReplyByStoryNo(storyNo);
		storyDao.deleteMarkerByStoryNo(storyNo);
		storyDao.deleteTagPostByStoryNo(storyNo);
		storyDao.deleteTagByStoryNo(storyNo);
		storyDao.deleteImageByStoryNo(storyNo);

		// 마지막으로 story 삭제하자
		storyDao.deleteStory(storyNo);
	}

	// 게시물 수정하기 읽어오기(syj)
	@Override
	public void updateStory(Story story) {
		storyDao.updateStory(story);
	}

	// 게시물 수정하기(syj)
	@Override
	public void updateStoryProcess(Story story) {
		storyDao.updateStoryProcess(story);
	}

	// 직종 리스트 가져오기
	@Override
	public List<Job> getJobList() {
		List<Job> jList = storyDao.getJobList();
		System.out.println(jList);
		return storyDao.getJobList();
	}

	// 게시물 이미지 추가하기
	@Override
	public void insertImage(Image image) {
		storyDao.insertImage(image);
	}

	// tag추가하기
	@Override
	public void insertTag(Tag tag) {
		storyDao.insertTag(tag);
	}

	// tagPost추가하기
	@Override
	public void insertTagPost(Tag tag) {
		storyDao.insertTagPost(tag);
	}
	
	
	// 직종별 게시물 리스트 출력
	@Override
	public List<Story> storyList(String selectedJob) {
		return storyDao.storyList(selectedJob);
	}
	/*
	// 검색 결과 리스트 출력
	@Override
	public List<Story> searchList(String searchKeyword) {
		return storyDao.searchList(searchKeyword);
	}

	// 정렬 리스트 출력
	@Override
	public List<Story> sortList(String sort) {
		return storyDao.sortList(sort);
	}

	// 마커관련정보 추가
	*/
	//마커관련정보 추가
	@Override
	public void insertMarker(Marker marker) {
		storyDao.insertMarker(marker);
	}

	// 마커 리스트에 담기(syj)
	@Override
	public List<Marker> markerList(int storyNo) {
		return storyDao.markerList(storyNo);
	}

	
	// 이미지 삭제
	@Override
	public void deleteImage(int storyNo) {
		storyDao.deleteImageByStoryNo(storyNo);
	}

	// 마커 삭제
	@Override
	public void deleteMarker(int storyNo) {
		storyDao.deleteMarker(storyNo);
	}
}
