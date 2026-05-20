package model;

import java.sql.*;
import java.util.*;

public class timkiemdao {

    public static List<product> timKiem(String tukhoa) {
        List<product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE name LIKE ?";

        try (Connection con = new connectusear().connect();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + tukhoa + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                product p = new product();
                p.setId(rs.getInt("id"));
                p.setNameString(rs.getString("name"));
                p.setImageString(rs.getString("image"));
                p.setMoney(rs.getFloat("money"));
                list.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}