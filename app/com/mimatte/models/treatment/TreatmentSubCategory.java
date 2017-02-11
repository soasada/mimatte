package com.mimatte.models.treatment;

import com.mimatte.models.BaseModel;

import java.util.List;

public class TreatmentSubCategory extends BaseModel {

    private String code;
    private String name;
    private TreatmentCategory treatmentCategory;

    private List<Treatment> treatments;
}
