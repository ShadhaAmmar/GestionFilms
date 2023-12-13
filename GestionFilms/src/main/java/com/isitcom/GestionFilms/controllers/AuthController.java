package com.isitcom.GestionFilms.controllers;

import com.isitcom.GestionFilms.entities.User;
import com.isitcom.GestionFilms.services.user.IAuth;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class AuthController {
    private final IAuth auth;

    @GetMapping
    public String index_page() {
        return "index";
    }

    @GetMapping("/login")
    public String login_page() {
        return "login";
    }

    @PostMapping("/login")
    public String login(
            String email,
            String password,
            HttpSession session,
            Model model
    ) {
        String verify = auth
                .verify(new User(email, password));

        if (verify.isEmpty()) {
            model.addAttribute("error", "email or password is incorrect!");

            return "login";
        } else {
            session.setAttribute("username", verify);

            return "redirect:/film/list";
        }
    }

    @GetMapping("/logout")
    public String logout(
            HttpSession session
    ) {
        if (session != null) {
            session.invalidate();
        }

        return "redirect:/";
    }

    @GetMapping("/register")
    public String register_page() {
        return "register";
    }

    @PostMapping("/register")
    public String register(
            String username,
            String email,
            String password
    ) {
        if (auth.register(new User(username, email, password))) {
            return "redirect:/login";
        } else {
            return "register";
        }
    }
}
