package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLAdsDao;
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

@WebServlet(name = "controllers.EditAdsServlet", urlPatterns = "/ads/edit")
public class EditAdsServlet extends HttpServlet {
    // Change to post in prod
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Long adId = Long.parseLong(req.getParameter("id"));
        String adTitle = req.getParameter("title");
        String adDescription = req.getParameter("description");

        Ad updateThisAd = new Ad(adId,adTitle,adDescription);

        Long numOfRowsAffected = DaoFactory.getAdsDao().update(updateThisAd);
        resp.sendRedirect("/ads");

    }
}
