/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class quanlydao {
    Connection connect = null;
    PreparedStatement ps = null;

    public List<user> GetALL() {
        List<user> dsUser = new ArrayList<>();
        try {
            if (connect == null || connect.isClosed()) {
                connect = new connectusear().connect();
            }
            String sql = "SELECT * FROM user";
            ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user u = new user();
                u.setId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setFullnameString(rs.getString("full_name"));
                u.setRole(rs.getInt("role"));
                dsUser.add(u);
            }
            return dsUser;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
}
