package com.isitcom.GestionFilms.services.author;

import com.isitcom.GestionFilms.entities.Author;

import java.util.List;

public interface IGestionAuthor {
    void addAuthor(Author p);

    void deleteAuthor(long id);

    void updateAuthor(Author p);

    Author getAuthor(long id);

    List<Author> getAllAuthors();

    List<Author> getAuthorsBMC(String mc);
}
