package com.model2.mvc.service.boardImg.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.boardImg.BoardImgDao;
import com.model2.mvc.service.domain.BoardImg;

@Repository("boardImgDaoImpl")
public class BoardImgDaoImpl implements BoardImgDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public BoardImgDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addBoardImg(BoardImg boardImg) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("BoardImgMapper.addBoardImg",boardImg);
	}

	@Override
	public List<BoardImg> getBoardImg(BoardImg boardImg) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("BoardImgMapper.getBoardImg",boardImg);
	}

	@Override
	public void updateBoardImg(BoardImg boardImg) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("BoardImgMapper.updateBoardImg",boardImg);
	}
	

}
