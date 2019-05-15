package com.dc.restaurants.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dc.menus.vo.MenusVo;
import com.dc.restaurants.service.RestaurantsService;
import com.dc.restaurants.vo.RestaurantsFileVo;
import com.dc.restaurants.vo.RestaurantsVo;
import com.dc.util.Paging2;

@Controller
public class RestaurantsController {

	private final Logger log = LoggerFactory.getLogger(RestaurantsController.class);

	@Autowired
	private RestaurantsService restaurantsService;
	
	@RequestMapping(value = "/restaurants/list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String restaurantsList(@RequestParam(defaultValue ="1") int curPage, 
            @RequestParam(defaultValue ="0") double currentScroll, @RequestParam(defaultValue = "") String keyword, Model model) {

		log.debug("Welcome RestaurantsController memberList! : {}", keyword);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("keyword", keyword);
		
		int totalCount = restaurantsService.restaurantsTotalCount(resultMap);
		
	    Paging2 restaurantPaging = new Paging2(totalCount, curPage);
	    
	    int end = restaurantPaging.getPageEnd();

		
		List<RestaurantsFileVo> restaurantsList = restaurantsService.restaurantsSelectList(keyword, end);
		
		Map<String, Object> pagingMap = new HashMap<>();
	    pagingMap.put("totalCount", totalCount);
	    pagingMap.put("restaurantPaging", restaurantPaging);

	    int pageScale = restaurantPaging.getPageScale();
		
		model.addAttribute("pageScale", pageScale);
//	    model.addAttribute("totalCount", totalCount);      
	    model.addAttribute("pagingMap", pagingMap);

		model.addAttribute("restaurantsList", restaurantsList);
		model.addAttribute("keyword", keyword);
		model.addAttribute("curPage", curPage);
		model.addAttribute("currentScroll", currentScroll);

		return "restaurants/restaurantListView";
	}
	
	@RequestMapping(value = "/restaurants/listCategory.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String restaurantsListCategory(@RequestParam(defaultValue ="1") int curPage, 
            @RequestParam(defaultValue ="0") double currentScroll, @RequestParam(defaultValue = "") String category, Model model) {

		log.debug("Welcome RestaurantsController memberList! : {}", category);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("category", category);
		
		int totalCount = restaurantsService.restaurantsTotalCountCategory(resultMap);
		
	    Paging2 restaurantPaging = new Paging2(totalCount, curPage);
	    
	    int end = restaurantPaging.getPageEnd();
		
		List<RestaurantsFileVo> restaurantsList = restaurantsService.restaurantsSelectListCategory(category, end);

		Map<String, Object> pagingMap = new HashMap<>();
	    pagingMap.put("totalCount", totalCount);
	    pagingMap.put("restaurantPaging", restaurantPaging);

	    int pageScale = restaurantPaging.getPageScale();
		
		model.addAttribute("restaurantsList", restaurantsList);
		model.addAttribute("category", category);
;
		model.addAttribute("curPage", curPage);
		model.addAttribute("currentScroll", currentScroll);
		model.addAttribute("pageScale", pageScale);
//	    model.addAttribute("totalCount", totalCount);      
	    model.addAttribute("pagingMap", pagingMap);
		return "restaurants/restaurantListView";
	}
	
	@RequestMapping(value = "/restaurants/listOrder.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String restaurantsListOrder(@RequestParam(defaultValue ="1") int curPage, 
            @RequestParam(defaultValue ="0") double currentScroll, @RequestParam(defaultValue = "") String order, Model model) {
		
		log.debug("Welcome RestaurantsController memberList! : {}", order);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("order", order);
		
		int totalCount = restaurantsService.restaurantsTotalCountOrder(resultMap);
		
	    Paging2 restaurantPaging = new Paging2(totalCount, curPage);
	    
	    int end = restaurantPaging.getPageEnd();
		
		List<RestaurantsFileVo> restaurantsList = restaurantsService.restaurantsSelectListOrder(order, end);
		
		
		
		Map<String, Object> pagingMap = new HashMap<>();
	    pagingMap.put("totalCount", totalCount);
	    pagingMap.put("restaurantPaging", restaurantPaging);

	    int pageScale = restaurantPaging.getPageScale();
		
		model.addAttribute("curPage", curPage);
		model.addAttribute("currentScroll", currentScroll);
		model.addAttribute("pageScale", pageScale);
//	    model.addAttribute("totalCount", totalCount);      
	    model.addAttribute("pagingMap", pagingMap);
		
		model.addAttribute("restaurantsList", restaurantsList);
		model.addAttribute("order", order);
		
		return "restaurants/restaurantListView";
	}
	
	@RequestMapping(value = "/restaurants/listOne.do")
	public String restaurantsListOne(int restaurantNo, HttpServletRequest req, Model model) {
		log.debug("Welcome RestaurantsListOne enter! - {}", restaurantNo);

		Map<String, Object> map = restaurantsService.restaurantsSelectOne(restaurantNo);

		RestaurantsVo restaurantsVo = (RestaurantsVo) map.get("restaurantsVo");
		List<Map<String, Object>> fileList = (List<Map<String, Object>>)map.get("fileList");
		
//		model.addAttribute("restaurantsVo", restaurantsVo);
		
		req.setAttribute("restaurantsVo", restaurantsVo);
		req.setAttribute("fileList", fileList);

		return "forward:/menus/list.do";
	}
	
	@RequestMapping(value = "/restaurants/add.do", method = RequestMethod.GET)
	public String restaurantAdd(Model model) {
		log.debug("Welcome RestaurantsController restaurantsAdd 페이지 이동! ");

		return "restaurants/restaurantAddForm";
	}
	
//	@RequestMapping(value = "/restaurants/addCtr.do", method = RequestMethod.POST)
//	public String restaurantAddCtr(RestaurantsVo restaurantsVo, MenusVo menusVo, HttpServletRequest req, Model model) {
//		log.trace("Welcome RestaurantsController restaurantAddCtr 신규등록 처리! " + restaurantsVo + "\n" + menusVo);
//
//		try {
//			restaurantsService.restaurantsInsertOne(restaurantsVo);
//			
//			menusVo.setRestaurantNo(restaurantsVo.getRestaurantNo());
//			
//			req.setAttribute("menusVo", menusVo);
//			
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			System.out.println("아 오류 처리;");
//			e.printStackTrace();
//		}
//
//		return "forward:/menus/addCtr.do";
//	}
	
	@RequestMapping(value = "/restaurants/addCtr.do", method = RequestMethod.POST)
	public String restaurantAddCtr(RestaurantsVo restaurantsVo, String[] menuName, int[] price,
			MultipartHttpServletRequest multipartHttpServletRequest, HttpServletRequest req, Model model) {
		log.trace("Welcome RestaurantsController restaurantAddCtr 신규등록 처리! " + restaurantsVo + "\n");

		List<MenusVo> menusVoList = new ArrayList<MenusVo>();
		try {
			restaurantsService.restaurantsInsertOne(restaurantsVo, multipartHttpServletRequest);

			MenusVo menusVo = null;

			for (int i = 0; i < menuName.length; i++) {
				menusVo = new MenusVo(restaurantsVo.getRestaurantNo(), menuName[i], price[i]);
				menusVoList.add(menusVo);
			}
			
			req.setAttribute("menusVoList", menusVoList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("아 오류 처리;");
			e.printStackTrace();
		}

//		return "/home";
		return "forward:/menus/addCtr.do";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/restaurants/update.do" , method = RequestMethod.GET)
	public String restaurantsUpdate(int restaurantNo, HttpServletRequest req, Model model) {
		log.debug("Welcome RestaurantsUpdate enter! - {}", restaurantNo);

		Map<String, Object> map = restaurantsService.restaurantsSelectOne(restaurantNo);

		RestaurantsVo restaurantsVo = (RestaurantsVo) map.get("restaurantsVo");
		List<Map<String, Object>> fileList = (List<Map<String, Object>>)map.get("fileList");
		
//		model.addAttribute("restaurantsVo", restaurantsVo);
		
		req.setAttribute("restaurantsVo", restaurantsVo);
		req.setAttribute("fileList", fileList);

		return "forward:/menus/update.do";
	}
	
	@RequestMapping(value = "/restaurants/updateCtr.do", method = RequestMethod.POST)
	public String restaurantsUpdateCtr(RestaurantsVo restaurantsVo, String[] menuName, int[] price
			, @RequestParam(value="fileIdx", defaultValue="-1") int fileIdx
			, MultipartHttpServletRequest multipartHttpServletRequest, HttpServletRequest req, Model model) {
		log.debug("Welcome  RestaurantsController restaurantsUpdateCtr {} :: {}", restaurantsVo, fileIdx);

		List<MenusVo> menusVoList = new ArrayList<MenusVo>();
	
		int resultNum = 0;

		try {
			resultNum = restaurantsService.restaurantsUpdate(restaurantsVo, menusVoList, multipartHttpServletRequest, fileIdx);
			
			MenusVo menusVo = null;

			for (int i = 0; i < menuName.length; i++) {
				menusVo = new MenusVo(restaurantsVo.getRestaurantNo(), menuName[i], price[i]);
				menusVoList.add(menusVo);
			}
			
			req.setAttribute("menusVoList", menusVoList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "forward:/menus/updateCtr.do";
//		return "redirect:/restaurants/list.do";
	}
	
	@RequestMapping(value = "/restaurants/deleteCtr.do", method = RequestMethod.GET)
	public String rstaurantsDelete(@RequestParam(value = "restaurantNo") int restaurantNo, Model model) {
		log.debug("Welcome RestaurantsController RestaurantsDelete" + " 식당삭제 처리! - {}", restaurantNo);

		try {
			restaurantsService.restaurantsDelete(restaurantNo);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/restaurants/list.do";
	}
		
}
