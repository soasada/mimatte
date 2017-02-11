package com.mimatte.models.appointment;

import com.mimatte.models.BaseModel;
import com.mimatte.models.customer.Customer;
import com.mimatte.models.treatment.Treatment;

import java.time.LocalDateTime;

public class Appointment extends BaseModel {

    private Customer customer;
    private Treatment treatment;
    private LocalDateTime selectedDatetime;

    public Appointment() {}

    public Appointment(
            Long id,
            LocalDateTime deletedAt,
            LocalDateTime createdAt,
            LocalDateTime updatedAt,
            Customer customer,
            Treatment treatment,
            LocalDateTime selectedDatetime
    ) {
        super(id, deletedAt, createdAt, updatedAt);

        this.customer = customer;
        this.treatment = treatment;
        this.selectedDatetime = selectedDatetime;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Treatment getTreatment() {
        return treatment;
    }

    public void setTreatment(Treatment treatment) {
        this.treatment = treatment;
    }

    public LocalDateTime getSelectedDatetime() {
        return selectedDatetime;
    }

    public void setSelectedDatetime(LocalDateTime selectedDatetime) {
        this.selectedDatetime = selectedDatetime;
    }
}
