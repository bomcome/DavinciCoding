package com.dc.recommend.service;

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

}
