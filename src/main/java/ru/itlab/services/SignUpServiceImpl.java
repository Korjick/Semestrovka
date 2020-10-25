package ru.itlab.services;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import ru.itlab.dto.SignUpForm;
import ru.itlab.models.User;
import ru.itlab.repositories.UsersRepository;

public class SignUpServiceImpl implements SignUpService {

    private UsersRepository usersRepository;
    private PasswordEncoder passwordEncoder;

    public SignUpServiceImpl(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
        this.passwordEncoder = new BCryptPasswordEncoder();
    }

    @Override
    public void signUp(SignUpForm form) {
        User user = User.builder()
                .username(form.getUsername())
                .email(form.getEmail())
                .dateOfBirth(form.getDateOfBirth())
                .hashPassword(passwordEncoder.encode(form.getPassword()))
                .build();

        usersRepository.save(user);
        System.out.println(user);
    }
}
