package com.dc.menus.vo;

import java.util.Date;
import java.util.List;

public class MenusVo {

	private int menuNo;
	private int restaurantNo;
	private String menuName;
	private int price;
	private Date createDate;
	private Date modifiedDate;

	public MenusVo() {
		super();
	}

	public MenusVo(int menuNo, int restaurantNo, String menuName, int price, Date createDate, Date modifiedDate) {
		super();
		this.menuNo = menuNo;
		this.restaurantNo = restaurantNo;
		this.menuName = menuName;
		this.price = price;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
	}

	public MenusVo(int restaurantNo, String menuName, int price) {
		super();
		this.restaurantNo = restaurantNo;
		this.menuName = menuName;
		this.price = price;
	}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	public int getRestaurantNo() {
		return restaurantNo;
	}

	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	@Override
	public String toString() {
		return "MenusVo [menuNo=" + menuNo + ", restaurantNo=" + restaurantNo + ", menuName=" + menuName + ", price="
				+ price + ", createDate=" + createDate + ", modifiedDate=" + modifiedDate + "]";
	}



}
