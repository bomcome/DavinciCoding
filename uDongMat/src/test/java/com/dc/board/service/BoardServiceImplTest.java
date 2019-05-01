package com.dc.board.service;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dc.board.vo.BoardVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		"file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class BoardServiceImplTest {

	@Autowired
	private BoardServiceImpl boardServiceImpl;

	@Ignore
	public void testBoardUpdateOne() {
		// TODO Auto-generated method stub
		BoardVo boardVo = new BoardVo(2, 1, "사용자01","제목01수정", "내용01수정", null, null);
//		int resultNum = boardServiceImpl.boardUpdateOne(boardVo);
//		boardServiceImpl.boardUpdateOne(boardVo);
//		Assert.assertEquals(boardVo.getTitle(), "제목01수정");
//		Assert.assertEquals("실패하면 사용되는 메세지: ", 1, resultNum);
	}

//	@Test
//	public void testboardSelectOne() {
//		// TODO Auto-generated method stub
//		int boardNo = 2;
//		BoardVo boardVo = boardServiceImpl.boardSelectOne(boardNo);
//		
//		Assert.assertEquals(boardVo.getBoardNo(), 2);
//		Assert.assertEquals(boardVo.getMemberNo(), 1);
//		Assert.assertEquals(boardVo.getTitle(), "제목01수정");
//	}
	
	@Test
	public void testboardSelectOne() {
		// TODO Auto-generated method stub
		int boardNo = 2;
//		BoardVo boardVo = boardServiceImpl.boardSelectOne(boardNo);
		
//		Assert.assertEquals(boardVo.getBoardNo(), 2);
//		Assert.assertEquals(boardVo.getMemberNo(), 1);
//		Assert.assertEquals(boardVo.getTitle(), "제목01수정");
	}
}
