package ru.itlab.servlets;

import ru.itlab.models.User;
import ru.itlab.services.FilmsService;
import ru.itlab.services.UsersService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Optional;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private UsersService usersService;
    private FilmsService filmsService;
    private String BASE_CONTEXT;

    @Override
    public void init(ServletConfig config) {
        usersService = (UsersService) config.getServletContext().getAttribute("usersService");
        filmsService = (FilmsService) config.getServletContext().getAttribute("filmsService");
        BASE_CONTEXT = (String) config.getServletContext().getAttribute("baseContext");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Optional<User> user;
        if(request.getSession(false) != null && request.getSession(false).getAttribute("id") != null
                && (user = usersService.getUserInfo((Long) request.getSession(false).getAttribute("id"))).isPresent()){
            HttpSession session = request.getSession(false);
            session.setAttribute("username", user.get().getUsername());
            session.setAttribute("email", user.get().getEmail());
            session.setAttribute("dateofbirth", user.get().getDateOfBirth());
            request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        } else {
            response.sendRedirect(BASE_CONTEXT);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = new PrintWriter(new OutputStreamWriter(
                response.getOutputStream(), StandardCharsets.UTF_8), true);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(filmsService.getWatchedFilms((Long) request.getSession(false).getAttribute("id"))
                + "@" + filmsService.getLikedFilms((Long) request.getSession(false).getAttribute("id")));
        out.flush();
    }
}
