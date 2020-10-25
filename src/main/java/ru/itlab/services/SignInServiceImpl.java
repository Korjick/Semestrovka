package ru.itlab.services;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import ru.itlab.dto.SignInForm;
import ru.itlab.models.User;
import ru.itlab.repositories.UsersRepository;

import java.util.Optional;

public class SignInServiceImpl implements SignInService {

    private UsersRepository usersRepository;
    private PasswordEncoder passwordEncoder;

    public SignInServiceImpl(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
        this.passwordEncoder = new BCryptPasswordEncoder();
    }

    @Override
    public Long signIn(SignInForm form) {
        String email = form.getEmail();
        String password = form.getPassword();

        Optional<User> user;
        if((user = usersRepository.getUserByEmail(email)).isPresent() && passwordEncoder.matches(password, user.get().getHashPassword())){
            return user.get().getId();
        } else {
            return (long) -1;
        }
    }
}
