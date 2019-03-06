package com.popokis.mimatte.login.common;

public final class SecurityConstants {

  private SecurityConstants() {}

  public static final String SECRET = "TEST";
  public static final long EXPIRATION_TIME = 1800000; // 30 mins
  public static final String TOKEN_PREFIX = "Bearer ";
  public static final String HEADER_STRING = "Authorization";
}
