package com.dc.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dc.board.dao.BoardDao;
import com.dc.board.vo.BoardVo;
import com.dc.board.vo.HitsVo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	
	
	@Override
	public List<BoardVo> boardSelectList(String keyword, int start, int end) {
		// TODO Auto-generated method stub
		return boardDao.boardSelectList(keyword, start, end);
	}

	@Override
	public BoardVo boardSelectOne(int boardNo, int memberNo) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("memberNo", memberNo);
		
		HitsVo hitsVo = boardDao.hitsSelectOne(map);
		
		if(hitsVo == null) {
//			HitsVo hitsVo2 = new HitsVo();
//			hitsVo2.setBoardNo(memberNo);
//			hitsVo2.setBoardNo(boardNo);
//			
			boardDao.hitsInsertOne(map);
			boardDao.boardUpdateHitsUp(boardNo);
		
		}else if(hitsVo.getTimeDifference() >= 0.0416666667) {
			boardDao.hitsUpdateDate(hitsVo.getHitsNo());
			boardDao.boardUpdateHitsUp(boardNo);
		}
		return boardDao.boardSelectOne(boardNo);
	}

	@Override
	public BoardVo boardSelectOne(int boardNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		
		boardDao.hitsInsertOne(map);
		boardDao.boardUpdateHitsUp(boardNo);
		return boardDao.boardSelectOne(boardNo);
	}
	
	@Override
	public void boardInsertOne(BoardVo boardVo) {
		// TODO Auto-generated method stub
		boardDao.boardInsertOne(boardVo);
	}

	@Override
	public int boardUpdateOne(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return boardDao.boardUpdateOne(boardVo);
	}

	@Override
	public void boardDelete(int boardNo) {
		// TODO Auto-generated method stub
		boardDao.boardDelete(boardNo);
	}

//	@Override
//	public int boardTotalCount() {
//		// TODO Auto-generated method stub
//		return boardDao.boardTotalCount();
//	}

	@Override
	public int boardSelectTotalCount(String keyword) {
		// TODO Auto-generated method stub
		return boardDao.boardSelectTotalCount(keyword);
	}

	@Override
	public void boardUpdateRecommendUp(int boardNo) {
		// TODO Auto-generated method stub
		boardDao.boardUpdateRecommendUp(boardNo);
	}

	@Override
	public void boardUpdateRecommendDown(int boardNo) {
		// TODO Auto-generated method stub
		boardDao.boardUpdateRecommendDown(boardNo);
	}
}
