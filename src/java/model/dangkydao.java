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

    public void Add(user u) {
        try {
            if (connect == null || connect.isClosed()) {
                connect = new connectusear().connect();
            }
            // role mặc định khi đăng ký là 1 (hoặc theo quy ước dự án của bạn), id tự tăng không cần truyền
            String sql = "INSERT INTO user (username, password, email, full_name, role) VALUES (?, ?, ?, ?, ?)";
            ps = connect.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getFullnameString());
            ps.setInt(5, u.getRole() == 0 ? 1 : u.getRole()); // Mặc định role là 1 nếu chưa được set
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
