package com.popokis.mimatte;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public final class HomeController {

  @GetMapping(path = "/hello")
  public @ResponseBody String hello() {
    return "Hello World!";
  }
}
