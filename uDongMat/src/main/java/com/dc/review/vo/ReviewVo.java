package com.dc.review.vo;

import java.util.Date;

public class ReviewVo {

	int reviewNo;
	int restaurantNo;
	int memberNo;
	String nickname;
	String contents;
	Date createDate;
	Date modifiedDate;
	int rowNum;
	int parentReviewNo;
	String parentNickname;
	String parentContents;
	
	public ReviewVo() {
		super();
	}

	public ReviewVo(int reviewNo, int restaurantNo, int memberNo, String nickname, String contents, Date createDate,
			Date modifiedDate, int rowNum, int parentReviewNo, String parentNickname, String parentContents) {
		super();
		this.reviewNo = reviewNo;
		this.restaurantNo = restaurantNo;
		this.memberNo = memberNo;
		this.nickname = nickname;
		this.contents = contents;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
		this.rowNum = rowNum;
		this.parentReviewNo = parentReviewNo;
		this.parentNickname = parentNickname;
		this.parentContents = parentContents;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getParentReviewNo() {
		return parentReviewNo;
	}

	public void setParentReviewNo(int parentReviewNo) {
		this.parentReviewNo = parentReviewNo;
	}

	public String getParentNickname() {
		return parentNickname;
	}

	public void setParentNickname(String parentNickname) {
		this.parentNickname = parentNickname;
	}

	public String getParentContents() {
		return parentContents;
	}

	public void setParentContents(String parentContents) {
		this.parentContents = parentContents;
	}

	
	
	




}