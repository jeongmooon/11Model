package com.model2.mvc.service.stock.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Stock;
import com.model2.mvc.service.stock.StockDao;

@Repository("stockDaoImpl")
public class StockDaoImpl implements StockDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public StockDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public List<Product> getStockList(List<Product> productList) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String, Object>();
		
		if(productList.size() == 1) {
			map.put("prodNo0", productList.get(0).getProdNo());
		}
		if(productList.size()>1) {
			int total = productList.size();
			List<Integer> list = new ArrayList<Integer>();	
			
			for(int i=0; i<total; i++) {
				list.add(productList.get(i).getProdNo());
			}
			
			map.put("total", total);
			map.put("list", list);
		}
		return sqlSession.selectList("StockMapper.getStockList",map);
	}

	@Override
	public void updateStock(Stock stock) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(">>>>>>>>>>>>>>>>"+stock);
		sqlSession.update("StockMapper.updateStock",stock);
	}

}
