package ru.itlab.services;

import ru.itlab.dto.UserDto;
import ru.itlab.models.User;
import ru.itlab.repositories.UsersRepository;

import java.util.Optional;

public class UsersServiceImpl implements UsersService {

    private UsersRepository usersRepository;

    public UsersServiceImpl(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
    }

    @Override
    public Optional<UserDto> getUserInfo(Long id) {
        if(usersRepository.getUserByID(id).isPresent()){
            User user = usersRepository.getUserByID(id).get();
            UserDto userDto = UserDto.builder().username(user.getUsername())
                    .email(user.getEmail())
                    .dateOfBirth(user.getDateOfBirth()).build();

            return Optional.of(userDto);
        }

        return Optional.empty();
    }
}
