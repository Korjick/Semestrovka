package ru.itlab.repositories;

import ru.itlab.models.Film;
import ru.itlab.models.User;

import javax.sql.DataSource;
import java.sql.*;
import java.util.*;

public class UserFilmsRepositoryImpl implements UserFilmsRepository {

    private final DataSource dataSource;

    private final String SQL_SELECT_WATCHED = "select \"filmsWatched\" from \"userFilms\" where user_id=?";
    private final String SQL_SELECT_LIKED = "select \"filmsLiked\" from \"userFilms\" where user_id=?";

    private final String SQL_UPDATE_WATCHED_ADD = "UPDATE \"userFilms\" SET \"filmsWatched\" = array_append(\"filmsWatched\",?) where user_id=?";
    private final String SQL_UPDATE_WATCHED_REMOVE = "UPDATE \"userFilms\" SET \"filmsWatched\" = array_remove(\"filmsWatched\",?) where user_id=?";
    private final String SQL_UPDATE_LIKED_ADD = "UPDATE \"userFilms\" SET \"filmsLiked\" = array_append(\"filmsLiked\",?) where user_id=?";
    private final String SQL_UPDATE_LIKED_REMOVE = "UPDATE \"userFilms\" SET \"filmsLiked\" = array_remove(\"filmsLiked\",?) where user_id=?";

    private final String SQL_DELETE_WATCHED = "update \"userFilms\" set \"filmsWatched\" = '{}' where user_id=?;";
    private final String SQL_DELETE_LIKED = "update \"userFilms\" set \"filmsLiked\" = '{}' where user_id=?;";

    private final String SQL_SELECT_ALL_IDS = "select array(select user_id from \"userFilms\");";

    public UserFilmsRepositoryImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public List<Long> getPersonalFilms(Long id) {
        Connection connection = null;
        PreparedStatement statement = null;

        List<Long> personalFilms = new ArrayList<>();
        Map<Long, Float> similarity = new TreeMap<>(Long::compareTo);

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(SQL_SELECT_ALL_IDS);

            try (ResultSet setOfUSers = statement.executeQuery()) {
                if (setOfUSers.next()) {

                    Long[] arr = (Long[]) setOfUSers.getArray(1).getArray();

                    for (int i = 0; i < arr.length; i++) {
                        if (!arr[i].equals(id)) {
                            Set<Long> intersect1 = new HashSet<>(getLikedFilms(id));
                            Set<Long> intersect2 = new HashSet<>(getLikedFilms(arr[i]));
                            intersect1.retainAll(intersect2);

                            Set<Long> union1 = new HashSet<>(getLikedFilms(id));
                            Set<Long> union2 = new HashSet<>(getLikedFilms(arr[i]));
                            union1.addAll(union2);

                            similarity.put(arr[i], intersect1.size() * 1.0f / union1.size());
                        }
                    }

                    Map.Entry<Long, Float> maxEntry = Collections.max(similarity.entrySet(), Map.Entry.comparingByValue());
                    personalFilms.addAll(getWatchedFilms(maxEntry.getKey()));

                    List<Long> watchedFilms = getWatchedFilms(id);
                    for (Long i : watchedFilms) personalFilms.remove(i);
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException throwables) {
            }
        }
        return personalFilms;
    }

    @Override
    public List<Long> getWatchedFilms(Long user_id) {
        Connection connection = null;
        PreparedStatement statement = null;
        List<Long> watchedFilms = new ArrayList<>();

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(SQL_SELECT_WATCHED);
            statement.setLong(1, user_id);

            try (ResultSet setOfWatched = statement.executeQuery()) {
                if (setOfWatched.next()) {
                    Long[] arr = (Long[]) setOfWatched.getArray("filmsWatched").getArray();
                    watchedFilms.addAll(Arrays.asList(arr));
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException throwables) {
            }
        }
        return watchedFilms;
    }

    @Override
    public List<Long> getLikedFilms(Long user_id) {
        Connection connection = null;
        PreparedStatement statement = null;
        List<Long> likedFilms = new ArrayList<>();

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(SQL_SELECT_LIKED);
            statement.setLong(1, user_id);

            try (ResultSet setOfLiked = statement.executeQuery()) {
                if (setOfLiked.next()) {
                    Long[] arr = (Long[]) setOfLiked.getArray("filmsLiked").getArray();
                    likedFilms.addAll(Arrays.asList(arr));
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException throwables) {
            }
        }
        return likedFilms;
    }

    @Override
    public boolean updateWatchedFilms(Long user_id, Long film_id) {
        if (getWatchedFilms(user_id).contains(film_id)) {
            Connection connection = null;
            PreparedStatement statement = null;

            try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(SQL_UPDATE_WATCHED_REMOVE, Statement.RETURN_GENERATED_KEYS);
                statement.setLong(1, film_id);
                statement.setLong(2, user_id);
                int affectedRows = statement.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Problem with removing");
                }

                return false;
            } catch (SQLException e) {
                throw new IllegalStateException(e);
            } finally {
                try {
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException throwables) {
                }
            }
        } else {
            Connection connection = null;
            PreparedStatement statement = null;

            try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(SQL_UPDATE_WATCHED_ADD, Statement.RETURN_GENERATED_KEYS);
                statement.setLong(1, film_id);
                statement.setLong(2, user_id);
                int affectedRows = statement.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Problem with adding");
                }

                return true;
            } catch (SQLException e) {
                throw new IllegalStateException(e);
            } finally {
                try {
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException throwables) {
                }
            }
        }
    }

    @Override
    public boolean updateLikedFilms(Long user_id, Long film_id) {
        if (getLikedFilms(user_id).contains(film_id)) {
            Connection connection = null;
            PreparedStatement statement = null;

            try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(SQL_UPDATE_LIKED_REMOVE, Statement.RETURN_GENERATED_KEYS);
                statement.setLong(1, film_id);
                statement.setLong(2, user_id);
                int affectedRows = statement.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Problem with removing");
                }

                return false;
            } catch (SQLException e) {
                throw new IllegalStateException(e);
            } finally {
                try {
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException throwables) {
                }
            }
        } else {
            Connection connection = null;
            PreparedStatement statement = null;

            try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(SQL_UPDATE_LIKED_ADD, Statement.RETURN_GENERATED_KEYS);
                statement.setLong(1, film_id);
                statement.setLong(2, user_id);
                int affectedRows = statement.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Problem with adding");
                }

                return true;
            } catch (SQLException e) {
                throw new IllegalStateException(e);
            } finally {
                try {
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException throwables) {
                }
            }
        }
    }

    @Override
    public boolean saveLikedFilms(Long user_id, Long film_id) {
        if (getLikedFilms(user_id).isEmpty()) {
            Connection connection = null;
            PreparedStatement statement = null;

            try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(SQL_UPDATE_LIKED_ADD, Statement.RETURN_GENERATED_KEYS);
                statement.setLong(2, user_id);
                statement.setLong(1, film_id);
                int affectedRows = statement.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Problem with save Film");
                }

                return true;
            } catch (SQLException e) {
                throw new IllegalStateException(e);
            } finally {
                try {
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException throwables) {
                }
            }
        } else return updateLikedFilms(user_id, film_id);
    }

    @Override
    public boolean saveWatchedFilms(Long user_id, Long film_id) {
        if (getWatchedFilms(user_id).isEmpty()) {
            Connection connection = null;
            PreparedStatement statement = null;

            try {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(SQL_UPDATE_WATCHED_ADD, Statement.RETURN_GENERATED_KEYS);
                statement.setLong(2, user_id);
                statement.setLong(1, film_id);
                int affectedRows = statement.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Problem with save Film");
                }

                return true;
            } catch (SQLException e) {
                throw new IllegalStateException(e);
            } finally {
                try {
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException throwables) {
                }
            }
        } else return updateWatchedFilms(user_id, film_id);
    }

    @Override
    public void deleteWatchedFilms(Long user_id) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(SQL_DELETE_WATCHED, Statement.RETURN_GENERATED_KEYS);
            statement.setLong(1, user_id);
            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Problem delete row - WatchedFilms");
            }
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException throwables) {
            }
        }
    }

    @Override
    public void deleteLikedFilms(Long user_id) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(SQL_DELETE_LIKED, Statement.RETURN_GENERATED_KEYS);
            statement.setLong(1, user_id);
            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Problem with delete row - LikedFilms");
            }
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException throwables) {
            }
        }
    }

    @Override
    public boolean isFilmWatched(Long user_id, Long film_id) {
        return getWatchedFilms(user_id).contains(film_id);
    }

    @Override
    public boolean isFilmLiked(Long user_id, Long film_id) {
        return getLikedFilms(user_id).contains(film_id);
    }
}
