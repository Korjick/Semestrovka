package ru.itlab.services;

import ru.itlab.models.User;

import java.util.Optional;

public interface UsersService {
    Optional<User> getUserInfo(Long id);
    // TODO: изменение пароля, соцсети
}
