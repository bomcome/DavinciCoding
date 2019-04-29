package com.dc.members.dao;

import java.util.List;
import java.util.Map;

import com.dc.members.vo.MemberVo;

public interface MemberDao {

	public List<MemberVo> memberSelectList();					//회원 전체보기 
	
	public MemberVo memberSelectOne(int memberNo);				//회원 상세보기
	
	public MemberVo memberExist(Map<String, Object> paramMap);	//로그인하기	
	
	public int memberUpdateOne(MemberVo memberVo);				//회원 수정
	
	public int memberInsertOne(MemberVo memberVo);				//회원 추가
	
	public String memberEmailChk(String email);					//이메일 증복체크
	public String memberNickNameCHk(String nickName);			//닉네임 증복체크
	
	public int memberDelete(int memberNo);						//회원삭제
}
