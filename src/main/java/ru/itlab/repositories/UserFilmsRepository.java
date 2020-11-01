package ru.itlab.repositories;

import ru.itlab.models.Film;

import java.util.List;

public interface UserFilmsRepository {
    List<Long> getWatchedFilms(Long user_id);
    List<Long> getLikedFilms(Long user_id);
    List<Long> getPersonalFilms(Long user_id);
    void updateWatchedFilms(Long user_id, Long film_id);
    void updateLikedFilms(Long user_id, Long film_id);
    void saveLikedFilms(Long user_id, Long film_id);
    void saveWatchedFilms(Long user_id, Long film_id);
    void deleteWatchedFilms(Long user_id);
    void deleteLikedFilms(Long user_id);
}
