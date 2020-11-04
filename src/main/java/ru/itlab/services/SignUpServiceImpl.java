package ru.itlab.services;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import ru.itlab.dto.SignUpForm;
import ru.itlab.models.User;
import ru.itlab.repositories.UsersRepository;

import java.util.Calendar;
import java.util.Optional;

public class SignUpServiceImpl implements SignUpService {

    private UsersRepository usersRepository;
    private PasswordEncoder passwordEncoder;

    public SignUpServiceImpl(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
        this.passwordEncoder = new BCryptPasswordEncoder();
    }

    @Override
    public Long signUp(SignUpForm form) {
        String email = form.getEmail();
        System.out.println(form.getDateOfBirth());
        if (Calendar.getInstance().get(Calendar.YEAR) - Integer.parseInt(form.getDateOfBirth().split("-")[0]) <= 100) {
            if (!usersRepository.getUserByEmail(email).isPresent()) {
                User user = User.builder()
                        .username(form.getUsername())
                        .email(form.getEmail())
                        .dateOfBirth(form.getDateOfBirth())
                        .hashPassword(passwordEncoder.encode(form.getPassword()))
                        .build();

                usersRepository.save(user);
                return usersRepository.getUserByEmail(email).get().getId();
            } else {
                return (long) -2;
            }
        } else {
            return (long) -3;
        }
    }
}
