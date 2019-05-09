package com.dc.review.service;

import java.util.List;

import com.dc.board.vo.BoardVo;
import com.dc.comments.vo.CommentVo;
import com.dc.review.vo.ReviewVo;

public interface ReviewService {
	
	public List<ReviewVo> reviewSelectList(int restaurantNo);
	public int reviewSelectTotalCount(int restaurantNo);
	public void reviewInsertOne(ReviewVo reviewVo);
	public void reviewUpdateOne(ReviewVo reviewVo);
	public ReviewVo reviewDetailOne(int reviewNo);
	public void reviewDelete(int reviewNo);

}
