package com.isitcom.GestionFilms.repositories;

import com.isitcom.GestionFilms.entities.Author;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IAuthorRepository extends JpaRepository<Author, Long> {
    List<Author> findByNomContains(String nom);
}
