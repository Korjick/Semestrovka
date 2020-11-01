package ru.itlab.servlets;

import ru.itlab.services.FilmsService;
import ru.itlab.services.UsersService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/clear")
public class ClearDataServlet extends HttpServlet {

    private UsersService usersService;
    private FilmsService filmsService;
    private String BASE_CONTEXT;

    @Override
    public void init(ServletConfig config) throws ServletException {
        usersService = (UsersService) config.getServletContext().getAttribute("usersService");
        filmsService = (FilmsService) config.getServletContext().getAttribute("filmsService");
        BASE_CONTEXT = (String) config.getServletContext().getAttribute("baseContext");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long param = Long.parseLong(request.getHeader("clear"));
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        if (param == 0) {
            usersService.deleteUser((Long) request.getSession(false).getAttribute("id"));
            request.getSession(false).setAttribute("id", null);
        } else if (param == 1) {
            filmsService.deleteWatchedFilms((Long) request.getSession(false).getAttribute("id"));
        } else if (param == 2) {
            filmsService.deleteLikedFilms((Long) request.getSession(false).getAttribute("id"));
        }
    }
}
