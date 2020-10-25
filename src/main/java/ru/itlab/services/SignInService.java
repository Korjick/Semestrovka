package ru.itlab.services;

import ru.itlab.dto.SignInForm;
import ru.itlab.dto.SignUpForm;

public interface SignInService {
    void signIn(SignInForm form);
}
