package com.dc.members.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dc.board.service.BoardService;
import com.dc.members.dao.MemberDao;
import com.dc.members.vo.MemberVo;
import com.dc.restaurants.service.RestaurantsService;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	public MemberDao memberDao;
	
	@Autowired
	public BoardService boardService;
	
	@Autowired
	public RestaurantsService restaurantsService;
	
//	@Override
//	public List<MemberVo> memberSelectList() {
//		// TODO Auto-generated method stub
//		
//		return memberDao.memberSelectList();
//	}
	
	@Override
	public List<MemberVo> memberSelectList(String keyword, int start, int end, String searchOption) {
		// TODO Auto-generated method stub
		return memberDao.memberSelectList(keyword, start, end, searchOption);
	}
	
	@Override
	public int memberSelectTotalCount(String keyword, String searchOption) {
		// TODO Auto-generated method stub
		return memberDao.memberSelectTotalCount(keyword, searchOption);
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

	@Override
	public int memberInsertOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		
		return memberDao.memberInsertOne(memberVo);
	}

	@Override
	public int memberDelete(int memberNo) {
		// TODO Auto-generated method stub
		restaurantsService.restaurantsDeleteMemberNo(memberNo);
		boardService.boardDeleteWithMember(memberNo);
		return memberDao.memberDelete(memberNo);
	}

	@Override
	public MemberVo memberEmailChk(String email) {
		// TODO Auto-generated method stub
		return memberDao.memberEmailChk(email);
	}

	@Override
	public MemberVo memberNickNameChk(String nickName) {
		// TODO Auto-generated method stub
		return memberDao.memberNickNameChk(nickName);
	}

}
