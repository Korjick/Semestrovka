package ru.itlab.models;

import lombok.*;

import java.util.List;

@Getter
@Setter
@EqualsAndHashCode
@Builder
@ToString
public class Film {
    Integer filmId;
    String nameRu;
    String nameEn;
    Integer year;
    List<String> countries;
    List<String> genres;
    String posterUrl;
}
