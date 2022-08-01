package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.DeleteAdsServlet", urlPatterns = "/ads/delete")
public class DeleteAdsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user") == null) {
            resp.sendRedirect("/login");
        }
        String referer = req.getHeader("referer");

        Long adId = Long.parseLong(req.getParameter("id"));
        Long numOfRowsAffected = DaoFactory.getAdsDao().destroy(adId);
        resp.sendRedirect(referer);
    }
}
