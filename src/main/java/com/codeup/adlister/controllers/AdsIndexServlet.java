package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.Categories;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Ads adsDao = DaoFactory.getAdsDao();
        String query = request.getParameter("query");
        String categoryId = request.getParameter("category");
        List<Ad> ads;
        if (categoryId != null) {
            ads = adsDao.getAdsByCategoryId(Long.parseLong(categoryId));
        } else {
            ads = query != null ? adsDao.getAdsBySearch(query) : adsDao.all();
        }
        HashMap<Ad, List<Category>> adsWithCategories = new HashMap<>();
        for (Ad ad : ads) {
            adsWithCategories.put(ad, DaoFactory.getCategoriesDao().getCategoriesForAd(ad.getId()));
        }

        request.setAttribute("ads", adsWithCategories);
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }
}
