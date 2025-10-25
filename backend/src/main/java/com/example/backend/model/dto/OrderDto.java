package com.example.backend.model.dto;

import java.util.List;

public class OrderDto {
    private int id;
    private int userId;
    private List<OrderItemDto> items;

    // getter / setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public List<OrderItemDto> getItems() { return items; }
    public void setItems(List<OrderItemDto> items) { this.items = items; }
}
