package com.isitcom.GestionFilms.services.author;

import com.isitcom.GestionFilms.entities.Author;
import com.isitcom.GestionFilms.repositories.IAuthorRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class GestionAuthorImpl implements IGestionAuthor {
    private IAuthorRepository authorRepository;

    @Override
    public void addAuthor(Author author) {
        authorRepository.save(author);
    }

    @Override
    public void deleteAuthor(long id) {
        authorRepository.deleteById(id);
    }

    @Override
    public void updateAuthor(Author author) {
        authorRepository.save(author);
    }

    @Override
    public Author getAuthor(long id) {
        return authorRepository
                .findById(id)
                .orElseThrow(() -> new RuntimeException(String.format("Author with id = %d not found!", id)));
    }

    @Override
    public List<Author> getAllAuthors() {
        return authorRepository
                .findAll();
    }

    @Override
    public List<Author> getAuthorsBMC(String mc) {
        return authorRepository
                .findByNomContains(mc);
    }
}
