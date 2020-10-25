package ru.itlab.servlets;

import ru.itlab.dto.SignInForm;
import ru.itlab.dto.SignUpForm;
import ru.itlab.services.SignInService;
import ru.itlab.services.SignUpService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signIn")
public class SignInServlet extends HttpServlet {
    private SignInService signInService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        signInService = (SignInService) config.getServletContext().getAttribute("signInService");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        SignInForm form = new SignInForm();
        form.setLogin(request.getParameter("login"));
        form.setPassword(request.getParameter("password"));

        signInService.signIn(form);
        response.sendRedirect(getServletContext() + "/");
    }
}
