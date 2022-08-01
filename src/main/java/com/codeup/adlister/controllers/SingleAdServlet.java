package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.singleAdServlet", urlPatterns = "/ads/SingleAd")
public class SingleAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adId = request.getParameter("id");
        List<Ad> newAd = DaoFactory.getAdsDao().getAdById(Long.parseLong(adId));
        request.setAttribute("ad", newAd.get(0));
        request.getRequestDispatcher("/WEB-INF/ads/SingleAd.jsp").forward(request, response);
    }
}

