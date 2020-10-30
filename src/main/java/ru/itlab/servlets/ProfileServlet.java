package ru.itlab.servlets;

import ru.itlab.models.User;
import ru.itlab.services.UsersService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private UsersService usersService;
    private String BASE_CONTEXT;

    @Override
    public void init(ServletConfig config) {
        usersService = (UsersService) config.getServletContext().getAttribute("usersService");
        BASE_CONTEXT = (String) config.getServletContext().getAttribute("baseContext");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Optional<User> user;
        if((user = usersService.getUserInfo((Long) request.getSession(false).getAttribute("id"))).isPresent()){
            HttpSession session = request.getSession(false);
            session.setAttribute("username", user.get().getUsername());
            session.setAttribute("email", user.get().getEmail());
            session.setAttribute("dateofbirth", user.get().getDateOfBirth());
            request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        } else {
            response.sendRedirect(BASE_CONTEXT);
        }
    }
}
