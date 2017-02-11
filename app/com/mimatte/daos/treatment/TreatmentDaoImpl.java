package com.mimatte.daos.treatment;

import java.sql.Connection;

public class TreatmentDaoImpl implements TreatmentDao {

    private Connection connection;

    public TreatmentDaoImpl(Connection connection) {
        this.connection = connection;
    }
}
