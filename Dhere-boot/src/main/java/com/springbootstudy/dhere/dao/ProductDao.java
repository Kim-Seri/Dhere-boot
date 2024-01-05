package com.springbootstudy.dhere.dao;

import java.util.List;

import com.springbootstudy.dhere.domain.Product;

public interface ProductDao {
	
	// 카테고리 별 제품 리스트 출력
	public abstract List<Product> productList(String productCategory);
	
	public abstract Product getProduct(int productNo);

	//제품 전체 리스트 출력
	public abstract List<Product> productListAll();

}
