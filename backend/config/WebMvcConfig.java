package com.example.backend.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig {

    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                // /api/** に対するリクエストを許可
                registry.addMapping("/api/**")
                        .allowedOrigins("http://localhost:3000") // フロントのURL
                        .allowedMethods("GET", "POST", "PUT", "DELETE") // 許可するHTTPメソッド
                        .allowCredentials(true); // Cookie も許可したい場合
            }
        };
    }
}
