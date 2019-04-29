package com.dc.recommend.vo;

public class RecommendVo {

	
	int recommendNo;
	int commentNo;
	int boardNo;
	int memberNo;
	
	public RecommendVo() {
		super();
	}

	public RecommendVo(int recommnedNo, int commentNo, int boardNo, int memberNo) {
		super();
		this.recommendNo = recommnedNo;
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
	}

	public int getRecommnedNo() {
		return recommendNo;
	}

	public void setRecommnedNo(int recommendNo) {
		this.recommendNo = recommendNo;
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
	
	
	
}
