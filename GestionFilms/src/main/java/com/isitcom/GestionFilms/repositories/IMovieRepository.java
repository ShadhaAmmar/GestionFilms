package com.isitcom.GestionFilms.repositories;

import com.isitcom.GestionFilms.entities.Movie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IMovieRepository extends JpaRepository<Movie, Long> {
    List<Movie> findByTitleContains(String mc);
}
