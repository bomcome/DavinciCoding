package com.dc.recommend.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dc.board.service.BoardService;
import com.dc.comments.service.CommentService;
import com.dc.recommend.service.RecommendService;
import com.dc.recommend.vo.RecommendVo;

@Controller
public class RecommendController {

	@Autowired
	private BoardService boardService;
	private CommentService commentService;
	private RecommendService recommendService;
	
	
	@RequestMapping(value="/recommend/addCtr.do", method= {RequestMethod.POST})
	public String recommendAdd(HttpSession session, Model model, RecommendVo recommendVo) {
	
		recommendService.recommendInsertOne(recommendVo);
		
		return "redirect:/board/one.do?boardNo=" + recommendVo.getBoardNo();
	}
	
	@RequestMapping(value="/recommend/delete.do", method= {RequestMethod.GET})
	public String recommendDelete(int recommendNo, int boardNo, int memberNo) {
		System.out.println(boardNo);
		
		recommendService.recommendDelete(recommendNo);
		
		return "redirect:/board/one.do?boardNo=" + boardNo;
	}
	
}
