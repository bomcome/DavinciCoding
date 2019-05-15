package com.dc.comments.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dc.comments.dao.CommentDao;
import com.dc.comments.vo.CommentVo;
import com.dc.recommend.dao.RecommendDao;
@Service
public class CommentServiceImpl implements CommentService{
		
	@Autowired
	private CommentDao commentDao;

	@Autowired
	private RecommendDao recommendDao;
	
	@Override
	public List<CommentVo> commentSelectList(int end, int boardNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("boardNo", boardNo);
		map.put("end", end);
		return commentDao.commentSelectList(map);
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
		recommendDao.recommendDeleteWithComment(commentNo);
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

	@Override
	public void commentDeleteWithBoard(int boardNo) {
		// TODO Auto-generated method stub
		commentDao.commentDelete(boardNo);
		recommendDao.recommendDeleteWithCommentParent(boardNo);
	}
}
