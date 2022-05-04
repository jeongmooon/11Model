package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Stock;

public interface ProductService {
	public void addProduct(Product product,MultipartFile file) throws Exception;
	
	public Product getProduct(int prodNo) throws Exception;
	
	public Map<String, Object> getProductList(Search search) throws Exception;
	
	public void updateProduct(Product product,Stock stock,MultipartFile file) throws Exception;
	
	public List<Product> getSelectName() throws Exception;
}
