package com.popokis.mimatte.api.config;

import org.springframework.data.domain.AuditorAware;

import java.util.Optional;

public final class AuditorAwareImpl implements AuditorAware<String> {
  @Override
  public Optional<String> getCurrentAuditor() {
    return Optional.empty();
  }
}
