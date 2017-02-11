package com.mimatte.models.appointment;

import com.mimatte.models.BaseModel;

import java.time.LocalDateTime;

public class RejectedAppointment extends BaseModel {

    private Appointment appointment;

    public RejectedAppointment() {}

    public RejectedAppointment(
            Long id,
            LocalDateTime deletedAt,
            LocalDateTime createdAt,
            LocalDateTime updatedAt,
            Appointment appointment
    ) {
        super(id, deletedAt, createdAt, updatedAt);

        this.appointment = appointment;
    }

    public Appointment getAppointment() {
        return appointment;
    }

    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }
}
