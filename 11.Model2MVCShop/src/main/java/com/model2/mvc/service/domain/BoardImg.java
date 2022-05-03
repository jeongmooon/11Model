package com.model2.mvc.service.domain;

import java.sql.Date;

public class BoardImg {

	private int bdImgNo;
	private int boardNo;
	private Date creatAt;
	private Date updateAt;
	private String imgURL;
	
	public int getBdImgNo() {
		return bdImgNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public Date getCreatAt() {
		return creatAt;
	}
	public Date getUpdateAt() {
		return updateAt;
	}
	public String getImgURL() {
		return imgURL;
	}
	public void setBdImgNo(int bdImgNo) {
		this.bdImgNo = bdImgNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public void setCreatAt(Date creatAt) {
		this.creatAt = creatAt;
	}
	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	
	@Override
	public String toString() {
		return "BoardImg [bdImgNo=" + bdImgNo + ", boardNo=" + boardNo + ", creatAt=" + creatAt + ", updateAt="
				+ updateAt + ", imgURL=" + imgURL + "]";
	}

}
