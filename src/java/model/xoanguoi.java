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
public class xoanguoi {
    Connection connect = null;
    PreparedStatement ps = null;
    
    public void delete(String id) {
        try {
            if (connect == null || connect.isClosed()) {
                connect = new connectusear().connect();
            }
            String sql = "DELETE FROM user WHERE user_id =?";
            ps = connect.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
