package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.SingleAdServlet", urlPatterns = "/ads/ad-details")
public class SingleAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adId = request.getParameter("id");
        Ad newAd = DaoFactory.getAdsDao().getAdById(Long.parseLong(adId)).get(0);

        User adCreator = DaoFactory.getUsersDao().findById(newAd.getUserId());
        request.setAttribute("ad", newAd);
        request.setAttribute("adCreator", adCreator);
        request.getRequestDispatcher("/WEB-INF/ads/ad-details.jsp").forward(request, response);
    }
}

