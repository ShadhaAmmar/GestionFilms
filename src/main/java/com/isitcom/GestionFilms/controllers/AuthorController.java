package com.isitcom.GestionFilms.controllers;

import com.isitcom.GestionFilms.entities.Author;
import com.isitcom.GestionFilms.services.author.IGestionAuthor;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("author")
public class AuthorController {
    private IGestionAuthor gestionAuthor;

    @GetMapping("/list")
    public String getAllAuthors(
            HttpSession session,
            Model model
    ) {
        if (session.getAttribute("username") != null) {
            List<Author> authors = gestionAuthor
                    .getAllAuthors();

            model.addAttribute("authors", authors);

            return "authorsList";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/rechercher")
    public String getAllAuthorsByMc(
            HttpSession session,
            Model model,
            @RequestParam("mc") String mc
    ) {
        if (session.getAttribute("username") != null) {
            List<Author> authors = gestionAuthor
                    .getAuthorsBMC(mc);

            model.addAttribute("mc", mc);
            model.addAttribute("authors", authors);

            return "authorsList";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/supprimer/{id}")
    public String deleteFilm(
            HttpSession session,
            @PathVariable("id") long author_id
    ) {
        if (session.getAttribute("username") != null) {
            gestionAuthor.deleteAuthor(author_id);

            return "redirect:/author/list";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/ajouter")
    public String addFilm_page(
            HttpSession session
    ) {
        if (session.getAttribute("username") != null) {
            return "addAuthor";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/modifier/{id}")
    public String updateFilm_page(
            HttpSession session,
            Model model,
            @PathVariable("id") long author_id
    ) {
        if (session.getAttribute("username") != null) {
            model.addAttribute("a", gestionAuthor.getAuthor(author_id));

            return "updateAuthor";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/ajouter")
    public String addFilm(
            HttpSession session,
            String nom,
            String bio,
            @DateTimeFormat(pattern = "yyyy-MM-dd") Date date
    ) {
        if (session.getAttribute("username") != null) {
            gestionAuthor.addAuthor(
                    Author.builder()
                            .nom(nom)
                            .bio(bio)
                            .birthDate(date)
                            .build()
            );

            return "redirect:/author/list";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/modifier/{id}")
    public String updateFilm(
            HttpSession session,
            String nom,
            String bio,
            @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
            @PathVariable("id") long author_id
    ) {
        if (session.getAttribute("username") != null) {
            gestionAuthor.updateAuthor(
                    Author.builder()
                            .id(author_id)
                            .nom(nom)
                            .bio(bio)
                            .birthDate(date)
                            .build()
            );

            return "redirect:/author/list";
        } else {
            return "redirect:/login";
        }
    }
}
