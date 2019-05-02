package com.dc.menus.vo;

import java.util.List;

public class MenusVoList {
	
	
	private List<MenusVo> menusVoList = null;

	public MenusVoList() {
		super();
	}

	public MenusVoList(List<MenusVo> menusVoList) {
		super();
		this.menusVoList = menusVoList;
	}

	public List<MenusVo> getMenusVoList() {
		return menusVoList;
	}

	public void setMenusVoList(List<MenusVo> menusVoList) {
		this.menusVoList = menusVoList;
	}

	@Override
	public String toString() {
		return "MenusVoList [menusVoList=" + menusVoList + "]";
	}

	
	
}


