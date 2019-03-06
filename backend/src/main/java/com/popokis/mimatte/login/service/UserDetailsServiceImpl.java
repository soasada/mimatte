package com.popokis.mimatte.login.service;

import com.popokis.mimatte.api.entity.MimatteUser;
import com.popokis.mimatte.api.repository.MimatteUserRepository;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Objects;

import static java.util.Collections.emptyList;

@Service
public final class UserDetailsServiceImpl implements UserDetailsService {

  private MimatteUserRepository userRepository;

  public UserDetailsServiceImpl(MimatteUserRepository userRepository) {
    this.userRepository = userRepository;
  }

  @Override
  public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
    MimatteUser user = userRepository.findByEmail(email);

    if (Objects.isNull(user)) {
      throw new UsernameNotFoundException(email);
    }

    return new User(user.getEmail(), user.getDigest(), emptyList());
  }
}
