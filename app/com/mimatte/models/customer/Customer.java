package com.mimatte.models.customer;

import com.mimatte.models.BaseModel;
import com.mimatte.models.appointment.Appointment;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class Customer extends BaseModel {

    private String name;
    private String surName;
    private LocalDate birthDate;
    private String email;
    private String address;

    private List<Appointment> appointments;

    public Customer() {}

    public Customer(
            Long id,
            LocalDateTime deletedAt,
            LocalDateTime createdAt,
            LocalDateTime updatedAt,
            String name,
            String surName,
            LocalDate birthDate,
            String email,
            String address
    ) {
        super(id, deletedAt, createdAt, updatedAt);

        this.name = name;
        this.surName = surName;
        this.birthDate = birthDate;
        this.email = email;
        this.address = address;
    }

    public Customer(
            Long id,
            LocalDateTime deletedAt,
            LocalDateTime createdAt,
            LocalDateTime updatedAt,
            String name,
            String surName,
            LocalDate birthDate,
            String email,
            String address,
            List<Appointment> appointments
    ) {
        super(id, deletedAt, createdAt, updatedAt);

        this.name = name;
        this.surName = surName;
        this.birthDate = birthDate;
        this.email = email;
        this.address = address;
        this.appointments = appointments;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurName() {
        return surName;
    }

    public void setSurName(String surName) {
        this.surName = surName;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(List<Appointment> appointments) {
        this.appointments = appointments;
    }
}
