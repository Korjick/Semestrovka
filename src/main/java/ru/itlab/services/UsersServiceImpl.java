package ru.itlab.services;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import ru.itlab.models.User;
import ru.itlab.repositories.UsersRepository;

import java.util.Optional;

public class UsersServiceImpl implements UsersService {

    private UsersRepository usersRepository;
    private PasswordEncoder passwordEncoder;

    public UsersServiceImpl(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
        this.passwordEncoder = new BCryptPasswordEncoder();
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
        usersRepository.changePassword(id, passwordEncoder.encode(password));
    }
}
