package com.dc.members.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dc.members.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.dc.members.";
	
	@Override
	public List<MemberVo> memberSelectList() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace + "memberSelectList");
	}

	@Override
	public MemberVo memberSelectOne(int memberNo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "memberSelectOne", memberNo);
	}

	@Override
	public MemberVo memberExist(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberExist", paramMap);
	}

	@Override
	public int memberUpdateOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "memberUpdateOne",memberVo);
	} 

}
