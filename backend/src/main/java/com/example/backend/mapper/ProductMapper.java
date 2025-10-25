package com.example.backend.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.backend.model.dto.ProductDto;

@Mapper
public interface ProductMapper {
    // 全商品取得
    List<ProductDto> selectAllProducts();
    // 名前で商品検索
    List<ProductDto> selectProductsByName(@Param("name") String name);
}
