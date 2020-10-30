package ru.itlab.services;

import org.json.JSONArray;
import org.json.JSONObject;
import ru.itlab.models.Film;

import java.util.List;
import java.util.Optional;

public interface FilmsService {
    JSONObject getFilmByID(Long id);
    JSONArray getFilmsByFilter(List<Long> countries, List<Long> genres, Long ratingFrom, Long ratingTo, Long yearFrom, Long yearTo);
}
