package ru.itlab.services;

import ru.itlab.dto.SignUpForm;

public interface SignUpService {
    Long signUp(SignUpForm form);
}
