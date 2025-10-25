package com.example.backend.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.backend.mapper.ProductMapper;
import com.example.backend.model.dto.ProductDto;

@Service
public class ProductService {
    
    private final ProductMapper productMapper;

    public ProductService(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    // 全商品取得
    public List<ProductDto> getAllProducts() {
        return productMapper.selectAllProducts();
    }

    // 名前で商品検索
    public List<ProductDto> searchProductsByName(String name) {
        return productMapper.selectProductsByName(name);
    }
}
