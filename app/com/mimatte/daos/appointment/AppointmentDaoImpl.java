package com.mimatte.daos.appointment;

import java.sql.Connection;

public class AppointmentDaoImpl implements AppointmentDao {

    private Connection connection;

    public AppointmentDaoImpl(Connection connection) {
        this.connection = connection;
    }
}
