package com.aurionpro.service;

import java.sql.SQLException;
import java.util.List;

import com.aurionpro.dao.AccountDao;
import com.aurionpro.model.Account;



public class AccountService {

    private AccountDao accountDao = new AccountDao();

    public boolean createAccount(Account account) {
        return accountDao.createAccount(account);
    }
    
   //For profile
    public List<Account> getAccountsByCustomerId(int customerId) {
        return accountDao.getAccountsByCustomerId(customerId);
    }
    
    
    // to see all accounts - for admin
    public List<Account> fetchAllAccounts() throws SQLException {
        return accountDao.getAllAccounts();
    }
    
    public List<Account> getPendingAccounts() {
        return accountDao.getPendingAccounts();
    }

    public boolean approveAccount(int accountId) {
        return accountDao.updateAccountStatus(accountId, "APPROVED");
    }

    public boolean rejectAccount(int accountId) {
        return accountDao.updateAccountStatus(accountId, "REJECTED");
    }

}
