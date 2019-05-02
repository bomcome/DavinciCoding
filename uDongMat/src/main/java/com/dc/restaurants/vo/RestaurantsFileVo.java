package com.dc.restaurants.vo;

public class RestaurantsFileVo {
	
	private int restaurantNo;
	private int memberNo;
	private String restaurantName;
	private String category;
	private String storedFileName;
	
	public RestaurantsFileVo() {
		super();
	}

	public RestaurantsFileVo(int restaurantNo, int memberNo, String restaurantName, String category,
			String storedFileName) {
		super();
		this.restaurantNo = restaurantNo;
		this.memberNo = memberNo;
		this.restaurantName = restaurantName;
		this.category = category;
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

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	@Override
	public String toString() {
		return "RestaurantsFileVo [restaurantNo=" + restaurantNo + ", memberNo=" + memberNo + ", restaurantName="
				+ restaurantName + ", category=" + category + ", storedFileName=" + storedFileName + "]";
	}
	
}
