package com.popokis.mimatte.api.entity;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.LocalDateTime;

@Entity
@EntityListeners(AuditingEntityListener.class)
public final class Appointment {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Integer id;
  private LocalDateTime selectedDatetime;
  private Boolean accepted;
  private String comments;

  @CreatedDate
  private LocalDateTime createdAt;
  @LastModifiedDate
  private LocalDateTime updatedAt;

  @ManyToOne
  @JoinColumn(name = "customer_id", nullable = false)
  private MimatteUser customer;

  @ManyToOne
  @JoinColumn(name = "agent_id", nullable = false)
  private MimatteUser agent;

  @ManyToOne
  @JoinColumn(name = "product_id", nullable = false)
  private Product product;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public LocalDateTime getSelectedDatetime() {
    return selectedDatetime;
  }

  public void setSelectedDatetime(LocalDateTime selectedDatetime) {
    this.selectedDatetime = selectedDatetime;
  }

  public Boolean getAccepted() {
    return accepted;
  }

  public void setAccepted(Boolean accepted) {
    this.accepted = accepted;
  }

  public String getComments() {
    return comments;
  }

  public void setComments(String comments) {
    this.comments = comments;
  }

  public LocalDateTime getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(LocalDateTime createdAt) {
    this.createdAt = createdAt;
  }

  public LocalDateTime getUpdatedAt() {
    return updatedAt;
  }

  public void setUpdatedAt(LocalDateTime updatedAt) {
    this.updatedAt = updatedAt;
  }

  public MimatteUser getCustomer() {
    return customer;
  }

  public void setCustomer(MimatteUser customer) {
    this.customer = customer;
  }

  public MimatteUser getAgent() {
    return agent;
  }

  public void setAgent(MimatteUser agent) {
    this.agent = agent;
  }

  public Product getProduct() {
    return product;
  }

  public void setProduct(Product product) {
    this.product = product;
  }
}
