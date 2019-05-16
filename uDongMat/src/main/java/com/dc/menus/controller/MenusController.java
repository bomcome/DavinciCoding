package com.dc.menus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dc.menus.service.MenusService;
import com.dc.menus.vo.MenusVo;
import com.dc.restaurants.vo.RestaurantsVo;

@Controller
public class MenusController {

	private final Logger log = LoggerFactory.getLogger(MenusController.class);

	@Autowired
	private MenusService menusService;

	@RequestMapping(value = "/menus/list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String menusList(HttpServletRequest req, Model model) {

		log.debug("Welcome MenusController menusList! : {}", model);
		
		RestaurantsVo restaurantsVo = (RestaurantsVo)req.getAttribute("restaurantsVo");
		
		int restaurantKey = restaurantsVo.getRestaurantNo(); 
		
		List<MenusVo> menusList = menusService.menusSelectList(restaurantKey);

//		model.addAttribute("menusList", menusList);
		
		req.setAttribute("menusList", menusList);

		return "forward:/review/list.do";
	}
	
	@RequestMapping(value = "/menus/addCtr.do", method = RequestMethod.POST)
	public String menusAddCtr(HttpServletRequest req, Model model) {
		log.trace("Welcome MenusController menusAddCtr 신규등록 처리! ");
		
		RestaurantsVo restaurantsVo = (RestaurantsVo)req.getAttribute("restaurantsVo");
		
		int restaurantNo = restaurantsVo.getRestaurantNo(); 
		
		try {
			List<MenusVo> menusVoList = (List<MenusVo>)req.getAttribute("menusVoList");
			
			menusService.menusInsert(menusVoList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("아 오류 처리;");
			e.printStackTrace();
		}

		return "redirect:/restaurants/listOne.do?restaurantNo="+restaurantNo;
//		return "restaurants/listOne.do";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/menus/update.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String menusUpdate(HttpServletRequest req, Model model) {

		log.debug("Welcome MenusController menusUpdate! : {}", model);
		
		RestaurantsVo restaurantsVo = (RestaurantsVo)req.getAttribute("restaurantsVo");
		
		int restaurantKey = restaurantsVo.getRestaurantNo();
		
		List<MenusVo> menusList = menusService.menusSelectList(restaurantKey);

		model.addAttribute("menusList", menusList);

		return "restaurants/restaurantUpdateForm";
	}
	
	@RequestMapping(value = "/menus/updateCtr.do", method = RequestMethod.POST)
	public String menusUpdateCtr(HttpServletRequest req, Model model) throws Exception {

		RestaurantsVo restaurantsVo = (RestaurantsVo)req.getAttribute("restaurantsVo");
		
		int restaurantNo = restaurantsVo.getRestaurantNo(); 

//		menusService.menusDelete(restaurantNo);
		System.out.println("메뉴삭제");
			
		try {
			List<MenusVo> menusVoList = (List<MenusVo>)req.getAttribute("menusVoList");
			
			menusService.menusUpdate(menusVoList);
			System.out.println("메뉴추가");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("아 오류 처리;");
			e.printStackTrace();
		}
//		return "redirect:/review/list.do";
		return "redirect:/restaurants/listOne.do?restaurantNo="+restaurantNo;
//		return "restaurants/restaurantOneView";
	}
	
}
