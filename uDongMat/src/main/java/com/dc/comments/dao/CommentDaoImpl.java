package com.dc.comments.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dc.comments.vo.CommentVo;
@Repository
public class CommentDaoImpl implements CommentDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.dc.comments.";

	@Override
	public List<CommentVo> commentSelectList(int boardNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("boardNo", boardNo);
	
		
		return sqlSession.selectList(namespace +"commentSelectList", map);
	}

	@Override
	public int commentSelectTotalCount(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +"commentSelectTotalCount", boardNo);
	}
}
