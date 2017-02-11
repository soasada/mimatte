package com.mimatte.models.treatment;

import com.mimatte.models.BaseModel;

import java.time.LocalDateTime;
import java.util.List;

public class TreatmentCategory extends BaseModel {

    private String code;
    private String name;

    private List<TreatmentSubCategory> treatmentSubCategories;

    public TreatmentCategory() {}

    public TreatmentCategory(
            Long id,
            LocalDateTime deletedAt,
            LocalDateTime createdAt,
            LocalDateTime updatedAt,
            String code,
            String name
    ) {
        super(id, deletedAt, createdAt, updatedAt);

        this.code = code;
        this.name = name;
    }

    public TreatmentCategory(
            Long id,
            LocalDateTime deletedAt,
            LocalDateTime createdAt,
            LocalDateTime updatedAt,
            String code,
            String name,
            List<TreatmentSubCategory> treatmentSubCategories
    ) {
        super(id, deletedAt, createdAt, updatedAt);

        this.code = code;
        this.name = name;
        this.treatmentSubCategories = treatmentSubCategories;
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

    public List<TreatmentSubCategory> getTreatmentSubCategories() {
        return treatmentSubCategories;
    }

    public void setTreatmentSubCategories(List<TreatmentSubCategory> treatmentSubCategories) {
        this.treatmentSubCategories = treatmentSubCategories;
    }
}
