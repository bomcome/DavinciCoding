package com.dc.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dc.board.vo.BoardVo;
import com.dc.board.vo.HitsVo;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.dc.board.";
	
	@Override
	public List<BoardVo> boardSelectList(String keyword, int start, int end) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(namespace +"boardSelectList", map);
	}

	@Override
	public BoardVo boardSelectOne(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +"boardSelectOne", boardNo);
	}

	@Override
	public void boardInsertOne(BoardVo boardVo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace +"boardInsertOne", boardVo);
	}

	@Override
	public void boardUpdateOne(BoardVo boardVo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +"boardUpdateOne", boardVo );
	}

	@Override
	public void boardDelete(int boardNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace +"boardDelete", boardNo);
	}

//	@Override
//	public int boardTotalCount() {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne(namespace +"boardTotalCount");
//	}

	@Override
	public int boardSelectTotalCount(String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +"boardSelectTotalCount", keyword);
	}

	@Override
	public void boardUpdateRecommendUp(int boardNo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +"boardUpdateRecommendUp", boardNo);
	}

	@Override
	public void boardUpdateRecommendDown(int boardNo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +"boardUpdateRecommendDown", boardNo);
	}

//	@Override
//	public void hitsInsertOne(HitsVo hitsVo) {
//		// TODO Auto-generated method stub
//		sqlSession.insert(namespace +"hitsInsertOne", hitsVo);
//	}

	@Override
	public void hitsInsertOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace +"hitsInsertOne", map);
	}
	

	@Override
	public HitsVo hitsSelectOne(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "hitsSelectOne", map);
	}

	@Override
	public void boardUpdateHitsUp(int boardNo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +"boardUpdateHitsUp", boardNo);
	}

	@Override
	public void hitsUpdateDate(int hitsNo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +"hitsUpdateDate", hitsNo);
	}
	
	
	
	@Override
	public void insertFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		sqlSession.insert(namespace + "insertFile", map);
	}

	@Override
	public List<Map<String, Object>> fileSelectList(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "fileSelectList", no);
	}

	@Override
	public int fileDelete(int no) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "fileDelete", no);
	}

	@Override
	public Map<String, Object> fileSelectStoredFileName(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "fileSelectStoredFileName", no);
	}
	
}
