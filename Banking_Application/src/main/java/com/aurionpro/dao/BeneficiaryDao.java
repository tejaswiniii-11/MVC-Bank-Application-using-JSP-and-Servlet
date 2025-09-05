package com.aurionpro.dao;

import com.aurionpro.database.DBConnection;
import com.aurionpro.model.Beneficiary;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BeneficiaryDao {

    // Add a new beneficiary
    public boolean addBeneficiary(Beneficiary beneficiary) {
        String sql = "INSERT INTO beneficiaries (customer_id, beneficiary_ifsc_code, beneficiary_branch, beneficiary_account_number, nickname) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, beneficiary.getCustomerId());
            ps.setString(2, beneficiary.getIfscCode());
            ps.setString(3, beneficiary.getBranch());
            ps.setLong(4, Long.parseLong(beneficiary.getAccountNumber()));
            ps.setString(5, beneficiary.getNickname());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Fetch all beneficiaries for a customer
    public List<Beneficiary> getBeneficiariesByCustomerId(int customerId) {
        List<Beneficiary> list = new ArrayList<>();
        String sql = "SELECT * FROM beneficiaries WHERE customer_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Beneficiary b = new Beneficiary();
                b.setBeneficiaryId(rs.getInt("beneficiary_id"));
                b.setCustomerId(rs.getInt("customer_id"));
                b.setIfscCode(rs.getString("beneficiary_ifsc_code"));
                b.setBranch(rs.getString("beneficiary_branch"));
                b.setAccountNumber(String.valueOf(rs.getLong("beneficiary_account_number")));
                b.setNickname(rs.getString("nickname"));
                b.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(b);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
