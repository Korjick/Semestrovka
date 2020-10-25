package ru.itlab.repositories;

import ru.itlab.dto.UserDto;
import ru.itlab.models.User;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UsersRepositoryJdbcImpl implements UsersRepository {

    private DataSource dataSource;

    private final static String SQL_INSERT = "insert into users(username, email, dateOfBirth, hash_password) " +
            "values (?, ?, ?, ?)";
    private final static String SQL_GET_ALL = "select * from users";
    private final static String SQL_GET_USER_BY_ID = "select * from users offset ? limit 1";
    private final String SQL_USER_BY_EMAIL = "select * from users where email=?";

    public UsersRepositoryJdbcImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void save(User entity) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(SQL_INSERT, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, entity.getUsername());
            statement.setString(2, entity.getEmail());
            statement.setDate(3, entity.getDateOfBirth());
            statement.setString(4, entity.getHashPassword());
            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Problem with insert user");
            }

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    entity.setId(generatedKeys.getLong("id"));
                } else {
                    throw new SQLException("Problem with retrieve id");
                }
            }
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException throwables) {
            }
        }
    }

    @Override
    public List<User> findAll() {
        Connection connection = null;
        PreparedStatement statement = null;
        List<User> allUsers = new ArrayList<>();

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(SQL_GET_ALL);

            try (ResultSet setOfAllUsers = statement.executeQuery()) {
                while (setOfAllUsers.next()) {
                    User user = User.builder().id(setOfAllUsers.getLong("id"))
                            .username(setOfAllUsers.getString("username"))
                            .email(setOfAllUsers.getString("email"))
                            .dateOfBirth(setOfAllUsers.getDate("dateOfBirth"))
                            .hashPassword(setOfAllUsers.getString("hash_password")).build();
                    allUsers.add(user);
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException throwables) {
            }
        }
        return allUsers;
    }

    @Override
    public Optional<User> getUserByID(Long id) {
        Connection connection = null;
        PreparedStatement statement = null;
        Optional<User> userByID = Optional.empty();

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(SQL_GET_USER_BY_ID);
            statement.setString(1, String.valueOf(id));

            try (ResultSet isUserByID = statement.executeQuery()) {
                if (isUserByID.next()) {
                    User user = User.builder().id(isUserByID.getLong("id"))
                            .username(isUserByID.getString("username"))
                            .email(isUserByID.getString("email"))
                            .dateOfBirth(isUserByID.getDate("dateOfBirth"))
                            .hashPassword(isUserByID.getString("hash_password")).build();
                    userByID = Optional.of(user);
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException throwables) {
            }
        }

        return userByID;
    }

    @Override
    public Optional<User> getUserByEmail(String email) {
        Connection connection = null;
        PreparedStatement statement = null;
        Optional<User> userByEmail = Optional.empty();

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(SQL_USER_BY_EMAIL);
            statement.setString(1, email);

            try (ResultSet isUserByEmail = statement.executeQuery()) {
                if (isUserByEmail.next()) {
                    User user = User.builder().id(isUserByEmail.getLong("id"))
                            .username(isUserByEmail.getString("username"))
                            .email(isUserByEmail.getString("email"))
                            .dateOfBirth(isUserByEmail.getDate("dateOfBirth"))
                            .hashPassword(isUserByEmail.getString("hash_password")).build();
                    userByEmail = Optional.of(user);
                }
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException throwables) {
            }
        }

        return userByEmail;
    }
}
