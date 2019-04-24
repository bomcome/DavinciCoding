package com.dc.comments.vo;

import java.util.Date;

public class CommentVo {

	int commentNo;
	int boardNo;
	int memberNo;
	String nickname;
	String contents;
	Date createDate;
	Date modifiedDate;
	int rowNum;
	int parentCommentNo;
	
	public CommentVo() {
		super();
	}


	
	
	public CommentVo(int commentNo, int boardNo, int memberNo, String nickname, String contents, Date createDate,
			Date modifiedDate, int rowNum, int parentCommentNo) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.nickname = nickname;
		this.contents = contents;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
		this.rowNum = rowNum;
		this.parentCommentNo = parentCommentNo;
	}




	public CommentVo(int commentNo, int boardNo, int memberNo, String nickname, String contents, Date createDate,
			Date modifiedDate) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.nickname = nickname;
		this.contents = contents;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
	}

	

	public int getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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




	public int getParentCommentNo() {
		return parentCommentNo;
	}




	public void setParentCommentNo(int parentCommentNo) {
		this.parentCommentNo = parentCommentNo;
	}
	
	
	
	
}
