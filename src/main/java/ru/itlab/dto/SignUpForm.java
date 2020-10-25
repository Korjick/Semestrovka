package ru.itlab.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class SignUpForm {
    private String username;
    private String email;
    private Date dateOfBirth;
    private String password;
}
