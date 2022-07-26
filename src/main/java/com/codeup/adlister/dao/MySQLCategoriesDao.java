package com.codeup.adlister.dao;

import com.codeup.adlister.models.Category;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLCategoriesDao implements Categories {
    private final Connection connection;

    public MySQLCategoriesDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Category> all() {
        String query = "SELECT * FROM categories";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            return createCategoriesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all categories.", e);
        }
    }

    private List<Category> createCategoriesFromResults(ResultSet rs) throws SQLException {
        List<Category> categories = new ArrayList<>();
        while (rs.next()) {
            categories.add(new Category(
                    rs.getLong("id"),
                    rs.getString("name")
            ));
        }
        return categories;
    }

    @Override
    public Long insert(Category category) {
        return null;
    }

    @Override
    public Long associateAdWithCategory(long adId, long categoryId) {
        Long res = null;
        try {
            String query = "INSERT INTO ads_categories (ad_id, category_id) VALUES (?, ?)";
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, adId);
            stmt.setLong(2, categoryId);
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) res = rs.getLong(1);
            
            return res;
        } catch (SQLException e) {
            throw new RuntimeException("Couldn't associate ad with category", e);
        }
    }

    @Override
    public Category getCategoryById(long id) {
        Category category = null;
        try {
            String query = "SELECT * FROM categories WHERE id = ? LIMIT 1";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                category = new Category(
                        rs.getLong("id"),
                        rs.getString("name")
                );
            }
            return category;
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving category by id.", e);
        }

    }
}
