package com.mimatte.daos;

import com.google.inject.Inject;
import com.mimatte.daos.appointment.AppointmentDao;
import com.mimatte.daos.appointment.AppointmentDaoImpl;
import com.mimatte.daos.customer.CustomerDao;
import com.mimatte.daos.customer.CustomerDaoImpl;
import com.mimatte.daos.treatment.TreatmentDao;
import com.mimatte.daos.treatment.TreatmentDaoImpl;
import play.db.Database;

import java.sql.Connection;
import java.sql.SQLException;

public class DaoFactoryImpl implements DaoFactory {

    private Database DB;

    private Connection connection;

    @Inject
    public DaoFactoryImpl(Database DB) {
        this.DB = DB;
    }

    @Override
    public TreatmentDao createTreatmentDao() {
        return new TreatmentDaoImpl(connection);
    }

    @Override
    public CustomerDao createCustomerDao() {
        return new CustomerDaoImpl(connection);
    }

    @Override
    public AppointmentDao createAppointmentDao() {
        return new AppointmentDaoImpl(connection);
    }

    @Override
    public void open() {
        this.connection = this.DB.getConnection();
    }

    @Override
    public void close() {
        try {
            this.connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
