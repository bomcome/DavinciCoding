package com.dc.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dc.board.vo.BoardVo;
import com.dc.comments.vo.CommentVo;
import com.dc.restaurants.vo.RestaurantsVo;
import com.dc.review.service.ReviewService;
import com.dc.review.vo.ReviewVo;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
//	private RecommendService recommendService;
	
	@RequestMapping(value="/review/list.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewList(HttpServletRequest req, Model model) {
		
		RestaurantsVo restaurantsVo = (RestaurantsVo)req.getAttribute("restaurantsVo");
		
		int totalCount = reviewService.reviewSelectTotalCount(restaurantsVo.getRestaurantNo());
		
		List<ReviewVo> reviewList = 
				reviewService.reviewSelectList(restaurantsVo.getRestaurantNo());
		
//		RecommendVo recommendVo = recommendService.commentRecommendSelectOne(recommendVo);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("totalCount", totalCount);		
		
		return "review/reviewListView";
	}
	
	
	@RequestMapping(value="/review/addCtr.do", method= {RequestMethod.POST})
	public String commentAdd(HttpServletRequest req, Model model, ReviewVo reviewVo) {	
		
		reviewService.reviewInsertOne(reviewVo);
		
		return "redirect:/restaurants/one.do?restaurantNo=" + reviewVo.getRestaurantNo();
	}
	
	@RequestMapping(value="/review/update.do", method= {RequestMethod.GET})
	public String reviewUpdate(int reviewNo, Model model, ReviewVo reviewVo) {	
		
		reviewVo = reviewService.reviewDetailOne(reviewNo);
		
		model.addAttribute("reviewVo", reviewVo);
		
		return "/review/reviewUpdateForm";
	}
	
	@RequestMapping(value="/review/updateCtr.do", method= {RequestMethod.POST})
	public String commentUpdate(int reviewNo, ReviewVo reviewVo) {	
		
		reviewService.reviewUpdateOne(reviewVo);
		
		return "redirect:/restaurants/one.do?restaurantNo=" + reviewVo.getRestaurantNo();
	}
	
	@RequestMapping(value="/review/delete.do", method= {RequestMethod.GET})
	public String commentDelete(int reviewNo, int restaurantNo) {
		System.out.println(reviewNo);
		
		reviewService.reviewDelete(reviewNo);
		
		return "redirect:/restaurants/one.do?restaurantNo=" + restaurantNo;
	}
	
}
