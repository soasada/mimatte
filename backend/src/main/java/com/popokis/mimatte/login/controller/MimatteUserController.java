package com.popokis.mimatte.login.controller;

import com.popokis.mimatte.api.entity.MimatteUser;
import com.popokis.mimatte.api.repository.MimatteUserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/user")
public final class MimatteUserController {

  private MimatteUserRepository userRepository;
  private PasswordEncoder passwordEncoder;

  public MimatteUserController(MimatteUserRepository userRepository, PasswordEncoder passwordEncoder) {
    this.userRepository = userRepository;
    this.passwordEncoder = passwordEncoder;
  }

  @GetMapping("/all")
  public @ResponseBody List<MimatteUser> all() {
    return userRepository.findAll();
  }

  @GetMapping("/remove/{id}")
  public @ResponseBody int remove(@PathVariable Long id) {
    userRepository.deleteById(id);
    return 1;
  }

  @PostMapping("/save")
  public @ResponseBody long save(@RequestBody MimatteUser user) {
    user.setDigest(passwordEncoder.encode(user.getDigest()));
    return userRepository.save(user).getId();
  }

  @PutMapping("/modify")
  public @ResponseBody long modify(@RequestBody MimatteUser newUser) {
    MimatteUser toEditUser = userRepository.findById(newUser.getId()).get();
    toEditUser.setEmail(newUser.getEmail());
    toEditUser.setDigest(passwordEncoder.encode(newUser.getDigest()));
    return userRepository.save(toEditUser).getId();
  }
}
