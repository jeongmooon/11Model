package com.model2.mvc.service.board.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.service.board.BoardService;
import com.model2.mvc.service.domain.Board;
import com.model2.mvc.service.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml"})
public class BoardServiceTest {
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	//@Test
	public void testAddBaord() throws Exception {
		Board board = new Board();
		
		board.setUserId("user11");
		board.setRegion("서울시 강남");		
		board.setBoardCategory("피자2");
		board.setBoardTitle("테스트중!!");
		board.setBoardContent("ㄱㄱㄱㄱㄱㄱㄱ");
		board.setStatus(0);
		
		boardService.addBoard(board);
	}
	
	@Test
	public void testGetBoard() throws Exception {
		User user = new User();
		user.setAddr("서울시 강남");
		
		List<Board> list=boardService.getBoard(user);
		for (Board board : list) {
			System.out.println("====================");
			System.out.println(board);
		}
	}
	
	//@Test
	public void testUpdateBorad() throws Exception {
		Board board = new Board();
		
		board.setBoardNo(10000);
		board.setUserId("user11");
		board.setRegion("박달2동");		
		board.setBoardCategory("테스트중입니다");
		board.setBoardTitle("테스트중");
		board.setBoardContent("리얼루123다가 빨리오셈 렛츠기릿");
		board.setStatus(0);
		
		boardService.updateBoard(board);
		
		User user = new User();
		user.setAddr("박달2동");
		
		List<Board> list=boardService.getBoard(user);
		for (Board board2 : list) {
			System.out.println("====================");
			System.out.println(board2);
		}
	}
}
