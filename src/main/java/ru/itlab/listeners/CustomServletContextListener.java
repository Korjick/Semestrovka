package ru.itlab.listeners;

import org.springframework.jdbc.datasource.DriverManagerDataSource;
import ru.itlab.repositories.UserFilmsRepositoryImpl;
import ru.itlab.repositories.UsersRepository;
import ru.itlab.repositories.UsersRepositoryJdbcImpl;
import ru.itlab.services.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class CustomServletContextListener implements ServletContextListener {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/postgres";
    private static final String DB_USERNAME = "postgres";
    private static final String DB_PASSWORD = "Korjicks2281337";
    private static final String DB_DRIVER = "org.postgresql.Driver";
    private static final String BASE_CONTEXT = "http://localhost:8080/inf-1-sem";

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(DB_DRIVER);
        dataSource.setUsername(DB_USERNAME);
        dataSource.setPassword(DB_PASSWORD);
        dataSource.setUrl(DB_URL);

        UsersRepository usersRepository = new UsersRepositoryJdbcImpl(dataSource);
        SignUpService signUpService = new SignUpServiceImpl(usersRepository);
        SignInService signInService = new SignInServiceImpl(usersRepository);
        UsersService usersService = new UsersServiceImpl(usersRepository);

        UserFilmsRepositoryImpl userFilmsRepository = new UserFilmsRepositoryImpl(dataSource);
        FilmsService filmsService = new FilmsServiceImpl(userFilmsRepository);

        servletContext.setAttribute("signUpService", signUpService);
        servletContext.setAttribute("signInService", signInService);
        servletContext.setAttribute("usersService", usersService);
        servletContext.setAttribute("filmsService", filmsService);
        servletContext.setAttribute("baseContext", BASE_CONTEXT);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
