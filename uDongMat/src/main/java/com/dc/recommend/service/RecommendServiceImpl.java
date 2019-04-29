package com.dc.recommend.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dc.recommend.dao.RecommendDao;
import com.dc.recommend.vo.RecommendVo;
@Service
public class RecommendServiceImpl implements RecommendService{

	@Autowired
	private RecommendDao recommendDao;

	
	@Override
	public void recommendInsertOne(RecommendVo recommendVo) {
		// TODO Auto-generated method stub
		recommendDao.recommendInsertOne(recommendVo);
	}

	@Override
	public void recommendDelete(int recommendNo) {
		// TODO Auto-generated method stub
		recommendDao.recommendDelete(recommendNo);
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
		map.put("boardNo", commentNo);
		map.put("memberNo", memberNo);
		return recommendDao.commentRecommendSelectOne(map);
	}

}
