/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author LENOVO
 */
public class dangkydao {
    Connection connect = null;
    PreparedStatement ps = null;

    public boolean Add(user u) {
        try {
            if (connect == null || connect.isClosed()) {
                connect = new connectusear().connect();
            }
            
            String sql = "INSERT INTO user (username, password, email, full_name, role) VALUES (?, ?, ?, ?, ?)";
            ps = connect.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getFullnameString());
            ps.setInt(5, u.getRole() == 0 ? 1 : u.getRole()); 
            int row = ps.executeUpdate();
            return row > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
