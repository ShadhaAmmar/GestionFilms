package com.isitcom.GestionFilms.repositories;

import com.isitcom.GestionFilms.entities.Genre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IGenreRepository extends JpaRepository<Genre, Long> {
    List<Genre> findByNomContains(String mc);
}
