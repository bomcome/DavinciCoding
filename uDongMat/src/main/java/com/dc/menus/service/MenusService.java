package com.dc.menus.service;

import java.util.List;

import com.dc.menus.vo.MenusVo;
import com.dc.restaurants.vo.RestaurantsVo;

public interface MenusService {
	
	public List<MenusVo> menusSelectList(int restaurantKey);
	
	public void menusInsert(List<MenusVo> menusVoList);
	
	public void menusUpdate(List<MenusVo> menusVoList) throws Exception;
	
	public int menusDelete(int restaurantNo) throws Exception;

	public int menusDeleteMemberNo(int memberNo) throws Exception;

}
