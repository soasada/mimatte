package com.popokis.mimatte.api.repository;

import com.popokis.mimatte.api.entity.MimatteUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MimatteUserRepository extends JpaRepository<MimatteUser, Long> {
  MimatteUser findByEmail(String email);
}
