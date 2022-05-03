package com.model2.mvc.service.domain;

public class Stock {
	private int prodNo;
	private int stock;
	private int status;
	
	public Stock() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Stock [prodNo=" + prodNo + ", stock=" + stock + ", status=" + status + "]";
	}

	public int getProdNo() {
		return prodNo;
	}

	public int getStock() {
		return stock;
	}

	public int getStatus() {
		return status;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
