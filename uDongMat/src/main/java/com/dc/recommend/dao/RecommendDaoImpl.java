package com.dc.recommend.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dc.recommend.vo.RecommendVo;
@Repository
public class RecommendDaoImpl implements RecommendDao{

	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.dc.recommend.";
	
	
	@Override
	public void recommendInsertOne(RecommendVo recommendVo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace +"recommendInsertOne", recommendVo);
	}

	@Override
	public void recommendDelete(int recommendNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace +"recommendInsertOne", recommendNo);
	}

}
