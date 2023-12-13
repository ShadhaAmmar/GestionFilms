package com.isitcom.GestionFilms.services.user;

import com.isitcom.GestionFilms.entities.User;
import com.isitcom.GestionFilms.repositories.IUserRepository;
import com.isitcom.GestionFilms.utils.IUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AuthImpl implements IAuth {
    private final IUserRepository userRepository;
    private final IUtils utils;

    @Override
    public String verify(User u) {
        Optional<User> optionalUser = userRepository
                .findByEmailAndPassword(
                        u.getEmail(),
                        utils.encodePassword(u.getPassword())
                );

        if (optionalUser.isPresent()) return optionalUser.get().getUsername();

        return "";
    }

    @Override
    public boolean register(User u) {
        u.setPassword(utils.encodePassword(u.getPassword()));

        userRepository.save(u);

        return true;
    }
}
