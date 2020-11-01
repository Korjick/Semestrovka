package ru.itlab.services;

import ru.itlab.models.User;
import ru.itlab.repositories.UsersRepository;

import java.util.Optional;

public class UsersServiceImpl implements UsersService {

    private UsersRepository usersRepository;

    public UsersServiceImpl(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
    }

    @Override
    public Optional<User> getUserInfo(Long id) {
        if(usersRepository.getUserByID(id).isPresent()){
            User user = usersRepository.getUserByID(id).get();
            return Optional.of(user);
        }

        return Optional.empty();
    }

    @Override
    public void deleteUser(Long id) {
        usersRepository.delete(id);
    }

    @Override
    public void changePassword(Long id, String password) {

    }
}
