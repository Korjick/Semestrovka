package ru.itlab.repositories;

import ru.itlab.models.User;

import java.sql.Connection;
import java.util.List;

/**
 * 02.10.2020
 * 4. Simple Web Application
 *
 * @author Sidikov Marsel (First Software Engineering Platform)
 * @version v1.0
 */
public class UsersRepositoryJdbcImpl implements UsersRepository {

    private Connection connection;

    public UsersRepositoryJdbcImpl(Connection connection) {
        this.connection = connection;
    }

    public void save(User entity) {

    }

    public List<User> findAll() {
        return null;
    }
}
