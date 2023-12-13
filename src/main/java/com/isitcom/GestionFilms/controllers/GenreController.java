package com.isitcom.GestionFilms.controllers;

import com.isitcom.GestionFilms.entities.Genre;
import com.isitcom.GestionFilms.services.genre.IGestionGenre;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("genre")
public class GenreController {
    private IGestionGenre gestionGenre;

    @GetMapping("/list")
    public String getAllGenres(
            HttpSession session,
            Model model
    ) {
        if (session.getAttribute("username") != null) {
            List<Genre> genres = gestionGenre
                    .getAllCategory();

            model.addAttribute("genres", genres);

            return "genresList";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/rechercher")
    public String getAllGenresByMc(
            HttpSession session,
            Model model,
            @RequestParam("mc") String mc
    ) {
        if (session.getAttribute("username") != null) {
            List<Genre> genres = gestionGenre
                    .getGenresBMC(mc);

            model.addAttribute("mc", mc);
            model.addAttribute("genres", genres);

            return "genresList";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/supprimer/{id}")
    public String deleteGenre(
            HttpSession session,
            @PathVariable("id") long genre_id
    ) {
        if (session.getAttribute("username") != null) {
            gestionGenre.deleteCategory(genre_id);

            return "redirect:/genre/list";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/ajouter")
    public String addGenre_page(
            HttpSession session
    ) {
        if (session.getAttribute("username") != null) {
            return "addGenre";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/modifier/{id}")
    public String updateGenre_page(
            HttpSession session,
            Model model,
            @PathVariable("id") long genre_id
    ) {
        if (session.getAttribute("username") != null) {
            model.addAttribute("g", gestionGenre.getCategory(genre_id));

            return "updateGenre";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/ajouter")
    public String addGenre(
            HttpSession session,
            String nom
    ) {
        if (session.getAttribute("username") != null) {
            gestionGenre.addCategory(new Genre(nom));

            return "redirect:/genre/list";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/modifier/{id}")
    public String updateGenre(
            HttpSession session,
            String nom,
            @PathVariable("id") long genre_id
    ) {
        if (session.getAttribute("username") != null) {
            gestionGenre.updateCategory(
                    Genre.builder()
                            .id(genre_id)
                            .nom(nom)
                            .build()
            );

            return "redirect:/genre/list";
        } else {
            return "redirect:/login";
        }
    }
}
