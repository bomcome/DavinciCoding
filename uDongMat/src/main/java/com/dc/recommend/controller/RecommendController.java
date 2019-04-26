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
	
	
	@RequestMapping(value="/recommend/recommendUpCtr.do", method= {RequestMethod.GET})
	public String commentRecommendAdd(HttpSession session, Model model, RecommendVo recommendVo, int commentNo) {
	
		recommendService.recommendInsertOne(recommendVo);
		commentService.commentUpdateRecommendUp(commentNo);
		
		return "redirect:/board/one.do?boardNo=" + recommendVo.getBoardNo();
	}
	
	@RequestMapping(value="/recommend/recommendDownCtr.do", method= {RequestMethod.GET})
	public String commentRecommendDelete(int recommendNo, int commentNo, int memberNo) {
		System.out.println(commentNo);
		
		recommendService.recommendDelete(recommendNo);
		commentService.commentUpdateRecommendDown(commentNo);
		
		return "redirect:/board/one.do?boardNo=" + commentNo;
	}
	
	@RequestMapping(value="/recommend/addboardCtr.do", method= {RequestMethod.POST})
	public String boardRecommendAdd(HttpSession session, Model model, RecommendVo recommendVo) {
		recommendService.boardRecommendSelectOne(recommendVo.getBoardNo(), recommendVo.getMemberNo());
		recommendService.recommendInsertOne(recommendVo);
		
		
		return "redirect:/board/one.do?boardNo=" + recommendVo.getBoardNo();
	}
	
	@RequestMapping(value="/recommend/deleteboard.do", method= {RequestMethod.GET})
	public String boardRecommendDelete(int recommendNo, int boardNo, int memberNo) {
		System.out.println(boardNo);
		
		recommendService.recommendDelete(recommendNo);
		
		return "redirect:/board/one.do?boardNo=" + boardNo;
	}
}
