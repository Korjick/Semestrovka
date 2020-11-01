package ru.itlab.services;

import org.json.JSONArray;
import org.json.JSONObject;
import ru.itlab.models.Film;

import java.util.List;

public interface FilmsService {
    JSONObject getFilmByID(Long id);
    JSONArray getFilmsByFilter(List<Long> countries, List<Long> genres, Long ratingFrom, Long ratingTo, Long yearFrom, Long yearTo);
    JSONArray getFilmsPersonal(Long user_id);
    JSONArray getWatchedFilms(Long user_id);
    JSONArray getLikedFilms(Long user_id);
    void saveWatchedFilms(Long user_id, Long film_id);
    void saveLikedFilms(Long user_id, Long film_id);
    void deleteWatchedFilms(Long user_id);
    void deleteLikedFilms(Long user_id);
}
