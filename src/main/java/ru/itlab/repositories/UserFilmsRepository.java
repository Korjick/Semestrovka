package ru.itlab.repositories;

import ru.itlab.models.Film;

import java.util.List;

public interface UserFilmsRepository {
    List<Long> getWatchedFilms(Long user_id);
    List<Long> getLikedFilms(Long user_id);
    List<Long> getPersonalFilms(Long user_id);
    boolean updateWatchedFilms(Long user_id, Long film_id);
    boolean updateLikedFilms(Long user_id, Long film_id);
    boolean saveLikedFilms(Long user_id, Long film_id);
    boolean saveWatchedFilms(Long user_id, Long film_id);
    void deleteWatchedFilms(Long user_id);
    void deleteLikedFilms(Long user_id);
    boolean isFilmWatched(Long user_id, Long film_id);
    boolean isFilmLiked(Long user_id, Long film_id);
}
