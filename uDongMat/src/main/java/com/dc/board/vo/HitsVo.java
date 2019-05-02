package com.dc.board.vo;

import java.util.Date;

public class HitsVo {

	
	private int hitsNo;
	private int boardNo;
	private int memberNo;
	private Date createDate;
	private double timeDifference;
	
	public HitsVo() {
		super();
	}

	public HitsVo(int hitsNo, int boardNo, int memberNo, Date createDate) {
		super();
		this.hitsNo = hitsNo;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.createDate = createDate;
	}

	
	public HitsVo(int hitsNo, int boardNo, int memberNo, Date createDate, double timeDifference) {
		super();
		this.hitsNo = hitsNo;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.createDate = createDate;
		this.timeDifference = timeDifference;
	}

	public int getHitsNo() {
		return hitsNo;
	}

	public void setHitsNo(int hitsNo) {
		this.hitsNo = hitsNo;
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public double getTimeDifference() {
		return timeDifference;
	}

	public void setTimeDifference(double timeDifference) {
		this.timeDifference = timeDifference;
	}
	
	

	
	
	
	
}
