package com.dc.comments.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dc.board.vo.BoardVo;
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

	@Override
	public void commentInsertOne(CommentVo commentVo) {
		// TODO Auto-generated method stub
		commentDao.commentInsertOne(commentVo);
	}

	@Override
	public void commentUpdateOne(CommentVo commentVo) {
		// TODO Auto-generated method stub
		commentDao.commentUpdateOne(commentVo);
	}

	@Override
	public CommentVo commentDetailOne(int commentNo) {
		// TODO Auto-generated method stub
		return commentDao.commentDetailOne(commentNo);
	}

	@Override
	public void commentDelete(int commentNo) {
		// TODO Auto-generated method stub
		commentDao.commentDelete(commentNo);
	}

	@Override
	public void commentUpdateRecommendUp(int commentNo) {
		// TODO Auto-generated method stub
		commentDao.commentUpdateRecommendUp(commentNo);
	}

	@Override
	public void commentUpdateRecommendDown(int commentNo) {
		// TODO Auto-generated method stub
		commentDao.commentUpdateRecommendDown(commentNo);
	}
}
