package com.dc.recommend.vo;

public class RecommendVo {

	
	private int recommendNo;
	private int commentNo;
	private int commentParentNo;
	private int boardNo;
	private int memberNo;
	
	public RecommendVo() {
		super();
	}

	public RecommendVo(int recommendNo, int commentNo, int boardNo, int memberNo) {
		super();
		this.recommendNo = recommendNo;
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
	}

	public int getRecommendNo() {
		return recommendNo;
	}

	
	public void setRecommendNo(int recommendNo) {
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
	
	

	public final int getCommentParentNo() {
		return commentParentNo;
	}

	public final void setCommentParentNo(int commentParentNo) {
		this.commentParentNo = commentParentNo;
	}

	@Override
	public String toString() {
		return "RecommendVo [recommendNo=" + recommendNo + ", commentNo=" + commentNo + ", boardNo=" + boardNo
				+ ", memberNo=" + memberNo + "]";
	}
	
	
	
}
