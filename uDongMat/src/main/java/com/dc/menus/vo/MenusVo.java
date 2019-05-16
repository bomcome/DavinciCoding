package com.dc.menus.vo;

import java.util.Date;
import java.util.List;

public class MenusVo {

	private int menuNo;
	private int restaurantNo;
	private int memberNo;
	private String menuName;
	private int price;
	private Date createDate;
	private Date modifiedDate;
	
	public MenusVo() {
		super();
	}

	public MenusVo(int restaurantNo, int memberNo, String menuName, int price) {
		super();
		this.restaurantNo = restaurantNo;
		this.memberNo = memberNo;
		this.menuName = menuName;
		this.price = price;
	}


	public MenusVo(int menuNo, int restaurantNo, int memberNo, String menuName, int price, Date createDate,
			Date modifiedDate) {
		super();
		this.menuNo = menuNo;
		this.restaurantNo = restaurantNo;
		this.memberNo = memberNo;
		this.menuName = menuName;
		this.price = price;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
	}
	
	
	public final int getMenuNo() {
		return menuNo;
	}
	public final void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public final int getRestaurantNo() {
		return restaurantNo;
	}
	public final void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	public final int getMemberNo() {
		return memberNo;
	}
	public final void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public final String getMenuName() {
		return menuName;
	}
	public final void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public final int getPrice() {
		return price;
	}
	public final void setPrice(int price) {
		this.price = price;
	}
	public final Date getCreateDate() {
		return createDate;
	}
	public final void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public final Date getModifiedDate() {
		return modifiedDate;
	}
	public final void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	@Override
	public String toString() {
		return "MenusVo [menuNo=" + menuNo + ", restaurantNo=" + restaurantNo + ", memberNo=" + memberNo + ", menuName="
				+ menuName + ", price=" + price + ", createDate=" + createDate + ", modifiedDate=" + modifiedDate + "]";
	}
	
}
