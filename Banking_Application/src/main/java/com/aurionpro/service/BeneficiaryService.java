package com.aurionpro.service;

import com.aurionpro.dao.BeneficiaryDao;
import com.aurionpro.model.Beneficiary;

import java.util.List;

public class BeneficiaryService {
    private BeneficiaryDao dao = new BeneficiaryDao();

    public boolean addBeneficiary(Beneficiary beneficiary) {
        return dao.addBeneficiary(beneficiary);
    }

    public List<Beneficiary> getBeneficiariesByCustomerId(int customerId) {
        return dao.getBeneficiariesByCustomerId(customerId);
    }
}
