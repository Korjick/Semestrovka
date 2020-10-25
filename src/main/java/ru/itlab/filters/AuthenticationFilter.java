package ru.itlab.filters;

import ru.itlab.services.UsersService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(false);

        Boolean isAuthenticated = false;
        Boolean sessionExists = session != null;
        Boolean isLoginPage = request.getRequestURI().equals(request.getContextPath() + "/");

        if (sessionExists) {
            isAuthenticated = (Boolean) session.getAttribute("id");

            if (isAuthenticated == null) {
                isAuthenticated = false;
            }
        }

        if (isAuthenticated && !isLoginPage) {
            filterChain.doFilter(request, response);
        } else {
            request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
        }

    }

    @Override
    public void destroy() {

    }
}
