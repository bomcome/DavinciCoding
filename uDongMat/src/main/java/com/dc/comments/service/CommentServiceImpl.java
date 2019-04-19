package com.dc.comments.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dc.comments.dao.CommentDao;
import com.dc.comments.vo.CommentVo;
@Service
public class CommentServiceImpl implements CommentService{
		
	@Autowired
	private CommentDao commentDao;

	@Override
	public List<CommentVo> commentSelectList(int boardNo) {
		// TODO Auto-generated method stub
		return commentDao.commentSelectList(boardNo);
	}

	@Override
	public int commentSelectTotalCount(int boardNo) {
		// TODO Auto-generated method stub
		return commentDao.commentSelectTotalCount(boardNo);
	}
}
