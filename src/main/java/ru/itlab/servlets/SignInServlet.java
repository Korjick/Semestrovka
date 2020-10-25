package ru.itlab.servlets;

import ru.itlab.dto.SignInForm;
import ru.itlab.services.SignInService;

import javax.servlet.ServletConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/signIn")
public class SignInServlet extends HttpServlet {
    private SignInService signInService;

    @Override
    public void init(ServletConfig config) {
        signInService = (SignInService) config.getServletContext().getAttribute("signInService");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + "/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        SignInForm form = new SignInForm();
        form.setEmail(request.getParameter("email"));
        form.setPassword(request.getParameter("password"));

        Long id = signInService.signIn(form);
        if (id != -1) {
            HttpSession session = request.getSession();
            session.setAttribute("id", id);
            response.sendRedirect(getServletContext() + "/profile");
        } else {
            response.sendRedirect(getServletContext() + "/");
        }
    }
}
