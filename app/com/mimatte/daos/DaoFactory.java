package com.mimatte.daos;

import com.mimatte.daos.appointment.AppointmentDao;
import com.mimatte.daos.customer.CustomerDao;
import com.mimatte.daos.treatment.TreatmentDao;

public interface DaoFactory {

    TreatmentDao createTreatmentDao();

    CustomerDao createCustomerDao();

    AppointmentDao createAppointmentDao();

    void open();

    void close();
}
