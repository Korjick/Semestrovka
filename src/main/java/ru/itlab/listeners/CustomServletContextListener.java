package ru.itlab.listeners;

import org.springframework.jdbc.datasource.DriverManagerDataSource;
import ru.itlab.repositories.UsersRepository;
import ru.itlab.repositories.UsersRepositoryJdbcImpl;
import ru.itlab.services.SignUpService;
import ru.itlab.services.SignUpServiceImpl;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class CustomServletContextListener implements ServletContextListener {
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/postgres";
    private static final String DB_USERNAME = "postgres";
    private static final String DB_PASSWORD = "Korjicks2281337";
    private static final String DB_DRIVER = "org.postgresql.Driver";

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

        servletContext.setAttribute("signUpService", signUpService);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
