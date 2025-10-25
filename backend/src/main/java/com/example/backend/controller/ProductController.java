package com.example.backend.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.backend.model.dto.ProductDto;
import com.example.backend.service.ProductService;

@RestController
@RequestMapping("/api/products")
public class ProductController {
    
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    // 全商品取得
    @GetMapping
    public List<ProductDto> getAllProduct() {
        return productService.getAllProducts();
    }

    // 名前で商品検索
    @GetMapping("/search")
    public List<ProductDto> searchProducts(@RequestParam("name") String name) {
        return productService.searchProductsByName(name);
    }

}
