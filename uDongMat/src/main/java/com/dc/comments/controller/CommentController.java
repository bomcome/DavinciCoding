package com.dc.comments.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dc.board.vo.BoardVo;
import com.dc.comments.service.CommentService;
import com.dc.comments.vo.CommentVo;
import com.dc.recommend.service.RecommendService;
import com.dc.recommend.vo.RecommendVo;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
//	private RecommendService recommendService;
	
	@RequestMapping(value="/comment/list.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String commentList(HttpServletRequest req, Model model) {
		
		BoardVo boardVo = (BoardVo)req.getAttribute("boardVo");
		
		int totalCount = commentService.commentSelectTotalCount(boardVo.getBoardNo());
		
		List<CommentVo> commentList = 
				commentService.commentSelectList(boardVo.getBoardNo());
		
//		RecommendVo recommendVo = recommendService.commentRecommendSelectOne(recommendVo);
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("totalCount", totalCount);		
		
		return "board/boardOneView";
	}
	
	@RequestMapping(value="/comment/addCtr.do", method= {RequestMethod.POST})
	public String commentAdd(HttpServletRequest req, Model model, CommentVo commentVo) {	
		
		commentService.commentInsertOne(commentVo);
		
		return "redirect:/board/one.do?boardNo=" + commentVo.getBoardNo();
	}
	
	@RequestMapping(value="/comment/update.do", method= {RequestMethod.GET})
	public String commentUpdate(int commentNo, Model model, CommentVo commentVo) {	
		
		commentVo = commentService.commentDetailOne(commentNo);
		
		model.addAttribute("commentVo", commentVo);
		
		return "/comments/commentUpdateForm";
	}
	
	@RequestMapping(value="/comment/updateCtr.do", method= {RequestMethod.POST})
	public String commentUpdate(int commentNo, CommentVo commentVo) {	
		
		commentService.commentUpdateOne(commentVo);
		
		return "redirect:/board/one.do?boardNo=" + commentVo.getBoardNo();
	}
	
	@RequestMapping(value="/comment/delete.do", method= {RequestMethod.GET})
	public String commentDelete(int commentNo, int boardNo) {
		System.out.println(commentNo);
		
		commentService.commentDelete(commentNo);
		
		return "redirect:/board/one.do?boardNo=" + boardNo;
	}
	
}
