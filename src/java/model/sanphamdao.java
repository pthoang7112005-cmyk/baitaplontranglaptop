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
public class sanphamdao {

    Connection connect = null;
    PreparedStatement ps = null;

    public List<product> GetALL() {
        List<product> dsSanPham = new ArrayList<>();
        try {
            if (connect == null || connect.isClosed()) {
                connect = new connectusear().connect();
            }
            String sql = "SELECT id, name, soluong, loai, mota, image, brand, xuatxu,money FROM products";
            ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product p = new product();
                p.setId(rs.getInt("id"));
                p.setNameString(rs.getString("name"));
                p.setSoluong(rs.getInt("soluong"));
                p.setLoaiString(rs.getString("loai"));
                p.setMotaString(rs.getString("mota"));
                p.setImageString(rs.getString("image"));
                p.setBrandString(rs.getString("brand"));
                p.setXuatxuString(rs.getString("xuatxu"));
                p.setMoney(rs.getFloat("money"));
                dsSanPham.add(p);
            }
            return dsSanPham;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public product GetById(int id) {
        try {
            if (connect == null || connect.isClosed()) {
                connect = new connectusear().connect();
            }
            String sql = "SELECT id, name, soluong, loai, mota, image, brand, xuatxu, money FROM products WHERE id = ?";
            ps = connect.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product p = new product();
                p.setId(rs.getInt("id"));
                p.setNameString(rs.getString("name"));
                p.setSoluong(rs.getInt("soluong"));
                p.setLoaiString(rs.getString("loai"));
                p.setMotaString(rs.getString("mota"));
                p.setImageString(rs.getString("image"));
                p.setBrandString(rs.getString("brand"));
                p.setXuatxuString(rs.getString("xuatxu"));
                p.setMoney(rs.getFloat("money"));
                return p;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public product getById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}