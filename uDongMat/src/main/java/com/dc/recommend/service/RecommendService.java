package com.dc.recommend.service;

import com.dc.recommend.vo.RecommendVo;

public interface RecommendService {

	public void recommendInsertOne(RecommendVo recommendVo);
	public void recommendDelete(RecommendVo recommendVo);
	
	public RecommendVo boardRecommendSelectOne(int boardNo, int memberNo);
	public RecommendVo commentRecommendSelectOne(int commentNo, int memberNo);
	void commentRecommendInsertOne(RecommendVo recommendVo);
	void commentRecommendDelete(RecommendVo recommendVo);
	public void recommendDeleteWithCommentParent(int boardNo);

}
