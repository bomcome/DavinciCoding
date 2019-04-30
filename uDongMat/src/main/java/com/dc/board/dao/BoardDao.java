package com.dc.board.dao;

import java.util.List;
import java.util.Map;

import com.dc.board.vo.BoardVo;
import com.dc.board.vo.HitsVo;

public interface BoardDao {
	
	public List<BoardVo> boardSelectList(String keyword, int start, int end);
	public BoardVo boardSelectOne(int boardNo);
	public void boardInsertOne(BoardVo boardVo);
	public int boardUpdateOne(BoardVo boardVo);
	public void boardDelete(int no);
//	public int boardTotalCount();
	
	public int boardSelectTotalCount(String keyword);
	public void boardUpdateRecommendUp(int boardNo);
	public void boardUpdateRecommendDown(int boardNo);
	
	public void boardUpdateHitsUp(int boardNo);
	
//	public void hitsInsertOne(HitsVo hitsVo);
	public void hitsInsertOne(Map<String, Object> map);
	public void hitsUpdateDate(int hitsNo);
	
	public HitsVo hitsSelectOne(Map<String, Object> map);
}
