package ru.itlab.repositories;

import ru.itlab.models.User;

import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

public class UsersRepositoryJdbcImpl implements UsersRepository {

    private DataSource dataSource;

    private final static String SQL_INSERT = "insert into users(username, email, dateOfBirth, hash_password) " +
            "values (?, ?, ?, ?)";

    public UsersRepositoryJdbcImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void save(User entity) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(SQL_INSERT, Statement.RETURN_GENERATED_KEYS );
            statement.setString(1, entity.getUsername());
            statement.setString(2, entity.getEmail());
            statement.setDate(3, entity.getDateOfBirth());
            statement.setString(4, entity.getHashPassword());
            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Problem with insert user");
            }

            try(ResultSet generatedKeys = statement.getGeneratedKeys()){
                if (generatedKeys.next()) {
                    entity.setId(generatedKeys.getLong("id"));
                } else {
                    throw new SQLException("Problem with retrieve id");
                }
            }
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        } finally {
            try{
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException throwables) {}
        }
    }

    @Override
    public List<User> findAll() {
        return null;
    }

}
