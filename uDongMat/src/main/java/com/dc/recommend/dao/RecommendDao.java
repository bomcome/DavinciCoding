package com.dc.recommend.dao;

import com.dc.recommend.vo.RecommendVo;

public interface RecommendDao {

	public void recommendInsertOne(RecommendVo recommendVo);
	public void recommendDelete(int recommendNo);
}
