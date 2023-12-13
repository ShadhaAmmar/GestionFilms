package com.isitcom.GestionFilms.services.genre;

import com.isitcom.GestionFilms.entities.Genre;
import com.isitcom.GestionFilms.repositories.IGenreRepository;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class GestionGenreImpl implements IGestionGenre {
    private IGenreRepository genreRepository;

    @Override
    public void addCategory(Genre c) {
        genreRepository.save(c);
    }

    @Override
    public void updateCategory(Genre genre) {
        genreRepository.save(genre);
    }

    @Override
    public List<Genre> getAllCategory() {
        return genreRepository
                .findAll();
    }

    @Override
    public List<Genre> getGenresBMC(String mc) {
        return genreRepository
                .findByNomContains(mc);
    }

    @Override
    public Genre getCategory(long id) {
        return genreRepository
                .findById(id)
                .orElseThrow(() -> new RuntimeException(String.format("Genre with id = %d not found!", id)));
    }

    @Override
    public void deleteCategory(long id) {
        genreRepository.deleteById(id);
    }
}
