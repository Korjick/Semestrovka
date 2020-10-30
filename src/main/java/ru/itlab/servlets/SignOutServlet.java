package ru.itlab.servlets;

import ru.itlab.services.SignInService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signOut")
public class SignOutServlet extends HttpServlet {

    private String BASE_CONTEXT;

    @Override
    public void init(ServletConfig config) {
        BASE_CONTEXT = (String) config.getServletContext().getAttribute("baseContext");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getSession(false).getAttribute("id") != null){
            request.getSession(false).setAttribute("id", null);
        }
        response.sendRedirect(BASE_CONTEXT);
    }
}
