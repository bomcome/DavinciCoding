package com.dc.board.dao;

import java.util.List;
import java.util.Map;

import com.dc.board.vo.BoardVo;

public interface BoardDao {
	
	public List<BoardVo> boardSelectList(String keyword, int start, int end);
	public BoardVo boardSelectOne(int boardNo);
	public void boardInsertOne(BoardVo boardVo);
	public int boardUpdateOne(BoardVo boardVo);
	public void boardDelete(int no);
//	public int boardTotalCount();
	
	public int boardSelectTotalCount(String keyword);
}
