package ru.itlab.repositories;

import ru.itlab.models.User;

import java.sql.Connection;
import java.util.List;

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
