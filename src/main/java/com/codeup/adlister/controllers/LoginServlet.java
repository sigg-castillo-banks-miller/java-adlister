package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //removal of msg state (error msg) if the user returns to this page again
        request.getSession().removeAttribute("msg");
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);
        //error messages differentiate between no user found and user found, but password is wrong.
        if (user != null) {
            //create a boolean that sets true if the found user's entered password and hashed password match
            boolean validAttempt = BCrypt.checkpw(password, user.getPassword());
            //if a user is found by the above if statement and passwords match, then we send to profile and
            //then set the user attribute for use elsewhere.
            if (validAttempt) {
                request.getSession().setAttribute("user", user);
                response.sendRedirect("/profile");
            } else {
                //if the password it wrong, we reload the page with this error msg
                String msg = "Sorry!! You have an error. Please ensure all fields are filled out properly";
                request.getSession().setAttribute("msg", msg);
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            }
        } else {
            //if the entered user is not found, we reload page with this error page.
            String msg = "Sorry!! This user is not yet registered.";
            request.getSession().setAttribute("msg", msg);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
}