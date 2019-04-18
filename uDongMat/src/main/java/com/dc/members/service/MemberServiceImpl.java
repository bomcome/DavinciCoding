package com.dc.members.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dc.members.dao.MemberDao;
import com.dc.members.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	public MemberDao memberDao;
	
	@Override
	public List<MemberVo> memberSelectList() {
		// TODO Auto-generated method stub
		return memberDao.memberSelectList();
	}

	@Override
	public MemberVo memberSelectOne(int memberNo) {
		// TODO Auto-generated method stub
		return memberDao.memberSelectOne(memberNo);
	}

	@Override
	public MemberVo memberExist(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		
		return memberDao.memberExist(paramMap);
	}

	@Override
	public int memberUpdateOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		
		return memberDao.memberUpdateOne(memberVo);
	}

	





}
