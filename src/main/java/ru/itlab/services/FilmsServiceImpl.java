package ru.itlab.services;

import org.json.JSONArray;
import org.json.JSONObject;
import ru.itlab.models.Film;
import ru.itlab.repositories.UserFilmsRepository;
import ru.itlab.repositories.UserFilmsRepositoryImpl;
import ru.itlab.repositories.UsersRepository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class FilmsServiceImpl implements FilmsService {

    private UserFilmsRepository userFilmsRepository;

    private final String BASE_URL = "https://kinopoiskapiunofficial.tech/api/v2.1/films/%d";
    private final String FILTER_URL = "https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-filters?";
    private final String FILTER_WITHOUT_ARRAY = "order=RATING&type=FILM&ratingFrom=%d&ratingTo=%d&yearFrom=%d&yearTo=%d&page=%d";

    public FilmsServiceImpl(UserFilmsRepository userFilmsRepository) {
        this.userFilmsRepository = userFilmsRepository;
    }

    @Override
    public JSONObject getFilmByID(Long id) {
        InputStreamReader inputStreamReader = null;
        BufferedReader reader = null;

        try {
            URL url = new URL(String.format(BASE_URL, id));
            URLConnection uc = url.openConnection();

            uc.setRequestProperty("X-Requested-With", "Curl");
            uc.setRequestProperty("accept", "application/json");
            uc.setRequestProperty("X-API-KEY", "bfa12d62-3209-4c25-92a7-af9dc0f990df");

            inputStreamReader = new InputStreamReader(uc.getInputStream(), StandardCharsets.UTF_8);
            reader = new BufferedReader(inputStreamReader);
            String jsonText = readAll(reader);
            JSONObject json = new JSONObject(jsonText);

            /*
            Film film = Film.builder()
                    .filmId(data.getInt("filmId"))
                    .nameRu(data.has("nameRu") ? data.getString("nameRu") : "")
                    .nameEn(data.has("nameEn") ? data.getString("nameEn") : "")
                    .posterUrl(data.has("posterUrl") ? data.getString("posterUrl") : "")
                    .year(data.has("year") ? data.getInt("year") : 0)
                    .genres(data.has("genres") ?
                            data.getJSONArray("genres").toList().stream()
                                    .map(object -> Objects.toString(object, null))
                                    .collect(Collectors.toList()) : new ArrayList<>())
                    .countries(data.has("countries") ?
                            data.getJSONArray("countries").toList().stream()
                                    .map(object -> Objects.toString(object, null))
                                    .collect(Collectors.toList()) : new ArrayList<>())
                    .build();
             */

            return json.getJSONObject("data");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (reader != null) reader.close();
                if (inputStreamReader != null) inputStreamReader.close();
            } catch (Exception e) {
            }
        }

        return null;
    }

    @Override
    public JSONArray getFilmsByFilter(List<Long> countries, List<Long> genres, Long ratingFrom, Long ratingTo, Long yearFrom, Long yearTo) {
        InputStreamReader inputStreamReader = null;
        BufferedReader reader = null;
        String countriesString, genresString;

        try {
            if (countries != null) countriesString = countries.toString()
                    .replaceAll("\\[", "")
                    .replaceAll("]", "")
                    .replaceAll(" ", "");
            else countriesString = "";

            if (genres != null) genresString = genres.toString()
                    .replaceAll("\\[", "")
                    .replaceAll("]", "")
                    .replaceAll(" ", "");
            else genresString = "";

            URL url = new URL(FILTER_URL + "country="
                    + countriesString + "&genre=" + genresString + "&"
                    + String.format(FILTER_WITHOUT_ARRAY, ratingFrom, ratingTo, yearFrom, yearTo, 1));
            URLConnection uc = url.openConnection();

            uc.setRequestProperty("X-Requested-With", "Curl");
            uc.setRequestProperty("accept", "application/json");
            uc.setRequestProperty("X-API-KEY", "bfa12d62-3209-4c25-92a7-af9dc0f990df");

            inputStreamReader = new InputStreamReader(uc.getInputStream(), StandardCharsets.UTF_8);
            reader = new BufferedReader(inputStreamReader);
            String jsonText = readAll(reader);
            JSONObject json = new JSONObject(jsonText);
            JSONArray array = new JSONArray();

            for (int i = 0; i < json.getJSONArray("films").length(); i++) {
                array.put(json.getJSONArray("films").get(i));
            }

            for (int i = 2; i <= json.getInt("pagesCount"); i++) {
                url = new URL(FILTER_URL + "country="
                        + countriesString + "&genre=" + genresString + "&"
                        + String.format(FILTER_WITHOUT_ARRAY, ratingFrom, ratingTo, yearFrom, yearTo, i));
                uc = url.openConnection();

                uc.setRequestProperty("X-Requested-With", "Curl");
                uc.setRequestProperty("accept", "application/json");
                uc.setRequestProperty("X-API-KEY", "bfa12d62-3209-4c25-92a7-af9dc0f990df");

                inputStreamReader = new InputStreamReader(uc.getInputStream(), StandardCharsets.UTF_8);
                reader = new BufferedReader(inputStreamReader);
                jsonText = readAll(reader);
                json = new JSONObject(jsonText);

                for (int j = 0; j < json.getJSONArray("films").length(); j++) {
                    array.put(json.getJSONArray("films").get(j));
                }
            }
            /*
            for (int i = 0; i < films.length(); i++) {
                Film film = Film.builder()
                        .filmId(films.getJSONObject(i).getInt("filmId"))
                        .nameRu(films.getJSONObject(i).has("nameRu") ? films.getJSONObject(i).getString("nameRu") : "")
                        .nameEn(films.getJSONObject(i).has("nameEn") ? films.getJSONObject(i).getString("nameEn") : "")
                        .posterUrl(films.getJSONObject(i).has("posterUrl") ? films.getJSONObject(i).getString("posterUrl") : "")
                        .year(films.getJSONObject(i).has("year") ? films.getJSONObject(i).getInt("year") : 0)
                        .genres(films.getJSONObject(i).has("genres") ?
                                films.getJSONObject(i).getJSONArray("genres").toList().stream()
                                .map(object -> Objects.toString(object, null))
                                .collect(Collectors.toList()) : new ArrayList<>())
                        .countries(films.getJSONObject(i).has("countries") ?
                                films.getJSONObject(i).getJSONArray("countries").toList().stream()
                                .map(object -> Objects.toString(object, null))
                                .collect(Collectors.toList()) : new ArrayList<>())
                        .build();
                filmByFilter.add(film);
            } */

            return array;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (reader != null) reader.close();
                if (inputStreamReader != null) inputStreamReader.close();
            } catch (Exception e) {
            }
        }

        return null;
    }

    @Override
    public JSONArray getFilmsPersonal(Long user_id) {
        JSONArray personalFilms = new JSONArray();

        List<Long> arr = userFilmsRepository.getPersonalFilms(user_id);
        for (Long i : arr) personalFilms.put(getFilmByID(i));

        return personalFilms;
    }

    @Override
    public JSONArray getWatchedFilms(Long user_id) {
        JSONArray watchedFilms = new JSONArray();

        List<Long> arr = userFilmsRepository.getWatchedFilms(user_id);
        for (Long i : arr) watchedFilms.put(getFilmByID(i));

        return watchedFilms;
    }

    @Override
    public JSONArray getLikedFilms(Long user_id) {
        JSONArray likedFilms = new JSONArray();

        List<Long> arr = userFilmsRepository.getLikedFilms(user_id);
        for (Long i : arr) likedFilms.put(getFilmByID(i));

        return likedFilms;
    }

    @Override
    public void saveWatchedFilms(Long user_id, Long film_id) {
        userFilmsRepository.saveWatchedFilms(user_id, film_id);
    }

    @Override
    public void saveLikedFilms(Long user_id, Long film_id) {
        userFilmsRepository.saveLikedFilms(user_id, film_id);
    }

    @Override
    public void deleteWatchedFilms(Long user_id) {
        userFilmsRepository.deleteWatchedFilms(user_id);
    }

    @Override
    public void deleteLikedFilms(Long user_id) {
        userFilmsRepository.deleteLikedFilms(user_id);
    }

    private String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }
}
