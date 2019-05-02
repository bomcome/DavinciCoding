package com.dc.restaurants.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dc.menus.vo.MenusVo;
import com.dc.restaurants.vo.RestaurantsVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class RestaurantsServiceImplTest {

	@Autowired
	RestaurantsServiceImpl restaurantsServiceImpl;

	/*
	 * @Test
	 * 
	 * private void testRestaurantsUpdate() { // TODO Auto-generated method stub
	 * 
	 * RestaurantsVo restaurantsVo = new RestaurantsVo(25, 1, "동내분식05", "분식",
	 * "0317411928", "10:00~22:00", "주소 입니다.", "맛집 내용05", null, null, null);
	 * List<MenusVo> menusVoList = new ArrayList<MenusVo>();
	 * 
	 * // MenusVo menuVo = null;
	 * 
	 * menusVoList.add(new MenusVo(25, "비빕밥", 10000)); menusVoList.add(new
	 * MenusVo(25, "불백", 10000)); menusVoList.add(new MenusVo(25, "동내분식05", 10000));
	 * 
	 * RestaurantsServiceImpl.restaurantsUpdate(restaurantsVo, menusVoList, null,
	 * null);
	 * 
	 * }
	 */
	 

	@Test
	public void restaurantsSelectOne() {
		// TODO Auto-generated method stub
		
		int restaurantNo = 25;
		
		Map<String, Object> resultMap = new HashMap<String, Object>();

		RestaurantsVo restaurantsVo = (RestaurantsVo)restaurantsServiceImpl.restaurantsSelectOne(restaurantNo);
		resultMap.put("restaurantsVo", restaurantsVo);
		
		Assert.assertEquals(restaurantsVo.getRestaurantNo(), 25);
		Assert.assertEquals(restaurantsVo.getRestaurantName(),"동네분식05");
		Assert.assertEquals(restaurantsVo.getCategory(),"분식");
		Assert.assertEquals(restaurantsVo.getPhone(),"0317411928");
		Assert.assertEquals(restaurantsVo.getOperatingTime(),"10:00~22:00");
		Assert.assertEquals(restaurantsVo.getAddress(),"주소 입니다.");
		Assert.assertEquals(restaurantsVo.getContents(),"맛집 내용05");

	}

}
