package com.codeup.adlister.controllers;

import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


    @WebServlet(name = "controllers.editProfileServlet", urlPatterns = "/profile")
    public class EditProfileServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          try{

              String userName = request.getParameter("username");
              String userEmail = request.getParameter("email");
              String userPassword = request.getParameter("password");

              HttpSession s = request.getSession();
              User user = (User) s.getAttribute("User");
              user.setEmail(userEmail);
              user.setPassword(userPassword);
              user.setUsername(userName);

          }catch( Exception e){

            }


            request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        }
    }

