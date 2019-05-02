package com.dc.members.vo;

import java.util.Date;

public class MemberVo {
	
	private int rownum;
	private int memberNo;
	private String memberGrade;
	private String email;
	private String nickName;
	private String password;
	private Date createDate;
	private Date modifiedDate;
	
	public MemberVo() {
		super();
	}
	
	

	public MemberVo(int rownum, int memberNo, String memberGrade, String email, String nickName, String password,
			Date createDate, Date modifiedDate) {
		super();
		this.rownum = rownum;
		this.memberNo = memberNo;
		this.memberGrade = memberGrade;
		this.email = email;
		this.nickName = nickName;
		this.password = password;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
	}



	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
		return "MemberVo [rownum=" + rownum + ", memberNo=" + memberNo + ", memberGrade=" + memberGrade + ", email="
				+ email + ", nickName=" + nickName + ", password=" + password + ", createDate=" + createDate
				+ ", modifiedDate=" + modifiedDate + "]";
	}
		
	
	
	
}
