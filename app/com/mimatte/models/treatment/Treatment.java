package com.mimatte.models.treatment;

import com.mimatte.models.BaseModel;
import com.mimatte.models.appointment.Appointment;

import java.time.LocalDateTime;
import java.util.List;

public class Treatment extends BaseModel {

    private String name;
    private String description;
    private Double basePrice;
    private Integer duration;
    private TreatmentSubCategory treatmentSubCategory;

    private List<Appointment> appointments;

    public Treatment() {}

    public Treatment(
            Long id,
            LocalDateTime deletedAt,
            LocalDateTime createdAt,
            LocalDateTime updatedAt,
            String name,
            String description,
            Double basePrice,
            Integer duration,
            TreatmentSubCategory treatmentSubCategory
    ) {
        super(id, deletedAt, createdAt, updatedAt);

        this.name = name;
        this.description = description;
        this.basePrice = basePrice;
        this.duration = duration;
        this.treatmentSubCategory = treatmentSubCategory;
    }

    public Treatment(
            Long id,
            LocalDateTime deletedAt,
            LocalDateTime createdAt,
            LocalDateTime updatedAt,
            String name,
            String description,
            Double basePrice,
            Integer duration,
            TreatmentSubCategory treatmentSubCategory,
            List<Appointment> appointments
    ) {
        super(id, deletedAt, createdAt, updatedAt);

        this.name = name;
        this.description = description;
        this.basePrice = basePrice;
        this.duration = duration;
        this.treatmentSubCategory = treatmentSubCategory;
        this.appointments = appointments;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(Double basePrice) {
        this.basePrice = basePrice;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public TreatmentSubCategory getTreatmentSubCategory() {
        return treatmentSubCategory;
    }

    public void setTreatmentSubCategory(TreatmentSubCategory treatmentSubCategory) {
        this.treatmentSubCategory = treatmentSubCategory;
    }

    public List<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(List<Appointment> appointments) {
        this.appointments = appointments;
    }
}
