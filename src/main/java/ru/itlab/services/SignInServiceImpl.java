package ru.itlab.services;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import ru.itlab.dto.SignInForm;
import ru.itlab.repositories.UsersRepository;

public class SignInServiceImpl implements SignInService {

    private UsersRepository usersRepository;
    private PasswordEncoder passwordEncoder;

    public SignInServiceImpl(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
        this.passwordEncoder = new BCryptPasswordEncoder();
    }

    @Override
    public void signIn(SignInForm form) {
        String login = form.getLogin();
        String password = form.getPassword();

        //TODO: првоерка существует ли пользователь
    }
}
