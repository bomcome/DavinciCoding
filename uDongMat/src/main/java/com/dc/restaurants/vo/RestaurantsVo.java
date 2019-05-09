package com.dc.restaurants.vo;

import java.util.Date;

public class RestaurantsVo {
	
	private int restaurantNo;
	private int memberNo;
	private String restaurantName;
	private String category;
	private String phone;
	private String operatingTime;
	private String closingTime;
	private String address;
	private String contents;
	private Date createDate;
	private Date modifiedDate;
	private String storedFileName;

	public RestaurantsVo() {
		super();
	}

	public RestaurantsVo(int restaurantNo, int memberNo, String restaurantName, String category, String phone,
			String operatingTime, String closingTime, String address, String contents, Date createDate,
			Date modifiedDate, String storedFileName) {
		super();
		this.restaurantNo = restaurantNo;
		this.memberNo = memberNo;
		this.restaurantName = restaurantName;
		this.category = category;
		this.phone = phone;
		this.operatingTime = operatingTime;
		this.closingTime = closingTime;
		this.address = address;
		this.contents = contents;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
		this.storedFileName = storedFileName;
	}

	public int getRestaurantNo() {
		return restaurantNo;
	}
	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOperatingTime() {
		return operatingTime;
	}
	public void setOperatingTime(String operatingTime) {
		this.operatingTime = operatingTime;
	}
	public String getClosingTime() {
		return closingTime;
	}
	public void setClosingTime(String closingTime) {
		this.closingTime = closingTime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	@Override
	public String toString() {
		return "RestaurantsVo [restaurantNo=" + restaurantNo + ", memberNo=" + memberNo + ", restaurantName="
				+ restaurantName + ", category=" + category + ", phone=" + phone + ", operatingTime=" + operatingTime
				+ ", closingTime=" + closingTime + ", address=" + address + ", contents=" + contents + ", createDate="
				+ createDate + ", modifiedDate=" + modifiedDate + ", storedFileName=" + storedFileName + "]";
	}
	
}
