package com.popokis.mimatte.api.controller;

import com.popokis.mimatte.api.entity.Agent;
import com.popokis.mimatte.api.repository.MimatteUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/agent")
public final class AgentController {

  @Autowired
  private MimatteUserRepository agentRepository;

  @GetMapping(path="/add")
  public @ResponseBody String add(@RequestParam String name, @RequestParam String email) {
    Agent agent = new Agent();
    agent.setUsername(name);
    agent.setEmail(email);
    agent.setDigest("123");
    agentRepository.save(agent);
    return "Saved";
  }

  @GetMapping(path="/all")
  public @ResponseBody Iterable<Agent> all() {
    return agentRepository.findAll();
  }
}
