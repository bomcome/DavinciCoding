package com.dc.menus.vo;

import java.util.Date;
import java.util.List;

public class MenusVo2 {

	private int menuNo;
	private int restaurantNo;
	private List<String> menuName;
	private List<Integer> price;
	private Date createDate;
	private Date modifiedDate;

	public MenusVo2() {
		super();
	}

	public MenusVo2(int menuNo, int restaurantNo, List<String> menuName, List<Integer> price, Date createDate,
			Date modifiedDate) {
		super();
		this.menuNo = menuNo;
		this.restaurantNo = restaurantNo;
		this.menuName = menuName;
		this.price = price;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
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

	public List<String> getMenuName() {
		return menuName;
	}

	public void setMenuName(List<String> menuName) {
		this.menuName = menuName;
	}

	public List<Integer> getPrice() {
		return price;
	}

	public void setPrice(List<Integer> price) {
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
