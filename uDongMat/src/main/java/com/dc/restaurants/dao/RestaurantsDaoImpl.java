package com.dc.restaurants.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dc.restaurants.vo.RestaurantsFileVo;
import com.dc.restaurants.vo.RestaurantsVo;

@Repository
public class RestaurantsDaoImpl implements RestaurantsDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.dc.restaurants.";

	@Override
	public List<RestaurantsFileVo> restaurantsSelectList(Map<String, Object> map) {

		return sqlSession.selectList(namespace + "restaurantsSelectList", map);
	}

	@Override
	public List<RestaurantsFileVo> restaurantsSelectListCategory(Map<String, Object> map) {
		
		return sqlSession.selectList(namespace + "restaurantsSelectListCategory", map);
	}

	@Override
	public List<RestaurantsFileVo> restaurantsSelectListOrder(Map<String, Object> map) {
		
		return sqlSession.selectList(namespace + "restaurantsSelectListOrder", map);
	}

	@Override
	public RestaurantsVo restaurantsSelectOne(int restaurantNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "restaurantsSelectOne", restaurantNo);
	}

	@Override
	public int restaurantsInsertOne(RestaurantsVo restaurantsVo) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert(namespace + "restaurantsInsertOne", restaurantsVo);
		
	}

	@Override
	public int restaurantsUpdate(RestaurantsVo restaurantsVo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "restaurantsUpdate", restaurantsVo);
	}

	@Override
	public int restaurantsDelete(int restaurantNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "restaurantsDelete", restaurantNo);
	}

	@Override
	public void insertFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "insertFile", map);
	}

	@Override
	public List<Map<String, Object>> fileSelectList(int restaurantNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "fileSelectList", restaurantNo);
	}

	@Override
	public int fileDelete(int restaurantNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "fileDelete", restaurantNo);
	}

	@Override
	public Map<String, Object> fileSelectStoredFileName(int restaurantNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "fileSelectStoredFileName", restaurantNo);
	}

}
