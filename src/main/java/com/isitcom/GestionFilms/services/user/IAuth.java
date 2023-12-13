package com.isitcom.GestionFilms.services.user;

import com.isitcom.GestionFilms.entities.User;

public interface IAuth {
    String verify(User u);

    boolean register(User u);
}
