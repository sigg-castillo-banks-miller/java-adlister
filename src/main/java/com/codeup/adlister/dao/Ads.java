package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();

    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    List<Ad> getAdsBySearch(String search);

    List<Ad> getAdsByCategoryId(Long categoryId);

    List<Ad> getAdById(Long adId);
    Long update(Ad ad);


	List<Ad> getAdsByUser(Long user_id);

    Long destroy(Long id);

}
