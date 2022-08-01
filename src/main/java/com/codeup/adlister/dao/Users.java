package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

public interface Users {
    User findByUsername(String username);

    User findById(Long id);

    Long insert(User user);

    void updateUser(User user);
}
