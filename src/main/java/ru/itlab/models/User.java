package ru.itlab.models;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.Builder;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@EqualsAndHashCode
@Builder
@ToString
public class User {
    private Long id;
    private String username;
    private String email;
    private Date dateOfBirth;
    private String hashPassword;

    //TODO: функция смена пароля
}
