package com.springbootstudy.dhere.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbootstudy.dhere.dao.ProductDao;
import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.domain.Story;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;

	// 카테고리 별 제품 리스트 출력
	@Override
	public List<Product> productList(String productCategory) {
		
		return productDao.productList(productCategory);
	}
	
	@Override
	public Product getProduct(int productNo) {
		return productDao.getProduct(productNo);
	}
	
	//전체 제품 리스트 출력
	@Override
	public List<Product> productListAll(){
		return productDao.productListAll();
	}
	
	//	페이징 처리를 위한 게시물 리스트 가져오기(syj)
	@Override
	public List<Product> getProductListPaged(int offset, int limit) {
		return productDao.getProductListPaged(offset, limit);
	}
	
	//	필터링 된 페이징 처리를 위한 게시물 리스트 가져오기(syj)
	@Override
	public List<Product> getFilteredProductListPaged(String category, int offset, int limit) {
		return productDao.getFilteredProductListPaged(category, offset, limit);
	}

}
