package com.dc.menus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dc.menus.vo.MenusVo;

@Repository
public class MenusDaoImpl implements MenusDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.dc.menus.";

	@Override
	public List<MenusVo> menusSelectList(int restaurantKey) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "menusSelectList", restaurantKey);
	}

	@Override
	public int menusInsert(MenusVo menusVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "menusInsert", menusVo);
	}
	
	@Override
	public int menusUpdate(MenusVo menusVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "menusUpdate", menusVo);
	}

	@Override
	public int menusDelete(int restaurantNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "menusDelete", restaurantNo);
	}

	@Override
	public void menusDeleteMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "menusDeleteMemberNo", memberNo);
	}
	
}