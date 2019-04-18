package com.dc.members.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dc.members.service.MemberService;
import com.dc.members.vo.MemberVo;

@Controller
public class MemberController {

	private static final Logger log = 
			LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	

	@RequestMapping(value="/member/list.do", method=RequestMethod.GET)
	public String memberList(Model model) {
		
		log.debug("Welcome MemberController enter! ");
		
		List<MemberVo> memberList = memberService.memberSelectList();
		
		model.addAttribute("memberList", memberList);
		
		return "member/memberListView";
	}
	//회원한명 보기
	@RequestMapping(value = "/member/listOne.do", method=RequestMethod.GET)
	public String memberListOne(int memberNo, Model model) {
		
		log.debug("Welcome memberListOne enter! - {}", memberNo);
		
		MemberVo memberVo = memberService.memberSelectOne(memberNo);
		
		model.addAttribute("memberVo", memberVo);
		
	
	return "member/memberListOneView";
	}
	
	//로그인 폼으로 보내기
	@RequestMapping(value = "/auth/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		log.debug("Welcome MemberController login 페이지 이동! ");

		return "auth/loginForm";
	}
	
	@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
	public String loginCtr(String email, String password, HttpSession session, Model model) {
		log.debug("Welcome MemberController loginCtr! -{} ,{}" + email, password);

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("email", email);
		paramMap.put("password", password);

		MemberVo memberVo = memberService.memberExist(paramMap);

		String viewUrl = "";
		if (memberVo != null) {
			// 회원이 존재한다면 세션에 담고
			// 회원 전체 조회 페이지로 이동
			session.setAttribute("_memberVo_", memberVo);

			viewUrl = "redirect:/member/list.do";
		} else {
			viewUrl = "/auth/loginFail";
		}

		return viewUrl;
	}
	
	@RequestMapping(value = "/member/update.do",method = RequestMethod.GET)
	public String memberUpdate(int memberNo, Model model) {
		log.debug("Welcome memberUpdate enter! - {}", memberNo);

		MemberVo memberVo = memberService.memberSelectOne(memberNo);

		model.addAttribute("memberVo", memberVo);

		return "member/memberUpdateForm";
	}
	
	//회원가입
	@RequestMapping(value = "/member/add.do", method = RequestMethod.GET)
	public String memberAdd(Model model) {
		log.debug("Welcome MemberController memberAdd 페이지 이동! ");
		
		return "member/memberForm";
	}
	
	
	

}
