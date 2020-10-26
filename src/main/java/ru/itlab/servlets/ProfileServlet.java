package ru.itlab.servlets;

import ru.itlab.dto.UserDto;
import ru.itlab.services.UsersService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private UsersService usersService;

    @Override
    public void init(ServletConfig config) {
        usersService = (UsersService) config.getServletContext().getAttribute("usersService");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Optional<UserDto> userDto;
        if((userDto = usersService.getUserInfo((Long) request.getSession(false).getAttribute("id"))).isPresent()){
            request.getRequestDispatcher("/html/profile.html").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
