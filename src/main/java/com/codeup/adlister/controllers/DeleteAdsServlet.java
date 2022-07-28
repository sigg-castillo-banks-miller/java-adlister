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

@WebServlet(name = "controllers.AdsDeleteServlet", urlPatterns = "/ads/delete")
public class DeleteAdsServlet extends HttpServlet {
    // Change to post in prod
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long adId = Long.parseLong(req.getParameter("id"));

        Long numOfRowsAffected = DaoFactory.getAdsDao().destroy(adId);
        resp.sendRedirect("/ads");

    }
}
