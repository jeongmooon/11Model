package com.model2.mvc.service.domain;

public class Cart {
	private int cartNo;
	private String userId;
	private int prodNo;
	private int prodStock;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}	

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", userId=" + userId + ", prodNo=" + prodNo + ", prodStock=" + prodStock
				+ "]";
	}
	
	public int getCartNo() {
		return cartNo;
	}

	public String getUserId() {
		return userId;
	}

	public int getProdNo() {
		return prodNo;
	}

	public int getProdStock() {
		return prodStock;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public void setProdStock(int prodStock) {
		this.prodStock = prodStock;
	}
	
}
