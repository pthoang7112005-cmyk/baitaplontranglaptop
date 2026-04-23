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
public class suadao {

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

    public void Update(user u) {
        try {
            if (connect == null || connect.isClosed()) {
                connect = new connectusear().connect();
            }
            String sql = "UPDATE user SET username=?, password=?, email=?, full_name=?, role=? WHERE user_id=?";
            ps = connect.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getFullnameString());
            ps.setInt(5, u.getRole());
            ps.setInt(6, u.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
