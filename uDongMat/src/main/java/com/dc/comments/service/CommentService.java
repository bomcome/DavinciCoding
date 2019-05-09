package com.dc.comments.service;

import java.util.List;

import com.dc.board.vo.BoardVo;
import com.dc.comments.vo.CommentVo;

public interface CommentService {
	
	public List<CommentVo> commentSelectList(int end, int boardNo);
	public int commentSelectTotalCount(int boardNo);
	public void commentInsertOne(CommentVo commentVo);
	public void commentUpdateOne(CommentVo commentVo);
	public CommentVo commentDetailOne(int commentNo);
	public void commentDelete(int commentNo);
	public void commentUpdateRecommendUp(int commentNo);
	public void commentUpdateRecommendDown(int commentNo);
}
