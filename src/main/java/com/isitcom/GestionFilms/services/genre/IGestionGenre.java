package com.isitcom.GestionFilms.services.genre;


import com.isitcom.GestionFilms.entities.Genre;

import java.util.List;

public interface IGestionGenre {
    void addCategory(Genre genre);

    void updateCategory(Genre genre);

    List<Genre> getAllCategory();
    List<Genre> getGenresBMC(String mc);

    Genre getCategory(long id);

    void deleteCategory(long id);
}
