package ru.itlab.repositories;

import ru.itlab.models.User;

import java.util.List;
import java.util.Optional;

public interface UsersRepository {
    Optional<User> getUserByID(Long id);
    Optional<User> getUserByEmail(String email);
    void save(User entity);
    void delete(Long id);
    List<User> findAll();
}
