package ru.itlab.models;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.Builder;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode
@Builder
@ToString
public class User {
    private Long id;
    private String firstName;
    private String lastName;
    private Integer age;
}
