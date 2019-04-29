package com.dc.board.vo;

import java.util.Date;

public class BoardVo {
	
	int boardNo;
	int memberNo;
	String nickname;
	String title;
	String contents;
	Date createDate;
	Date modifiedDate;
	int recommendCount;
	int	hits;
	
	
	public BoardVo() {
		super();
	}

	public BoardVo(int boardNo, int memberNo, String nickname, String title, String contents, Date createDate,
			Date modifiedDate) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.nickname = nickname;
		this.title = title;
		this.contents = contents;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
	}

	
	
	public BoardVo(int boardNo, int memberNo, String nickname, String title, String contents, Date createDate,
			Date modifiedDate, int recommendCount, int hits) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.nickname = nickname;
		this.title = title;
		this.contents = contents;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
		this.recommendCount = recommendCount;
		this.hits = hits;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getRecommendCount() {
		return recommendCount;
	}

	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	
	
	
}
