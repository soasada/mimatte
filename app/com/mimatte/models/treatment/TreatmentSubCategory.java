package com.mimatte.models.treatment;

import com.mimatte.models.BaseModel;

import java.time.LocalDateTime;
import java.util.List;

public class TreatmentSubCategory extends BaseModel {

    private String code;
    private String name;
    private TreatmentCategory treatmentCategory;

    private List<Treatment> treatments;

    public TreatmentSubCategory() {}

    public TreatmentSubCategory(
            Long id,
            LocalDateTime deletedAt,
            LocalDateTime createdAt,
            LocalDateTime updatedAt,
            String code,
            String name,
            TreatmentCategory treatmentCategory
    ) {
        super(id, deletedAt, createdAt, updatedAt);

        this.code = code;
        this.name = name;
        this.treatmentCategory = treatmentCategory;
    }

    public TreatmentSubCategory(
            Long id,
            LocalDateTime deletedAt,
            LocalDateTime createdAt,
            LocalDateTime updatedAt,
            String code,
            String name,
            TreatmentCategory treatmentCategory,
            List<Treatment> treatments
    ) {
        super(id, deletedAt, createdAt, updatedAt);

        this.code = code;
        this.name = name;
        this.treatmentCategory = treatmentCategory;
        this.treatments = treatments;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public TreatmentCategory getTreatmentCategory() {
        return treatmentCategory;
    }

    public void setTreatmentCategory(TreatmentCategory treatmentCategory) {
        this.treatmentCategory = treatmentCategory;
    }

    public List<Treatment> getTreatments() {
        return treatments;
    }

    public void setTreatments(List<Treatment> treatments) {
        this.treatments = treatments;
    }
}
