package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Categories;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
	private final Categories categoryDao = DaoFactory.getCategoriesDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("/login");
			return;
		}
		request.setAttribute("categories", categoryDao.all());
		request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
				.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String title = request.getParameter("title").trim();
		String description = request.getParameter("description").trim();
		String[] categories = request.getParameterValues("categories");
		boolean isValid = !title.trim().equals("") && !description.trim().equals("") && categories != null;
		if (!isValid) {
			String msg = "Please fill out all fields.";
			response.sendRedirect(String.format("/ads/create?title=%s&description=%s&msg=%s", title, description, msg));
			return;
		}
		User user = (User) request.getSession().getAttribute("user");
		Ad ad = new Ad(
				user.getId(),
				request.getParameter("title"),
				request.getParameter("description")
		);
		Long adId = DaoFactory.getAdsDao().insert(ad);
		for (String categoryIdString : categories) {
			categoryDao.associateAdWithCategory(adId, Long.parseLong(categoryIdString));
		}
		response.sendRedirect("/ads");
	}
}
