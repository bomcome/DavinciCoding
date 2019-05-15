package com.dc.comments.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dc.board.vo.BoardVo;
import com.dc.comments.vo.CommentVo;
@Repository
public class CommentDaoImpl implements CommentDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.dc.comments.";

	@Override
	public List<CommentVo> commentSelectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace +"commentSelectList", map);
	}

	@Override
	public int commentSelectTotalCount(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +"commentSelectTotalCount", boardNo);
	}

	@Override
	public void commentInsertOne(CommentVo commentVo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace +"commentInsertOne", commentVo);
	}

	@Override
	public void commentUpdateOne(CommentVo commentVo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +"commentUpdateOne", commentVo);
	}

	@Override
	public CommentVo commentDetailOne(int commentNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +"commentDetailOne", commentNo);
	}

	@Override
	public void commentDelete(int commentNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace +"commentDelete", commentNo);
	}

	@Override
	public void commentUpdateRecommendUp(int commentNo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +"commentUpdateRecommendUp", commentNo);
	}

	@Override
	public void commentUpdateRecommendDown(int commentNo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +"commentUpdateRecommendDown", commentNo);
	}

	@Override
	public void commentDeleteWithBoard(int boardNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace +"commentDeleteWithBoard", boardNo);
	}

	@Override
	public void commentDeleteWithMember(int memberNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace +"commentDeleteWithMember", memberNo);
	}
}
