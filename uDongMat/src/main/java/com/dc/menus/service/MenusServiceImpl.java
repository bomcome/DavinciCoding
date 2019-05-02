package com.dc.menus.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dc.menus.dao.MenusDao;
import com.dc.menus.vo.MenusVo;

@Service
public class MenusServiceImpl implements MenusService {

	private final Logger log = LoggerFactory.getLogger(MenusServiceImpl.class);

	@Autowired
	public MenusDao menusDao;
	
	@Override
	public List<MenusVo> menusSelectList(int restaurantKey) {
		// TODO Auto-generated method stub

		return menusDao.menusSelectList(restaurantKey);
	}

	@Transactional
	@Override
	public void menusInsert(List<MenusVo> menusVoList) {
		// TODO Auto-generated method stub

		for (MenusVo menusVo : menusVoList) {
			menusDao.menusInsert(menusVo);
		}
		
	}
	
	@Transactional
	@Override
	public void menusUpdate(List<MenusVo> menusVoList) throws Exception {
		// TODO Auto-generated method stub
		
		for (MenusVo menusVo : menusVoList) {
			menusDao.menusUpdate(menusVo);
		}
		
	}
	
	@Override
	public int menusDelete(int restaurantNo) throws Exception {
		// TODO Auto-generated method stub
		
		return menusDao.menusDelete(restaurantNo);
	}

}
