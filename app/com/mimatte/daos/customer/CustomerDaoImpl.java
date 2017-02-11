package com.mimatte.daos.customer;

import java.sql.Connection;

public class CustomerDaoImpl implements CustomerDao {

    private Connection connection;

    public CustomerDaoImpl(Connection connection) {
        this.connection = connection;
    }
}
