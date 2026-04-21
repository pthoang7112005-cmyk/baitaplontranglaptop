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
public class dangnhapdao {

    Connection connect = null;
    PreparedStatement ps = null;

    public user checkLogin(String username, String password) {
        try {
            if (connect == null || connect.isClosed()) {
                connect = new connectusear().connect();
            }
            String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
            ps = connect.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user xm = new user();
                // Sửa lại các tên cột cho đúng với ảnh chụp phpMyAdmin của bạn
                xm.setId(rs.getInt("user_id")); // Trong ảnh là user_id, không phải id
                xm.setUsername(rs.getString("username"));
                xm.setPassword(rs.getString("password"));
                xm.setRole(rs.getInt("role"));
                xm.setEmail(rs.getString("email"));
                xm.setFullnameString(rs.getString("full_name")); // Sửa từ fullnameString thành full_name
                return xm;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
