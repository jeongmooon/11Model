package com.model2.mvc.service.cart;

import java.util.List;

import com.model2.mvc.service.domain.Cart;

public interface CartDao {
	public void addCart(Cart cart) throws Exception;
	public void deleteCart(Cart cart) throws Exception;
	public List<Cart> getCart() throws Exception;
}
