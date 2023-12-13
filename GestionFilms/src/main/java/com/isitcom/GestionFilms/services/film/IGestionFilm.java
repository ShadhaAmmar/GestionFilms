package com.isitcom.GestionFilms.services.film;

import com.isitcom.GestionFilms.entities.Movie;

import java.util.List;

public interface IGestionFilm {
    void addMovie(Movie movie);

    void deleteMovie(long id);

    void updateMovie(Movie movie);

    Movie getMovie(long id);

    List<Movie> getAllMovies();

    List<Movie> getMoviesBMC(String mc);
}
