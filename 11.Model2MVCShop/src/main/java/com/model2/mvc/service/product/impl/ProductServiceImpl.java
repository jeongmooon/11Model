package com.model2.mvc.service.product.impl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Stock;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.stock.StockDao;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;
	
	@Autowired
	@Qualifier("stockDaoImpl")
	private StockDao stockDao;
	
	private String uploadDir;
	
	public ProductServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}	
	
	
	@Override
	public void addProduct(Product product,MultipartFile file) throws Exception {
		// TODO Auto-generated method stub
		if(file != null) {
			String projectPath = "C:\\Users\\bitcamp\\git\\11Model\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";		
			String originName = file.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			String fileName = uuid+"_"+originName;
			
			File saveFile = new File(projectPath,fileName);
			file.transferTo(saveFile);
			product.setFileName(fileName);
		}
		
		
		productDao.addProdcut(product);
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return productDao.getProduct(prodNo);
	}

	@Override
	public Map<String, Object> getProductList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Product> list = productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void updateProduct(Product product,Stock stock,MultipartFile file) throws Exception {
		// TODO Auto-generated method stub		
		
		if(file.getOriginalFilename() !=null) {
			String projectPath = "C:\\Users\\bitcamp\\git\\11Model\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
			File oldFile = new File(projectPath+"\\"+product.getFileName());
			
			if(oldFile.exists()) {
				oldFile.delete();
			}
			
			String originName = file.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			String fileName = uuid+"_"+originName;
			
			File saveFile = new File(projectPath,fileName);
			file.transferTo(saveFile);
			product.setFileName(fileName);
		}
		
		stock.setStatus(0);
		
		
		productDao.updateProduct(product);
		//System.out.println(stock);
		stockDao.updateStock(stock);
	}


	@Override
	public List<Product> getSelectName() throws Exception {
		// TODO Auto-generated method stub
		return productDao.getSelectName();
	}

}
