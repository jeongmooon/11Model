package com.model2.mvc.web.product;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/**")
public class ProductRestController {
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	public ProductRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());		
	}
	
	@GetMapping(value="json/getProduct/{prodNo}")
	public Product getProduct(@PathVariable int prodNo) throws Exception {
		System.out.println("/product/json/getProduct : GET");
		
		return productService.getProduct(prodNo);
	}	
	
	//@RequestMapping(value="json/listProduct")
	@GetMapping(value="json/listProduct")
	public Map<String,Object> listProduct(Search search) throws Exception {
		System.out.println(search);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		if(search.getSearchValue().equals("5")) {
			search.setSearchCondition("3");
		}
		
		search.setPageSize(pageSize);
		Map<String,Object> map = productService.getProductList(search);
				
		List<Object> list = (List)map.get("list");
		
		for (Object object : list) {
			System.out.println(object);
		}
		
		return map;
	}
	
	@GetMapping("json/listProduct/key")
	public List<Product> listProductName() throws Exception{
		List<Product> list = productService.getSelectName();
				
		
		return list;
	}
}
