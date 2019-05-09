package com.dc.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dc.board.vo.BoardVo;
import com.dc.comments.vo.CommentVo;
import com.dc.review.vo.ReviewVo;
@Repository
public class ReviewDaoImpl implements ReviewDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.dc.review.";

	@Override
	public List<ReviewVo> reviewSelectList(int restaurantNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +"commentSelectList", restaurantNo);
	}

	@Override
	public int reviewSelectTotalCount(int restaurantNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +"commentSelectTotalCount", restaurantNo);
	}

	@Override
	public void reviewInsertOne(ReviewVo reviewVo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace +"commentInsertOne", reviewVo);
	}

	@Override
	public void reviewUpdateOne(ReviewVo reviewVo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +"commentUpdateOne", reviewVo);
	}

	@Override
	public ReviewVo reviewDetailOne(int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +"commentDetailOne", reviewNo);
	}

	@Override
	public void reviewDelete(int reviewNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace +"commentDelete", reviewNo);
	}

	@Override
	public void reviewDeleteWithRestaurant(int restaurantNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace +"commentDeleteWithBoard", restaurantNo);
	}

	
}
