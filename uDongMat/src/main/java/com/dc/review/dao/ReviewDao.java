package com.dc.review.dao;

import java.util.List;

import com.dc.review.vo.ReviewVo;

public interface ReviewDao{
	
	public List<ReviewVo> reviewSelectList(int restaurantNo);
	public int reviewSelectTotalCount(int restaurantNo);
	public void reviewInsertOne(ReviewVo reviewVo);
	public void reviewUpdateOne(ReviewVo reviewVo);
	public ReviewVo reviewDetailOne(int reviewNo);
	public void reviewDelete(int reviewNo);
	public void reviewDeleteWithRestaurant(int restaurantNo);
}
