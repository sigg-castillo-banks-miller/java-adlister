package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import java.util.List;

public interface Categories {
    List<Category> all();

    Long insert(Category category);

    Category getCategoryById(long id);

    List<Category> getCategoriesForAd(long adId);

    Long associateAdWithCategory(long adId, long categoryId);


}
