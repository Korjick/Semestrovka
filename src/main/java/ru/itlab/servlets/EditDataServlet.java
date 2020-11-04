package ru.itlab.servlets;

import org.json.JSONObject;
import ru.itlab.services.FilmsService;
import ru.itlab.services.UsersService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

@WebServlet("/edit")
public class EditDataServlet extends HttpServlet {
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Long param = Long.parseLong(request.getHeader("edit"));

        PrintWriter out = new PrintWriter(new OutputStreamWriter(
                response.getOutputStream(), StandardCharsets.UTF_8), true);
        response.setContentType("application/json");

        if (param == 0) {
            usersService.changePassword((Long) request.getSession(false).getAttribute("id"),
                    request.getHeader("password"));
        } else if (param == 1) {
            boolean res = filmsService.saveWatchedFilms((Long) request.getSession(false).getAttribute("id"),
                     Long.parseLong(request.getHeader("id")));
            JSONObject object = new JSONObject();
            object.append("res", res);
            out.print(object);
            out.flush();
        } else if (param == 2) {
            boolean res = filmsService.saveLikedFilms((Long) request.getSession(false).getAttribute("id"),
                    Long.parseLong(request.getHeader("id")));
            JSONObject object = new JSONObject();
            object.append("res", res);
            System.out.println(object);
            out.print(object);
            out.flush();
        }
    }
}
