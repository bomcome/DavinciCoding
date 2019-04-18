package com.dc.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dc.board.service.BoardService;
import com.dc.board.vo.BoardVo;
import com.dc.util.Paging;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
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
		
		
//		int totalCount = 
//				memberService.memberSelectTotalCount(searchOption, keyword);
//		
//		Paging memberPaging = new Paging(totalCount, curPage);
//		int start = memberPaging.getPageBegin();
//		int end = memberPaging.getPageEnd();
//
//		List<MemberVo> memberList = 
//				memberService.memberSelectList(
//						searchOption, keyword, start, end);
//		
//		Map<String, Object> pagingMap = new HashMap<>();
//		pagingMap.put("totalCount", totalCount);
//		pagingMap.put("memberPaging", memberPaging);
//
//		model.addAttribute("memberList", memberList);
//		model.addAttribute("pagingMap", pagingMap);
//		model.addAttribute("keyword", keyword);
		
		
		
		
		
		return "board/boardListView";
	}
	
	@RequestMapping(value="/board/one.do", method= {RequestMethod.GET})
	public String boardOne(Model model, int boardNo) {
		
		BoardVo boardVo = 
				boardService.boardSelectOne(boardNo);
		
		model.addAttribute("boardVo", boardVo);
		
		return "board/boardOneView";
	}
	
	@RequestMapping(value="/board/add.do", method= {RequestMethod.GET})
	public String boardAdd(Model model) {
		
		return "board/boardAddForm";
	}
	
	@RequestMapping(value="/board/addCtr.do", method= {RequestMethod.POST})
	public String boardAdd(Model model, BoardVo boardVo) {
		
		boardService.boardInsertOne(boardVo);
		
		return "board/boardListView";
	}
	
	@RequestMapping(value="/board/update.do", method= {RequestMethod.GET})
	public String boardUpdate(Model model, int boardNo) {
		
		BoardVo boardVo = 
				boardService.boardSelectOne(boardNo);
		
		model.addAttribute("boardVo", boardVo);
		
		return "board/boardUpdateForm";
	}
	
	@RequestMapping(value="/board/updateCtr.do", method= {RequestMethod.POST})
	public String boardUpdate(BoardVo boardVo, int boardNo) {
		boardService.boardUpdateOne(boardVo);

		return "forward:/board/one.do?boardNo=" + boardNo;
	}
	
	@RequestMapping(value="/board/delete.do", method= {RequestMethod.GET})
	public String boardDelete(int boardNo) {
		System.out.println(boardNo);
		
		boardService.boardDelete(boardNo);
		
		return "redirect:/board/list.do";
	}
	
	
}
