package com.popokis.mimatte.login.filter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

import static com.popokis.mimatte.login.common.SecurityConstants.HEADER_STRING;
import static com.popokis.mimatte.login.common.SecurityConstants.SECRET;
import static com.popokis.mimatte.login.common.SecurityConstants.TOKEN_PREFIX;

public final class JWTAuthorizationFilter extends BasicAuthenticationFilter {

  public JWTAuthorizationFilter(AuthenticationManager authenticationManager) {
    super(authenticationManager);
  }

  @Override
  protected void doFilterInternal(HttpServletRequest request,
                                  HttpServletResponse response,
                                  FilterChain chain) throws IOException, ServletException {
    String header = request.getHeader(HEADER_STRING);

    if (Objects.isNull(header) || !header.startsWith(TOKEN_PREFIX)) {
      chain.doFilter(request, response);
      return;
    }

    UsernamePasswordAuthenticationToken authentication = getAuthentication(request);

    SecurityContextHolder.getContext().setAuthentication(authentication);
    chain.doFilter(request, response);
  }

  private UsernamePasswordAuthenticationToken getAuthentication(HttpServletRequest request) {
    String token = request.getHeader(HEADER_STRING);
    if (Objects.nonNull(token)) {
      String user = JWT.require(Algorithm.HMAC512(SECRET.getBytes()))
          .build()
          .verify(token.replace(TOKEN_PREFIX, ""))
          .getSubject();

      if (Objects.nonNull(user)) {
        return new UsernamePasswordAuthenticationToken(user, null, new ArrayList<>());
      }
      return null;
    }
    return null;
  }
}
