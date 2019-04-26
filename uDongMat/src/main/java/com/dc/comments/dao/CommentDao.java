package com.dc.comments.dao;

import java.util.List;

import com.dc.board.vo.BoardVo;
import com.dc.comments.vo.CommentVo;

public interface CommentDao{
	
	public List<CommentVo> commentSelectList(int boardNo);
	public int commentSelectTotalCount(int boardNo);
	public void commentInsertOne(CommentVo commentVo);
	public void commentUpdateOne(CommentVo commentVo);
	public CommentVo commentDetailOne(int commentNo);
	public void commentDelete(int commentNo);
	public void commentUpdateRecommendUp(int commentNo);
	public void commentUpdateRecommendDown(int commentNo);
}
