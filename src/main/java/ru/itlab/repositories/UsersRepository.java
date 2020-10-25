package ru.itlab.repositories;

import ru.itlab.models.User;

import java.util.Optional;

public interface UsersRepository extends CrudRepository<User> {
    Optional<User> getUserByID(Long id);
    Optional<User> getUserByEmail(String email);
}
