package ru.itlab.servlets;

import ru.itlab.services.FilmsService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/filmRecommendation")
public class FilmRecommendationServlet extends HttpServlet {
    private FilmsService filmsService;
    private String BASE_CONTEXT;

    @Override
    public void init(ServletConfig config) {
        filmsService = (FilmsService) config.getServletContext().getAttribute("filmsService");
        BASE_CONTEXT = (String) config.getServletContext().getAttribute("baseContext");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession(false).getAttribute("id") != null){

        } else {
            ArrayList<Long> countries = null;
            ArrayList<Long> categories = null;

            if(request.getHeader("CountryArray").length() > 0)
                countries = Arrays.stream(request.getHeader("CountryArray").split(","))
                        .mapToLong(Long::parseLong)
                        .collect(ArrayList::new, List::add, List::addAll);

            if(request.getHeader("CategoryArray").length() > 0)
                categories = Arrays.stream(request.getHeader("CategoryArray").split(","))
                        .mapToLong(Long::parseLong)
                        .collect(ArrayList::new, List::add, List::addAll);

            long ratingFrom = Long.parseLong(request.getHeader("RatingArray").split(",")[0]);
            long ratingTo = Long.parseLong(request.getHeader("RatingArray").split(",")[1]);

            long yearFrom = Long.parseLong(request.getHeader("YearArray").split(",")[0]);
            long yearTo = Long.parseLong(request.getHeader("YearArray").split(",")[1]);

            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print(filmsService.getFilmsByFilter(countries, categories, ratingFrom, ratingTo, yearFrom, yearTo));
            out.flush();
        }
    }
}
