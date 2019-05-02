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

	
//	@Autowired
//	private CommentService commentService;
	@Autowired
	private RecommendService recommendService;
	
	
	@RequestMapping(value="/recommend/addCommentCtr.do", method= {RequestMethod.POST})
	public String commentRecommendAdd(HttpSession session, Model model, RecommendVo recommendVo, int boardNo) {
		System.out.println(recommendVo);
		RecommendVo recommendVo2 = recommendService.commentRecommendSelectOne(recommendVo.getCommentNo(), recommendVo.getMemberNo());
		if(recommendVo2 == null) {
			System.out.println(recommendVo2);
			recommendService.commentRecommendInsertOne(recommendVo);
		}else if(recommendVo2 != null) {
			recommendService.commentRecommendDelete(recommendVo2);
		}
		
//		recommendService.commentRecommendInsertOne(recommendVo);
//		commentService.commentUpdateRecommendUp(commentNo);
		
		return "redirect:/board/one.do?boardNo=" + boardNo;
	}
	
//	@RequestMapping(value="/recommend/deleteComment.do", method= {RequestMethod.GET})
//	public String commentRecommendDelete(int recommendNo, int commentNo, int memberNo) {
//		System.out.println(commentNo);
//		
//		RecommendVo recommendVo = recommendService.commentRecommendSelectOne(commentNo, memberNo);
//		recommendService.recommendDelete(recommendVo);
//		
//		return "redirect:/board/one.do?boardNo=" + boardNo;
//	}
	
	@RequestMapping(value="/recommend/addBoardCtr.do", method= {RequestMethod.POST})
	public String boardRecommendAdd(HttpSession session, Model model, RecommendVo recommendVo) {
//		recommendService.boardRecommendSelectOne(recommendVo.getBoardNo(), recommendVo.getMemberNo());
		
		recommendService.recommendInsertOne(recommendVo);
		
		
		return "redirect:/board/one.do?boardNo=" + recommendVo.getBoardNo();
	}
	
	@RequestMapping(value="/recommend/deleteBoard.do", method= {RequestMethod.GET})
	public String boardRecommendDelete(int boardNo, int memberNo) {
		
		RecommendVo recommendVo = recommendService.boardRecommendSelectOne(boardNo, memberNo);
		recommendService.recommendDelete(recommendVo);

		
		return "redirect:/board/one.do?boardNo=" + boardNo;
	}
}
