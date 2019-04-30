package com.dc.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dc.board.service.BoardService;
import com.dc.board.vo.BoardVo;
import com.dc.members.vo.MemberVo;
import com.dc.recommend.service.RecommendService;
import com.dc.recommend.vo.RecommendVo;
import com.dc.util.Paging;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private RecommendService recommendService;
	
	@RequestMapping(value="/board/list.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String boardList(
			@RequestParam(defaultValue ="1") int curPage,
			@RequestParam(defaultValue ="") String keyword,
			Model model) {
		
		int totalCount = boardService.boardSelectTotalCount(keyword);
		
		Paging boardPaging = new Paging(totalCount, curPage);
		int start = boardPaging.getPageBegin();
		int end = boardPaging.getPageEnd();
		
		List<BoardVo> boardList = 
				boardService.boardSelectList(keyword, start, end);
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("boardPaging", boardPaging);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCount", totalCount);		
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("keyword", keyword);
		
		
		return "board/boardListView";
	}
	
	@RequestMapping(value="/board/one.do", method= {RequestMethod.GET})
	public String boardOne(Model model, int boardNo, HttpServletRequest req, HttpSession session) {

		MemberVo memberVo = (MemberVo)session.getAttribute("_memberVo_");
		
		if(memberVo != null) {
			System.out.println(memberVo.getMemberNo());
			BoardVo boardVo = boardService.boardSelectOne(boardNo, memberVo.getMemberNo());
			
			req.setAttribute("boardVo", boardVo);
		}else if(memberVo == null) {
			System.out.println(boardNo);
			BoardVo boardVo = boardService.boardSelectOne(boardNo);
			
			req.setAttribute("boardVo", boardVo);
		}
		
//		BoardVo boardVo = boardService.boardSelectOne(boardNo, memberVo.getMemberNo());
//		
//		req.setAttribute("boardVo", boardVo);
//		
		
		if(memberVo != null) {
			RecommendVo recommendVo = recommendService.boardRecommendSelectOne(boardNo, memberVo.getMemberNo());
			model.addAttribute("recommendVo", recommendVo);
		}
		
		return "forward:/comment/list.do";
		
	}
	
	@RequestMapping(value="/board/add.do", method= {RequestMethod.GET})
	public String boardAdd(Model model) {
		
		return "board/boardAddForm";
	}
	
	@RequestMapping(value="/board/addCtr.do", method= {RequestMethod.POST})
	public String boardAdd(HttpSession session, Model model, BoardVo boardVo) {
		
		boardService.boardInsertOne(boardVo);
		
		return "redirect:/board/one.do?boardNo=" + boardVo.getBoardNo();
	}
	
	@RequestMapping(value="/board/update.do", method= {RequestMethod.GET})
	public String boardUpdate(HttpSession session, Model model, int boardNo) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("_memberVo_");
		
		BoardVo boardVo = 
				boardService.boardSelectOne(boardNo, memberVo.getMemberNo());
		
		model.addAttribute("boardVo", boardVo);
		
		return "board/boardUpdateForm";
	}
	
	@RequestMapping(value="/board/updateCtr.do", method= {RequestMethod.POST})
	public String boardUpdate(BoardVo boardVo, int boardNo) {
		boardService.boardUpdateOne(boardVo);

		return "redirect:/board/one.do?boardNo=" + boardNo;
	}
	
	@RequestMapping(value="/board/delete.do", method= {RequestMethod.GET})
	public String boardDelete(int boardNo) {
		System.out.println(boardNo);
		
		boardService.boardDelete(boardNo);
		
		return "redirect:/board/list.do";
	}
	
	
}
