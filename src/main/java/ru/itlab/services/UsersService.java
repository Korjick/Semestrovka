package ru.itlab.services;

import ru.itlab.dto.UserDto;

import java.util.Optional;

public interface UsersService {
    Optional<UserDto> getUserInfo(Long id);
}
