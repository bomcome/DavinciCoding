package com.dc.restaurants.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dc.menus.vo.MenusVo;
import com.dc.restaurants.vo.RestaurantsFileVo;
import com.dc.restaurants.vo.RestaurantsVo;

public interface RestaurantsService {
	
	public List<RestaurantsFileVo> restaurantsSelectList(String keyword);

	public List<RestaurantsFileVo> restaurantsSelectListOrder(String category);
	
	public List<RestaurantsFileVo> restaurantsSelectListSelect(String orderSelect);
	
	public Map<String, Object> restaurantsSelectOne(int restaurantNo);
	
	public void restaurantsInsertOne(RestaurantsVo restaurantsVo, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception;
	
	public int restaurantsUpdate(RestaurantsVo restaurantsVo, List<MenusVo> menusVoList, MultipartHttpServletRequest multipartHttpServletRequest, int fileIdx) throws Exception;
	
	public int restaurantsDelete(int restaurantNo) throws Exception;

}
