package com.springbootstudy.dhere.dao;

import java.util.List;

import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.domain.Tag;

public interface StoryDao {
    // 게시물 리스트 가져오기
    public abstract List<Story> getStoryList();

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
    void deleteScrapByStoryNo(int storyNo);
    void deleteReplyByStoryNo(int storyNo);
    void deleteMarkerByStoryNo(int storyNo);
    void deleteTagPostByStoryNo(int storyNo);
    void deleteImageByStoryNo(int storyNo);
    
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

	// 직종별 게시물 리스트 출력
	public abstract List<Story> storyList(String selectedJob);
	
	// 검색 결과 리스트 출력
	public abstract List<Story> searchList(String searchKeyword);
	
	// 정렬 리스트 출력
	public abstract List<Story> sortList(String sort);
}