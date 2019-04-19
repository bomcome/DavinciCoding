package com.dc.comments.dao;

import java.util.List;

import com.dc.comments.vo.CommentVo;

public interface CommentDao{
	
	public List<CommentVo> commentSelectList(int boardNo);
	public int commentSelectTotalCount(int boardNo);
}
