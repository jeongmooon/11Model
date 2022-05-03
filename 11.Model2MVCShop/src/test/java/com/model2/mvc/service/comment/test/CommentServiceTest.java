package com.model2.mvc.service.comment.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.service.comment.CommentService;
import com.model2.mvc.service.domain.Comment;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml"})
public class CommentServiceTest {
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	//@Test
	public void testAddComment() throws Exception {
		Comment cm = new Comment();
		cm.setBoardNo(10000);
		cm.setUserId("user02");
		cm.setStatus(0);
		cm.setCmlayer(0); // 0은 댓글
		cm.setCommnetGroup(1); // 1번째
		cm.setContents("일반대댓글 테스트");
		
		commentService.addComment(cm);
	}
	
	//@Test
	public void testUpdateComment() throws Exception {
		Comment cm = new Comment();
		cm.setBcNo(1);
		cm.setBoardNo(10000);
		cm.setUserId("user01");
		cm.setStatus(0);
		cm.setCmlayer(0); // 0은 댓글
		cm.setCommnetGroup(1); // 1번째
		cm.setContents("왜안바뀜>??? 테스트");
		
		commentService.updateComment(cm);
	}
	
	//@Test
	public void testGetComment() throws Exception {
		List<Comment> list = commentService.getComment(10000);
		
		for (Comment comment : list) {
			System.out.println("=================");
			System.out.println(comment);
		}
	}
}
