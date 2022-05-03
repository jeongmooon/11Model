package com.model2.mvc.service.boardImg.impl;

import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.boardImg.BoardImgDao;
import com.model2.mvc.service.boardImg.BoardImgService;
import com.model2.mvc.service.domain.Board;
import com.model2.mvc.service.domain.BoardImg;
import com.model2.mvc.service.domain.User;

@Service("boardImgServiceImpl")
public class BoardImgServiceImpl implements BoardImgService {

	@Autowired
	@Qualifier("boardImgDaoImpl")
	private BoardImgDao boardImgDao;
	
	public BoardImgServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void addBoardImg(BoardImg boardImg) throws Exception {
		// TODO Auto-generated method stub
		boardImgDao.addBoardImg(boardImg);
	}

	@Override
	public List<BoardImg> getBoardImg(BoardImg boardImg) throws Exception {
		// TODO Auto-generated method stub
		return boardImgDao.getBoardImg(boardImg);
	}

	@Override
	public void updateBoardImg(BoardImg boardImg) throws Exception {
		// TODO Auto-generated method stub
		boardImgDao.updateBoardImg(boardImg);
	}



}
