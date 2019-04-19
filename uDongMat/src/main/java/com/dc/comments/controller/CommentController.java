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

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value="/comment/list.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String commentList(HttpServletRequest req, Model model) {
		System.out.println("comment");
		BoardVo boardVo = (BoardVo)req.getAttribute("boardVo");
		
		int totalCount = commentService.commentSelectTotalCount(boardVo.getBoardNo());
		
		List<CommentVo> commentList = 
				commentService.commentSelectList(boardVo.getBoardNo());
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("totalCount", totalCount);		
		
		return "board/boardOneView";
	}
}
