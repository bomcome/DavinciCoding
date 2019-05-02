import java.util.Date;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dc.board.service.BoardServiceImpl;
import com.dc.board.vo.BoardVo;
import com.dc.members.service.MemberServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		"file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MemberServiceImplTest {
	
	@Autowired
	MemberServiceImpl memberServiceImpl; 
	
	@Autowired
	BoardServiceImpl boardServiceImpl; 
	
	@Ignore
	@Test
	public void testBoardUpdateOne() {
		// TODO Auto-generated method stub
//		BoardVo(boardNo, memberNo, nickname, title, contents, createDate, modifiedDate)
		BoardVo boardVo = new BoardVo(1, 0, "관리자", "제목0 수정", "내용0 수정", null, null);
		
		int resultNum = boardServiceImpl.boardUpdateOne(boardVo);
		
		Assert.assertEquals("실패하면 사용되는 메시지 : ", 3, resultNum);
		
	}
	
	@Test
	public void testBoardSelectOne() {
		// TODO Auto-generated method stub
		
		
		BoardVo boardVo = boardServiceImpl.boardSelectOne(2);

//		Assert.assertEquals(boardVo.getBoardNo(), 2);
//		Assert.assertEquals(boardVo.getMemberNo(), 1);
//		Assert.assertEquals(boardVo.getTitle(),"제목01");
//		Assert.assertEquals(boardVo.getContents(),"내용01");
		Assert.assertEquals("" + boardVo.getCreateDate(),"Thu Apr 25 18:44:44 KST 2019");

		
		
	}


}
