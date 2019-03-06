package com.popokis.mimatte.login.filter;

import com.auth0.jwt.JWT;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.servlet.FilterChain;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;

import static com.auth0.jwt.algorithms.Algorithm.HMAC512;
import static com.popokis.mimatte.login.common.SecurityConstants.EXPIRATION_TIME;
import static com.popokis.mimatte.login.common.SecurityConstants.HEADER_STRING;
import static com.popokis.mimatte.login.common.SecurityConstants.SECRET;
import static com.popokis.mimatte.login.common.SecurityConstants.TOKEN_PREFIX;

public final class JWTAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

  private final AuthenticationManager authenticationManager;
  private final ObjectMapper mapper;

  public JWTAuthenticationFilter(AuthenticationManager authenticationManager, ObjectMapper mapper) {
    this.authenticationManager = authenticationManager;
    this.mapper = mapper;
  }

  @Override
  public Authentication attemptAuthentication(HttpServletRequest request,
                                              HttpServletResponse response) throws AuthenticationException {
    try {
      JsonNode requestJson = mapper.readTree(request.getInputStream());
      String username = requestJson.get("username").asText();
      String password = requestJson.get("password").asText();
      String recaptchaToken = requestJson.get("recaptchaToken").asText();

      JsonNode responseRecaptcha = mapper.readTree(postToVerifyRecaptcha(recaptchaToken));
      boolean success = responseRecaptcha.get("success").asBoolean();
      BigDecimal score = new BigDecimal(responseRecaptcha.get("score").asText());
      String action = responseRecaptcha.get("action").asText();

      if (success && score.compareTo(new BigDecimal("0.8")) >= 0 && action.equals("login")) {
        return authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password, new ArrayList<>()));
      } else {
        throw new RuntimeException("Incorrect captcha");
      }
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  protected void successfulAuthentication(HttpServletRequest request,
                                          HttpServletResponse response,
                                          FilterChain chain,
                                          Authentication auth) {
    String token = JWT.create()
        .withSubject(((User) auth.getPrincipal()).getUsername())
        .withExpiresAt(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
        .sign(HMAC512(SECRET.getBytes()));
    response.addHeader(HEADER_STRING, TOKEN_PREFIX + token);
  }

  private String postToVerifyRecaptcha(String recaptchaToken) throws IOException {
    OkHttpClient client = new OkHttpClient();

    RequestBody requestBody = new MultipartBody.Builder()
        .setType(MultipartBody.FORM)
        .addFormDataPart("secret", "TEST") // TODO: put secret
        .addFormDataPart("response", recaptchaToken)
        .build();

    Request request = new Request.Builder()
        .url("https://www.google.com/recaptcha/api/siteverify")
        .post(requestBody)
        .build();

    return client.newCall(request).execute().body().string();
  }
}
