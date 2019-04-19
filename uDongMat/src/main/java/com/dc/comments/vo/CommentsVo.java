package com.dc.comments.vo;

import java.util.Date;

public class CommentsVo {

	int commentNo;
	int boardNo;
	int memberNo;
	String nickname;
	String contents;
	Date createDate;
	Date modifiedDate;
	
	
	
	public CommentsVo() {
		super();
	}


	public CommentsVo(int commentNo, int boardNo, int memberNo, String nickname, String contents, Date createDate,
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
	
	
	
	
}
