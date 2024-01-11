package com.springbootstudy.dhere.dao;

import java.util.List;
import java.util.Map;

import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Marker;
import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.domain.Tag;

public interface StoryDao {
    // 게시물 리스트 가져오기
    public abstract List<Story> getStoryList();
    //public abstract Map<String, List<Story>> getStoryList();
    
    // 게시물 리스트 가져오기 (ajax)
    public abstract List<Story> getResultStoryList(int offset, int limit, String selectedJob, String searchKeyword, String sort);
    
    // 태그 리스트 가져오기 
    public abstract List<Tag> getTagList(int storyNo);
    
    // 게시물 디테일 가져오기(syj)
    public abstract Story getStoryDetail(int storyNo);
    
    // 게시물 디테일_이미지 가져오기(syj)
    public abstract List<Image> getStoryDetailImage(int storyNo);
    
    // 게시물 디테일_태그 가져오기(syj)
    public abstract List<Tag> getStoryDetailTag(int storyNo);
    
    // 게시물 조회 수 증가시키기(syj)
    public abstract void increaseReadCount(int storyNo);
    
    // 게시물 좋아요 증가시키기(syj)
    public int increaseThank(int storyNo);
    
    // 게시물 삭제하기(syj)
    public abstract void deleteStory(int storyNo);
    public abstract void deleteScrapByStoryNo(int storyNo);
    public abstract void deleteReplyByStoryNo(int storyNo);
    public abstract void deleteMarkerByStoryNo(int storyNo);
    public abstract void deleteTagPostByStoryNo(int storyNo);
    public abstract void deleteTagByStoryNo(int storyNo);
    public abstract void deleteImageByStoryNo(int storyNo);
    
    // 게시물 수정하기 읽어오기(syj)
    public abstract void updateStory(Story story);
    
    // 게시물 수정하기(syj)
    public abstract void updateStoryProcess(Story story);

    // 게시물 쓰기
	public abstract void postWrite(Story story);

	// 직종 리스트 가져오기
	public abstract List<Job> getJobList();

	// 게시글 이미지 입력하기
	public abstract void insertImage(Image image);

	//tag추가하기
	public abstract void insertTag(Tag tag);
	
	//tagPost추가하기
	public abstract void insertTagPost(Tag tag);
	
	//내 게시 글
	public abstract List<Story> sList(String email);

	
	// 직종별 게시물 리스트 출력
	public abstract List<Story> storyList(String selectedJob);
	/*
	// 검색 결과 리스트 출력
	public abstract List<Story> searchList(String searchKeyword);
	
	// 정렬 리스트 출력
	public abstract List<Story> sortList(String sort);
	*/
	//마커 정보 입력
	public abstract void insertMarker(Marker marker);
	
	// 마커 리스트에 담기(syj)
	public abstract List<Marker> markerList(int storyNo);

	
	//마커 삭제하기
	public abstract void deleteMarker(int storyNo);
}