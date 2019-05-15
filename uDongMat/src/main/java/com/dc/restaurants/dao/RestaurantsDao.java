package com.dc.restaurants.dao;

import java.util.List;
import java.util.Map;

import com.dc.restaurants.vo.RestaurantsFileVo;
import com.dc.restaurants.vo.RestaurantsVo;

public interface RestaurantsDao {
	
	public List<RestaurantsFileVo> restaurantsSelectList(Map<String, Object> map);
	
	public List<RestaurantsFileVo> restaurantsSelectListCategory(Map<String, Object> map);

	public List<RestaurantsFileVo> restaurantsSelectListOrder(Map<String, Object> map);
	
	public RestaurantsVo restaurantsSelectOne(int restaurantNo);
	
	public int restaurantsInsertOne(RestaurantsVo restaurantsVo);
			
	public int restaurantsUpdate(RestaurantsVo restaurantsVo);
	
	public int restaurantsDelete(int restaurantNo);
	
	public int restaurantsTotalCount(Map<String, Object> map);
	
	public int restaurantsTotalCountCategory(Map<String, Object> map);
	
	public int restaurantsTotalCountOrder(Map<String, Object> map);
	
	// 파일첨부
	public void insertFile(Map<String, Object> map);

	public List<Map<String, Object>> fileSelectList(int no);
	
	public int fileDelete(int no);
	
	public Map<String, Object> fileSelectStoredFileName(int no);
}

