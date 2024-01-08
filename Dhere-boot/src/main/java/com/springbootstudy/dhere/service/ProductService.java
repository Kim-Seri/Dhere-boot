package com.springbootstudy.dhere.service;

import java.util.List;

import com.springbootstudy.dhere.domain.Product;

public interface ProductService {
	
	// 카테고리 별 제품 리스트 출력
	public abstract List<Product> productList(String productCategory);
	
	public abstract Product getProduct(int productNo);

	//제품 전체 리스트 출력
	public abstract List<Product> productListAll();

	 //	페이징 처리를 위한 제품 리스트 가져오기(syj)
    public abstract List<Product> getProductListPaged(int offset, int limit);
    
    //	필터링 된 페이징 처리를 위한 제품 리스트 가져오기(syj)
    public abstract List<Product> getFilteredProductListPaged(String category, int offset, int limit);
}
