package com.dc.members.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.dc.util.Paging;

@Controller
public class MemberController {

	private static final Logger log = 
			LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	//회원 전체보기
//	@RequestMapping(value="/member/list.do", method=RequestMethod.GET)
//	public String memberList(Model model) {
//		
//		log.debug("Welcome MemberController enter! ");
//		
//		List<MemberVo> memberList = memberService.memberSelectList();
//		
//		model.addAttribute("memberList", memberList);
//		
//		return "member/memberListView";
//	}

	@RequestMapping(value="/member/list.do"
			, method= {RequestMethod.GET, RequestMethod.POST})
	public String memberList(
			@RequestParam(defaultValue ="1") int curPage,
			@RequestParam(defaultValue ="title") String searchOption,
			@RequestParam(defaultValue ="") String keyword,
			Model model) {
		
		log.debug("Welcome MemberController memberList! : {}", curPage);
		log.debug(": {}", searchOption);
		log.debug(": {}", keyword);
		
		int totalCount = 
				memberService.memberSelectTotalCount(searchOption, keyword);
		
		Paging memberPaging = new Paging(totalCount, curPage);
		int start = memberPaging.getPageBegin();
		int end = memberPaging.getPageEnd();

		List<MemberVo> memberList = 
				memberService.memberSelectList(keyword, start, end, searchOption);
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("memberPaging", memberPaging);

		model.addAttribute("memberList", memberList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchOption", searchOption);
		
		return "member/memberListView";
	}
	
	//회원한명 보기
	@RequestMapping(value = "/member/listOne.do", method=RequestMethod.GET)
	public String memberListOne(MemberVo memberVo, Model model) {
		
		log.debug("Welcome memberListOne enter! - {}", memberVo);
		
		MemberVo memberVoChk = memberService.memberSelectOne(memberVo.getMemberNo());
		
		model.addAttribute("memberVo", memberVoChk);
		
	
	return "member/memberListOneView";
	}
	
	
	//회원 수정 페이지로 이동
	@RequestMapping(value = "/member/update.do",method = RequestMethod.GET)
	public String memberUpdate(	MemberVo memberVo, Model model,
			@RequestParam(defaultValue ="1") int overlapNickName,int memberNo) {
		log.debug("Welcome memberUpdate enter! - {}", memberVo);

		MemberVo memberVoChk = memberService.memberSelectOne(memberNo);
		
		model.addAttribute("memberVo", memberVoChk);
//		model.addAttribute("memberVo", memberVo);
		
		model.addAttribute("overlapNickName", overlapNickName);

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
	
	// 회원 수정 별명 증복 체크
	@RequestMapping(value = "/member/nickNamechkMove.do", method = RequestMethod.GET)
	public String chk(MemberVo memberVo, Model model,
			@RequestParam(defaultValue ="1") int overlapNickName) {
		log.debug("Welcome MemberController logout 페이지 이동! :{}",memberVo);
		
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("overlapNickName", overlapNickName);
		return "/member/memberUpdateForm";
	}
		

	
	//회원가입 페이지로 이동
	@RequestMapping(value = "/member/add.do", method = {RequestMethod.GET})
	public String memberAdd(MemberVo memberVo,  Model model,
			@RequestParam(defaultValue ="1") int overlapEmail,
			@RequestParam(defaultValue ="1") int overlapNickName) {
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
	//회원가입 이메일 증복 체크
	@RequestMapping(value = "/member/addEmailChkCtr.do", method = RequestMethod.POST)
	public String memberAddEmailChk(MemberVo memberVo,  Model model,
			@RequestParam(defaultValue ="1") int overlapEmail,
			@RequestParam(defaultValue ="1") int overlapNickName) {
		log.trace("Welcome MemberController memberAdd 증복체크 처리! " + memberVo);
		

	    MemberVo memberVoEmailChk = memberService.memberEmailChk(memberVo.getEmail());


	    if (memberVoEmailChk != null) {
			
	    	model.addAttribute("memberVo", memberVo);
	    	model.addAttribute("overlapEmail", 1);
	    	model.addAttribute("overlapNickName", overlapNickName);
	    	
		}else {
			 
			model.addAttribute("memberVo", memberVo);
			model.addAttribute("overlapEmail", 0);
			model.addAttribute("overlapNickName", overlapNickName);
		}

		return "member/memberEmailChk";
	}
	
	//별명 증복 체크
	@RequestMapping(value = "/member/nickNameChkCtr.do", method = RequestMethod.POST)
	public String memberAddNickNameChk(MemberVo memberVo,  Model model,
			@RequestParam(defaultValue ="1") int overlapEmail,
			@RequestParam(defaultValue ="1") int overlapNickName) {
		log.trace("Welcome MemberController memberAdd 증복체크 처리! " + memberVo);
		

	    MemberVo memberVoNickNameChk = memberService.memberNickNameChk(memberVo.getNickName());
	    
	   

	    if (memberVoNickNameChk != null) {
			 
	    	model.addAttribute("memberVo", memberVo);
	    	model.addAttribute("overlapNickName", 1);
	    	model.addAttribute("overlapEmail",overlapEmail);
	    	
		}else {
			 
			model.addAttribute("memberVo", memberVo);
			model.addAttribute("overlapNickName", 0);
			model.addAttribute("overlapEmail",overlapEmail);
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
	public String login(HttpServletRequest req, HttpSession session, Model model,
			@RequestParam(defaultValue ="1") int overlapNickName) {
		log.debug("Welcome MemberController login 페이지 이동! -{}" + session);

		String referer = req.getHeader("Referer");
		req.getSession().setAttribute("redirectURI", referer);
		return "auth/loginForm";
	}
	
	//로그인  완료
	@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
	public String loginCtr(HttpServletRequest req, String email, String password, HttpSession session, Model model) {
		log.debug("Welcome MemberController loginCtr! - {} , {}" + email ,password);

		String strURI = (String)req.getSession().getAttribute("redirectURI");
		String redirectURI = strURI.substring(strURI.lastIndexOf("uDongMat")+8);
		System.out.println(redirectURI);

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("email", email);
		paramMap.put("password", password);
		
	    MemberVo memberVo = memberService.memberExist(paramMap);
		
		String viewUrl = "";
		if (memberVo != null) {
			// 회원이 존재한다면 세션에 담고
			// 회원 전체 조회 페이지로 이동
			session.setAttribute("_memberVo_", memberVo);

			viewUrl = "redirect:"+ redirectURI;
		} else {
	
			viewUrl = "redirect:"+ redirectURI;
		}

		return viewUrl;
	}
	
	//로그아웃하기
	@RequestMapping(value = "/auth/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, HttpSession session, Model model) {
		log.debug("Welcome MemberController logout 페이지 이동! ");
		
		try {
			session.invalidate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String referer = (String)req.getHeader("Referer");
		String redirectURI = referer.substring(referer.lastIndexOf("uDongMat")+8);
		String viewUrl = "redirect:"+ redirectURI;
		System.out.println(referer);
		System.out.println(redirectURI);
		if (redirectURI.toString().indexOf("/restaurants/update.do") != -1 || redirectURI.toString().indexOf("/restaurants/add.do") != -1) {
			viewUrl = "redirect:/restaurants/list.do";
		}else if(redirectURI.toString().indexOf("/board/update.do") != -1 || redirectURI.toString().indexOf("/board/add.do") != -1) {
			viewUrl = "redirect:/board/list.do";
		}
		System.out.println(viewUrl);

		return viewUrl;
	}
	

}
