package ru.itlab.servlets;

import ru.itlab.dto.SignInForm;
import ru.itlab.services.SignInService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/signIn")
public class SignInServlet extends HttpServlet {
    private SignInService signInService;
    private String BASE_CONTEXT;

    @Override
    public void init(ServletConfig config) {
        signInService = (SignInService) config.getServletContext().getAttribute("signInService");
        BASE_CONTEXT = (String) config.getServletContext().getAttribute("baseContext");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.sendRedirect(BASE_CONTEXT);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        SignInForm form = new SignInForm();
        form.setEmail(request.getParameter("email"));
        form.setPassword(request.getParameter("password"));

        Long id = signInService.signIn(form);
        if (id > 0) {
            HttpSession session = request.getSession();
            session.setAttribute("id", id);
            response.sendRedirect(BASE_CONTEXT + "/profile");
        } else {
            request.getSession().setAttribute("error", id);
            response.sendRedirect(BASE_CONTEXT);
        }
    }
}
