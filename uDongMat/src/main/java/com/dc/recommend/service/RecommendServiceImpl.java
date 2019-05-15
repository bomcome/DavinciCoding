package com.dc.recommend.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dc.board.dao.BoardDao;
import com.dc.comments.dao.CommentDao;
import com.dc.recommend.dao.RecommendDao;
import com.dc.recommend.vo.RecommendVo;
@Service
public class RecommendServiceImpl implements RecommendService{

	@Autowired
	private RecommendDao recommendDao;
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private CommentDao commentDao;
	
	@Override
	public void recommendInsertOne(RecommendVo recommendVo) {
		// TODO Auto-generated method stub
		
		recommendDao.recommendInsertOne(recommendVo);
		boardDao.boardUpdateRecommendUp(recommendVo.getBoardNo());
	}

	@Override
	public void recommendDelete(RecommendVo recommendVo) {
		// TODO Auto-generated method stub
		recommendDao.recommendDelete(recommendVo.getRecommendNo());
		boardDao.boardUpdateRecommendDown(recommendVo.getBoardNo());
	}

	@Override
	public void commentRecommendInsertOne(RecommendVo recommendVo) {
		// TODO Auto-generated method stub
		recommendDao.commentRecommendInsertOne(recommendVo);
		commentDao.commentUpdateRecommendUp(recommendVo.getCommentNo());
	}

	@Override
	public void commentRecommendDelete(RecommendVo recommendVo) {
		// TODO Auto-generated method stub
		recommendDao.recommendDelete(recommendVo.getRecommendNo());
		commentDao.commentUpdateRecommendDown(recommendVo.getCommentNo());
	}
	
	@Override
	public RecommendVo boardRecommendSelectOne(int boardNo, int memberNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("memberNo", memberNo);
		return recommendDao.boardRecommendSelectOne(map);
	}

	@Override
	public RecommendVo commentRecommendSelectOne(int commentNo, int memberNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentNo", commentNo);
		map.put("memberNo", memberNo);
		
		return recommendDao.commentRecommendSelectOne(map);
	}
	@Override
	public void recommendDeleteWithCommentParent(int boardNo) {
		
	}
}
