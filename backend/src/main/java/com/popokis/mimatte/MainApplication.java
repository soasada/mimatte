package com.popokis.mimatte;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class MainApplication {

  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

  @Bean
  @Scope(ConfigurableBeanFactory.SCOPE_SINGLETON)
  public ObjectMapper objectMapper(){
    return new ObjectMapper();
  }

  public static void main(String[] args) {
    SpringApplication.run(MainApplication.class, args);
  }
}
