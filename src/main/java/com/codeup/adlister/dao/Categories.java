package com.codeup.adlister.dao;

import com.codeup.adlister.models.Category;

import java.util.List;

public interface Categories {
    List<Category> all();

    Long insert(Category category);

    Category getCategoryById(long id);

    Long associateAdWithCategory(long adId, long categoryId);


}
