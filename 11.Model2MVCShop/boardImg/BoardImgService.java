package com.model2.mvc.service.boardImg;

import java.util.List;

import com.model2.mvc.service.domain.BoardImg;

public interface BoardImgService {
	public void addBoardImg(BoardImg boardImg) throws Exception;
	public List<BoardImg> getBoardImg(BoardImg boardImg) throws Exception;
	public void updateBoardImg(BoardImg boardImg) throws Exception;
}
