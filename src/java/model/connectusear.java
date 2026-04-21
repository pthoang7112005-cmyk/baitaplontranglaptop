/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author LENOVO
 */
public class connectusear {
     public Connection connect()
    {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql="jdbc:mysql://localhost:3306/trangbanlaptoplon";
            return DriverManager.getConnection(sql,"root","");
        } catch (Exception e) {
        }
        return null;
    }
    
}
