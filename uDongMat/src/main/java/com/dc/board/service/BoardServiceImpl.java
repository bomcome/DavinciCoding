package com.dc.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dc.board.dao.BoardDao;
import com.dc.board.vo.BoardVo;
import com.dc.board.vo.HitsVo;
import com.dc.comments.dao.CommentDao;
import com.dc.util.FileUtils;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private CommentDao commentDao;
	
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public List<BoardVo> boardSelectList(String keyword, int start, int end, String searchOption) {
		// TODO Auto-generated method stub
		return boardDao.boardSelectList(keyword, start, end, searchOption);
	}

	@Override
	public Map<String, Object> boardSelectOne(int boardNo, int memberNo) {
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
		
		BoardVo boardVo = boardDao.boardSelectOne(boardNo);
		map.put("boardVo", boardVo);
		List<Map<String, Object>> fileList = boardDao.fileSelectList(boardNo);
		map.put("fileList", fileList);
		return map;
	}

	@Override
	public Map<String, Object> boardSelectOneOther(int boardNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("boardNo", boardNo);
//		map.put("memberNo", null);
		
//		boardDao.hitsInsertOneOther(map);
		
		boardDao.boardUpdateHitsUp(boardNo);
		
		BoardVo boardVo = boardDao.boardSelectOne(boardNo);
		map.put("boardVo", boardVo);
		List<Map<String, Object>> fileList = boardDao.fileSelectList(boardNo);
		map.put("fileList", fileList);
		return map;
	}
	
	@Transactional
	@Override
	public void boardInsertOne(BoardVo boardVo, MultipartHttpServletRequest multipartHttpServletRequest)
			throws Exception {
		// TODO Auto-generated method stub
		boardDao.boardInsertOne(boardVo);
		int parentSeq = boardVo.getBoardNo();
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);
		for (int i = 0; i < list.size(); i++) {
			boardDao.insertFile(list.get(i));
		}
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public void boardUpdateOne(BoardVo boardVo, MultipartHttpServletRequest multipartHttpServletRequest, int fileIdx)
			throws Exception {
		// TODO Auto-generated method stub
		
		try {
			
			int parentSeq = boardVo.getBoardNo();
			Map<String, Object> tempFileMap = boardDao.fileSelectStoredFileName(parentSeq);

			List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);
			
			// 오로지 하나만 관리
			if (list.isEmpty() == false) {
				if(tempFileMap != null) {
					fileUtils.parseUpdateFileInfo(tempFileMap);
					boardDao.fileDelete(parentSeq);
				}
				
				for (Map<String, Object> map : list) {
					boardDao.insertFile(map);
				}

			}else if(fileIdx == -1) {
				if(tempFileMap != null) {
					boardDao.fileDelete(parentSeq);
					fileUtils.parseUpdateFileInfo(tempFileMap);
				}
			}
			
		}catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		boardDao.boardUpdateOne(boardVo);
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public void boardDelete(int boardNo) throws Exception{
		// TODO Auto-generated method stub
		commentDao.commentDeleteWithBoard(boardNo);
		
		Map<String, Object> tempFileMap = null;
		tempFileMap = boardDao.fileSelectStoredFileName(boardNo);
		
		int result = 0;
		if(tempFileMap != null) {
			 result = boardDao.fileDelete(boardNo);	
		}
		
		if(result != 0) {
			fileUtils.parseUpdateFileInfo(tempFileMap);
		}
		
		boardDao.boardDelete(boardNo);
	}

//	@Override
//	public int boardTotalCount() {
//		// TODO Auto-generated method stub
//		return boardDao.boardTotalCount();
//	}

	@Override
	public int boardSelectTotalCount(String keyword, String searchOption) {
		// TODO Auto-generated method stub
		return boardDao.boardSelectTotalCount(keyword, searchOption);
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

	@Override
	public int boardCommentCount(int boardNo) {
		// TODO Auto-generated method stub
		return boardDao.boardCommentCount(boardNo);
	}
}
