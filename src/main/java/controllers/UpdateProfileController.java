package controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import managers.UserManager;
import models.User;

@WebServlet("/UpdateProfileController")
public class UpdateProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Entering UpdateProfileController\n");
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("login");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String dateOfBirth = request.getParameter("date_of_birth");
            String favSinger = request.getParameter("fav_singer");
            String favSong = request.getParameter("fav_song");
            String prefGenre = request.getParameter("pref_genre");
            System.out.println("favSinger"+ favSinger + "\n");

            if (user != null) {
                user.setName(name);
                user.setMail(email);
                user.setBorn(dateOfBirth);
                user.setFavSinger(favSinger);
                user.setFavSong(favSong);
                user.setPref(prefGenre);

                UserManager userManager = new UserManager();
                userManager.updateUser(user);

                session.setAttribute("login", user);

                // Set response type to JSON
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"name\":\"" + user.getName() + "\",\"mail\":\"" + user.getMail() + "\",\"born\":\"" + user.getBorn() + "\",\"favSinger\":\"" + user.getFavSinger() + "\",\"favSong\":\"" + user.getFavSong() + "\",\"pref\":\"" + user.getPref() + "\"}");
            } else {
                response.sendRedirect("ViewLoginForm.jsp");
            }
        }

}

