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
    public Long signUp(SignUpForm form) {
        String email = form.getEmail();
        String password = form.getPassword();

        if(!usersRepository.getUserByEmail(email).isPresent()){
            if(password.matches("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,15})")){
                User user = User.builder()
                        .username(form.getUsername())
                        .email(form.getEmail())
                        .dateOfBirth(form.getDateOfBirth())
                        .hashPassword(passwordEncoder.encode(form.getPassword()))
                        .build();

                usersRepository.save(user);
                return user.getId();
            } else {
                return (long) -2;
            }
        } else {
            return (long) -1;
        }
    }
}
