package com.springbootstudy.dhere.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.springbootstudy.dhere.domain.Reply;

public interface ReplyService {
	
	//	댓글 쓰기(syj)
	public abstract void replyWrite(Reply reply);
	
	//	댓글 리스트에 담아 가져오기(syj)
	public abstract List<Reply> getReply(int storyNo);
	
	// 댓글 삭제하기(syj)
    public abstract void deleteReply(int replyNo);

}