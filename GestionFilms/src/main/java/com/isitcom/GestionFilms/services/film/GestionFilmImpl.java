package com.isitcom.GestionFilms.services.film;

import com.isitcom.GestionFilms.entities.Movie;
import com.isitcom.GestionFilms.repositories.IGenreRepository;
import com.isitcom.GestionFilms.repositories.IMovieRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class GestionFilmImpl implements IGestionFilm {
    private IMovieRepository movieRepository;

    @Override
    public void addMovie(Movie movie) {
        movieRepository.save(movie);
    }

    @Override
    public void deleteMovie(long id) {
        movieRepository.deleteById(id);
    }

    @Override
    public void updateMovie(Movie movie) {
        movieRepository.save(movie);
    }

    @Override
    public Movie getMovie(long id) {
        return movieRepository
                .findById(id)
                .orElseThrow(() -> new RuntimeException(String.format("Movie with id = %d not found!", id)));
    }

    @Override
    public List<Movie> getAllMovies() {
        return movieRepository
                .findAll();
    }

    @Override
    public List<Movie> getMoviesBMC(String mc) {
        return movieRepository
                .findByTitleContains(mc);
    }
}
