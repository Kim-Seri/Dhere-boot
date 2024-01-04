package com.springbootstudy.dhere.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbootstudy.dhere.domain.Product;

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

}
