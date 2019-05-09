package com.dc.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dc.review.dao.ReviewDao;
import com.dc.review.vo.ReviewVo;
@Service
public class ReviewServiceImpl implements ReviewService{
		
	@Autowired
	private ReviewDao reviewDao;

	@Override
	public List<ReviewVo> reviewSelectList(int restaurantNo) {
		// TODO Auto-generated method stub
		return reviewDao.reviewSelectList(restaurantNo);
	}

	@Override
	public int reviewSelectTotalCount(int restaurantNo) {
		// TODO Auto-generated method stub
		return reviewDao.reviewSelectTotalCount(restaurantNo);
	}

	@Override
	public void reviewInsertOne(ReviewVo reviewVo) {
		// TODO Auto-generated method stub
		reviewDao.reviewInsertOne(reviewVo);
	}

	@Override
	public void reviewUpdateOne(ReviewVo reviewVo) {
		// TODO Auto-generated method stub
		reviewDao.reviewUpdateOne(reviewVo);
	}

	@Override
	public ReviewVo reviewDetailOne(int reviewNo) {
		// TODO Auto-generated method stub
		return reviewDao.reviewDetailOne(reviewNo);
	}

	@Override
	public void reviewDelete(int reviewNo) {
		// TODO Auto-generated method stub
		reviewDao.reviewDelete(reviewNo);
	}

	
	
}
