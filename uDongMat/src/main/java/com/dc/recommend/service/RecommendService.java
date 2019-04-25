package com.dc.recommend.service;

import com.dc.recommend.vo.RecommendVo;

public interface RecommendService {

	public void recommendInsertOne(RecommendVo recommendVo);
	public void recommendDelete(int recommendNo);
}
