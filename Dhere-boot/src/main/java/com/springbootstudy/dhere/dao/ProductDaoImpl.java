package com.springbootstudy.dhere.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.domain.Story;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.springstudy.dhere.mappers.ProductMapper";

	// 카테고리 별 제품 리스트 출력
	@Override
	public List<Product> productList(String productCategory) {
		
		return sqlSession.selectList(NAME_SPACE + ".productList", productCategory);
	}
	
	@Override
	public Product getProduct(int productNo) {
		return sqlSession.selectOne(NAME_SPACE + ".productDetail", productNo);
	}
	
	@Override
	public List<Product> productListAll(){
		return sqlSession.selectList(NAME_SPACE+".productListAll");
	}
	
	//	페이징 처리를 위한 제품 리스트 가져오기(syj)
	@Override
	public List<Product> getProductListPaged(int offset, int limit) {
		Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", limit);
        return sqlSession.selectList(NAME_SPACE + ".getProductListPaged", params);
    }
	
	//	필터링 된 페이징 처리를 위한 제품 리스트 가져오기(syj)
	@Override
	public List<Product> getFilteredProductListPaged(String category, int offset, int limit) {
		Map<String, Object> params = new HashMap<>();
		params.put("category", category);
		params.put("offset", offset);
		params.put("limit", limit);
		return sqlSession.selectList(NAME_SPACE + ".getFilteredProductList", params);
	}
	
	
}
