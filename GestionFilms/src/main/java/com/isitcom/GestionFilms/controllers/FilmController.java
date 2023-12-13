package com.isitcom.GestionFilms.controllers;

import com.isitcom.GestionFilms.entities.Author;
import com.isitcom.GestionFilms.entities.Genre;
import com.isitcom.GestionFilms.entities.Movie;
import com.isitcom.GestionFilms.services.author.IGestionAuthor;
import com.isitcom.GestionFilms.services.film.IGestionFilm;
import com.isitcom.GestionFilms.services.genre.IGestionGenre;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("film")
public class FilmController {
    private IGestionFilm gestionFilm;
    private IGestionGenre gestionGenre;
    private IGestionAuthor gestionAuthor;

    @GetMapping("/list")
    public String getAllFilms(
            HttpSession session,
            Model model
    ) {
        if (session.getAttribute("username") != null) {
            List<Movie> movies = gestionFilm
                    .getAllMovies();

            model.addAttribute("films", movies);

            return "filmsList";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/rechercher")
    public String getAllFilmsByMc(
            HttpSession session,
            Model model,
            @RequestParam("mc") String mc
    ) {
        if (session.getAttribute("username") != null) {
            List<Movie> movies = gestionFilm
                    .getMoviesBMC(mc);

            model.addAttribute("mc", mc);
            model.addAttribute("films", movies);

            return "filmsList";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/supprimer/{id}")
    public String deleteFilm(
            HttpSession session,
            @PathVariable("id") long movie_id
    ) {
        if (session.getAttribute("username") != null) {
            gestionFilm.deleteMovie(movie_id);

            return "redirect:/film/list";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/ajouter")
    public String addFilm_page(
            HttpSession session,
            Model model
    ) {
        if (session.getAttribute("username") != null) {
            model.addAttribute("authors", gestionAuthor.getAllAuthors());
            model.addAttribute("genres", gestionGenre.getAllCategory());

            return "addFilm";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/modifier/{id}")
    public String updateFilm_page(
            HttpSession session,
            Model model,
            @PathVariable("id") long movie_id
    ) {
        if (session.getAttribute("username") != null) {
            model.addAttribute("m", gestionFilm.getMovie(movie_id));
            model.addAttribute("authors", gestionAuthor.getAllAuthors());
            model.addAttribute("genres", gestionGenre.getAllCategory());

            return "updateFilm";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/ajouter")
    public String addFilm(
            HttpSession session,
            String title,
            String description,
            @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
            int duration,
            int genre,
            int author
    ) {
        if (session.getAttribute("username") != null) {
            gestionFilm.addMovie(
                    Movie.builder()
                            .title(title)
                            .description(description)
                            .releaseDate(date)
                            .duration(duration)
                            .genre(
                                    gestionGenre
                                            .getCategory(genre)
                            )
                            .author(
                                    gestionAuthor
                                            .getAuthor(author)
                            )
                            .build()
            );

            return "redirect:/film/list";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/modifier/{id}")
    public String updateFilm(
            HttpSession session,
            String title,
            String description,
            @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
            int duration,
            int genre,
            int author,
            @PathVariable("id") long movie_id
    ) {
        if (session.getAttribute("username") != null) {
            Genre g = gestionGenre.getCategory(genre);
            Author a = gestionAuthor.getAuthor(author);

            gestionFilm.updateMovie(
                    Movie.builder()
                            .id(movie_id)
                            .title(title)
                            .description(description)
                            .releaseDate(date)
                            .duration(duration)
                            .genre(g)
                            .author(a)
                            .build()
            );

            return "redirect:/film/list";
        } else {
            return "redirect:/login";
        }
    }
}
