package com.dc.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dc.board.vo.BoardVo;

public interface BoardService {
	
	public List<BoardVo> boardSelectList(String keyword, int start, int end, String searchOption);
	public Map<String, Object> boardSelectOne(int boardNo, int memberNo);
	public void boardInsertOne(BoardVo boardVo, MultipartHttpServletRequest multipartHttpServletRequest)
			throws Exception;
	public void boardUpdateOne(BoardVo boardVo, MultipartHttpServletRequest multipartHttpServletRequest
			, int fileIdx)throws Exception;
	public void boardDelete(int boardNo) throws Exception;
	public void boardDeleteWithMember(int memberNo);
//	public int boardTotalCount();
	
	public int boardCommentCount(int boardNo);
	
	public int boardSelectTotalCount(String keyword, String searchOption);
	public void boardUpdateRecommendUp(int boardNo);
	public void boardUpdateRecommendDown(int boardNo);
	public Map<String, Object> boardSelectOneOther(int boardNo);
}
