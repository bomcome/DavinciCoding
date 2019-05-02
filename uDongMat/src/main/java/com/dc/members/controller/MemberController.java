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
import org.springframework.web.bind.annotation.RequestParam;

import com.dc.members.service.MemberService;
import com.dc.members.vo.MemberVo;

@Controller
public class MemberController {

	private static final Logger log = 
			LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	//회원 전체보기
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
	
	
	//회원 수정 페이지로 이동
	@RequestMapping(value = "/member/update.do",method = RequestMethod.GET)
	public String memberUpdate(int memberNo, Model model) {
		log.debug("Welcome memberUpdate enter! - {}", memberNo);

		MemberVo memberVo = memberService.memberSelectOne(memberNo);

		model.addAttribute("memberVo", memberVo);

		return "member/memberUpdateForm";
	}
	//회원 수정 완료
	@RequestMapping(value = "/member/updateCtr.do",method = RequestMethod.POST)
	public String memberUpdateOne(HttpSession session, MemberVo memberVo,Model model) {
		log.debug("Welcome memberUpdateCtr enter! - {}", memberVo);
		
		
		try {
			 memberService.memberUpdateOne(memberVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


			MemberVo sessionMemberVo = (MemberVo) session.getAttribute("_memberVo_");
			
			// 세션에 객체가 존재하는지 여부
			if (sessionMemberVo != null) {
				// 세션의 값과 새로운 값이 일치하는지 여부
				// 홍길동 ㄴㅇㄹㄴㅇ
				// s1@test.com ㄴㅇㄹ33@
				// 1111 2222
				if (sessionMemberVo.getMemberNo() == memberVo.getMemberNo()) {
					MemberVo newMemberVo = new MemberVo();

					newMemberVo.setMemberNo(memberVo.getMemberNo());
					newMemberVo.setMemberGrade(memberVo.getMemberGrade());
					newMemberVo.setEmail(memberVo.getEmail());
					newMemberVo.setNickName(memberVo.getNickName());

					session.removeAttribute("_memberVo_");

					session.setAttribute("_memberVo_", newMemberVo);
				}
			}
			return "redirect:/restaurants/list.do";
		}
		

	
	//회원가입 페이지로 이동
	@RequestMapping(value = "/member/add.do", method = {RequestMethod.GET})
	public String memberAdd(
			@RequestParam(defaultValue ="1") int overlapEmail,
			@RequestParam(defaultValue ="1") int overlapNickName,
			Model model,MemberVo memberVo) {
		log.debug("Welcome MemberController memberAdd 페이지 이동!" + memberVo);
		
		//중복체크를 인한 값 넘기기
		model.addAttribute("overlapEmail", overlapEmail);
		model.addAttribute("overlapNickName", overlapNickName);
		
		return "member/memberForm";
	}
	
	//회원가입 완료
	@RequestMapping(value = "/member/addCtr.do", method = RequestMethod.POST)
	public String memberAdd(MemberVo memberVo,  Model model) {
		log.trace("Welcome MemberController memberAdd 신규등록 처리! " + memberVo);
		
			try {
				memberService.memberInsertOne(memberVo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		

		return "redirect:/auth/login.do";
	}
//	이메일 증복 체크
	@RequestMapping(value = "/member/addEmailChkCtr.do", method = RequestMethod.POST)
	public String memberAddEmailChk(MemberVo memberVo,  Model model) {
		log.trace("Welcome MemberController memberAdd 증복체크 처리! " + memberVo);
		

	    MemberVo memberVoEmailChk = memberService.memberEmailChk(memberVo.getEmail());


	    if (memberVoEmailChk != null) {
			
	    	model.addAttribute("memberVo", memberVo);
	    	model.addAttribute("overlapEmail", 1);
	    	
		}else {
			 
			model.addAttribute("memberVo", memberVo);
			model.addAttribute("overlapEmail", 0);
		}

		return "member/memberEmailChk";
	}
	
//	별명 증복 체크
	@RequestMapping(value = "/member/addNickNameChkCtr.do", method = RequestMethod.POST)
	public String memberAddNickNameChk(MemberVo memberVo,  Model model) {
		log.trace("Welcome MemberController memberAdd 증복체크 처리! " + memberVo);
		

	    MemberVo memberVoNickNameChk = memberService.memberNickNameChk(memberVo.getNickName());


	    if (memberVoNickNameChk != null) {
			
	    	model.addAttribute("memberVo", memberVo);
	    	model.addAttribute("overlapNickName", 1);
	    	
		}else {
			 
			model.addAttribute("memberVo", memberVo);
			model.addAttribute("overlapEmail", 0);
			model.addAttribute("overlapNickName", 0);
		}

		return "member/memberNickNameChk";
	}
	
	
	//회원 삭제
	@RequestMapping(value = "/member/deleteCtr.do", method = RequestMethod.GET)
	public String memberDelete(int memberNo, Model model,HttpSession session) {
		log.debug("Welcome MemberController memberDelete" + " 회원삭제 처리! - {}", memberNo);

		try {
			memberService.memberDelete(memberNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MemberVo sessionMemberVo = (MemberVo) session.getAttribute("_memberVo_");
		
		if (sessionMemberVo != null) {
		
			if (sessionMemberVo.getMemberNo() == memberNo) {


				session.removeAttribute("_memberVo_");

			}
		}
		return "redirect:/restaurants/list.do";
		
	}
	
	//로그인 페이지로 이동
	@RequestMapping(value = "/auth/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		log.debug("Welcome MemberController login 페이지 이동! -{}" + session);

		return "auth/loginForm";
	}
	
	//로그인  완료
	@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
	public String loginCtr(String email, String password, HttpSession session, Model model) {
		log.debug("Welcome MemberController loginCtr! - {} , {}" + email ,password);

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("email", email);
		paramMap.put("password", password);

		

		
	    MemberVo memberVo = memberService.memberExist(paramMap);
	
		
		String viewUrl = "";
		if (memberVo != null) {
			// 회원이 존재한다면 세션에 담고
			// 회원 전체 조회 페이지로 이동
			session.setAttribute("_memberVo_", memberVo);

			viewUrl = "redirect:/restaurants/list.do";
		} else {
			viewUrl = "/auth/loginFail";
		}

		return viewUrl;
	}
	
	//로그아웃하기
	@RequestMapping(value = "/auth/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		log.debug("Welcome MemberController logout 페이지 이동! ");

		// 세션의 객체들 파기
		session.invalidate();

		return "redirect:/auth/login.do";
	}

}
