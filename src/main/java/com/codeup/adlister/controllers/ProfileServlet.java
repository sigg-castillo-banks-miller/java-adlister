package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.Users;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "controllers.ProfileServlet", urlPatterns = "/profile")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }
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

