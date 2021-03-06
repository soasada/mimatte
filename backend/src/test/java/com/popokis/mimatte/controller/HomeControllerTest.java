package com.popokis.mimatte.controller;

import com.popokis.mimatte.MainApplication;
import io.restassured.RestAssured;
import org.apache.http.HttpStatus;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.test.context.junit4.SpringRunner;

import static io.restassured.RestAssured.when;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.equalTo;

@RunWith(SpringRunner.class)
@SpringBootTest(
    classes = MainApplication.class,
    webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT
)
public class HomeControllerTest {

  @LocalServerPort
  private int port;

  @Before
  public void init() {
    RestAssured.baseURI = "http://localhost";
    RestAssured.port = port;
  }

  @Test
  public void saysHello() {
    when()
        .get("/hello")
        .then()
        .statusCode(HttpStatus.SC_OK)
        .assertThat()
        .body(is(equalTo("Hello World!")));
  }
}