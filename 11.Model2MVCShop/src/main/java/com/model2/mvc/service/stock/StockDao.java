package com.model2.mvc.service.stock;

import java.util.List;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Stock;

public interface StockDao {
	public List<Product> getStockList(List<Product> productList) throws Exception;
	public void updateStock(Stock stock) throws Exception;
}
