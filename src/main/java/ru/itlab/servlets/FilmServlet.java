package ru.itlab.servlets;

import org.json.JSONObject;
import ru.itlab.services.FilmsService;

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

@WebServlet("/film")
public class FilmServlet extends HttpServlet {
    private FilmsService filmsService;
    private String BASE_CONTEXT;

    @Override
    public void init(ServletConfig config) {
        filmsService = (FilmsService) config.getServletContext().getAttribute("filmsService");
        BASE_CONTEXT = (String) config.getServletContext().getAttribute("baseContext");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = new PrintWriter(new OutputStreamWriter(
                response.getOutputStream(), StandardCharsets.UTF_8), true);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JSONObject watched = null, liked = null;
        if(request.getSession(false).getAttribute("id") != null){
            watched = filmsService.isFilmWatched((Long) request.getSession(false).getAttribute("id"),
                    Long.parseLong(request.getHeader("id")));
            liked = filmsService.isFilmLiked((Long) request.getSession(false).getAttribute("id"),
                    Long.parseLong(request.getHeader("id")));
        }

        out.print(filmsService.getFilmByID(Long.parseLong(request.getHeader("id"))) + "@" + (watched == null ? "{}" : watched) + "@" + (liked == null ? "{}" : liked));
        out.flush();
    }
}
