package com.dc.members.dao;

import java.util.HashMap;
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
	
//	@Override
//	public List<MemberVo> memberSelectList() {
//		// TODO Auto-generated method stub
//		
//		return sqlSession.selectList(namespace + "memberSelectList");
//	}
	
	@Override
	public List<MemberVo> memberSelectList(String keyword, int start, int end, String searchOption) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("searchOption", searchOption);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(namespace +"memberSelectList", map);
	}
	
	@Override
	public int memberSelectTotalCount(String keyword, String searchOption) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("searchOption", searchOption);
		return sqlSession.selectOne(namespace +"memberSelectTotalCount", map);
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
		return sqlSession.update(namespace + "memberUpdateOne", memberVo);
	}

	@Override
	public int memberInsertOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "memberInsertOne", memberVo);
	}

	@Override
	public int memberDelete(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "memberDelete", memberNo);
	}

	@Override
	public MemberVo memberEmailChk(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberEmailChk", email);
	}

	@Override
	public MemberVo memberNickNameChk(String nickName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberNickNameCHk", nickName);
	}

}
