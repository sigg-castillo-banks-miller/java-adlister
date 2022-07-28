package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.Users;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;


@WebServlet(name = "controllers.ProfileServlet", urlPatterns = "/profile")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }
        Ads adsDao = DaoFactory.getAdsDao();
        String query = request.getParameter("query");
        //String categoryId = request.getParameter("category");
        List<Ad> ads = adsDao.getAdsByUser(user.getId());
//        if (categoryId != null) {
//            ads = adsDao.getAdsByCategoryId(Long.parseLong(categoryId));
//        } else {
//            ads = query != null ? adsDao.getAdsBySearch(query) : adsDao.all();
//        }
        HashMap<Ad, List<Category>> adsWithCategories = new HashMap<>();
        for (Ad ad : ads) {
            adsWithCategories.put(ad, DaoFactory.getCategoriesDao().getCategoriesForAd(ad.getId()));
        }
        request.setAttribute("ads", adsWithCategories);
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users mySQLUsersDao = DaoFactory.getUsersDao();
        User user = (User) request.getSession().getAttribute("user");

       //Method
        String userName = request.getParameter("username");
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");

        User user2 = new User(user.getId(), userName, userEmail, Password.hash(userPassword));
        mySQLUsersDao.updateUser(user2);

        request.getSession().setAttribute("user", user2);

        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);

    }
}

