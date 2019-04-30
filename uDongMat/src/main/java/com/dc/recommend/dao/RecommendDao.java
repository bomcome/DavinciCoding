package com.dc.recommend.dao;

import java.util.Map;

import com.dc.recommend.vo.RecommendVo;

public interface RecommendDao {

	
	public void commentRecommendInsertOne(RecommendVo recommendVo);
	public void recommendInsertOne(RecommendVo recommendVo);
	public void recommendDelete(int recommendNo);
	
	public RecommendVo boardRecommendSelectOne(Map<String, Object> map);
	public RecommendVo commentRecommendSelectOne(Map<String, Object> map);
}
