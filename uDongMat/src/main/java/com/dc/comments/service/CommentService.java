package com.dc.comments.service;

import java.util.List;

import com.dc.comments.vo.CommentVo;

public interface CommentService {
	
	public List<CommentVo> commentSelectList(int boardNo);
	public int commentSelectTotalCount(int boardNo);
}
