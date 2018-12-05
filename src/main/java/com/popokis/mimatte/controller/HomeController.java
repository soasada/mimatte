package com.popokis.mimatte.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public final class HomeController {

  @GetMapping(path = "/hello")
  public @ResponseBody String hello() {
    return "Hello World!";
  }
}
