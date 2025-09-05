package com.aurionpro.service;

import com.aurionpro.dao.AdminDao;
import com.aurionpro.model.Admin;

public class AdminService {
    private AdminDao adminDao = new AdminDao();

    // Admin login
    public Admin loginAdmin(String username, String password) {
        return adminDao.login(username, password);
    }
}
