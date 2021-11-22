/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.shoes.ShoesItem;

/**
 *
 * @author tutra
 */
public class ShoesDAOImpl implements ShoesDAO {

    @Override
    public List<ShoesItem> findByName(String name) {
        List<ShoesItem> list = new ArrayList<>();
        Connection cons = DBConnect.getConnecttion();
        String sql = "SELECT shoes.*,shoesitem.* FROM shoes,shoesitem WHERE shoes.name LIKE ? AND shoes.id = shoesitem.id";
        try {

                PreparedStatement ps = cons.prepareStatement(sql);
                ps.setString(1, "%" + name + "%");
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                        ShoesItem shoesItem = new ShoesItem(rs.getInt("shoes.id"),rs.getInt("ma_the_loai"), rs.getString("name"), rs.getString("img"),rs.getInt("size"), rs.getString("color"), rs.getString("material"), rs.getString("sumary"), rs.getDouble("price"));
                        list.add(shoesItem);
                }
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<ShoesItem> findAll() {
        List<ShoesItem> list = new ArrayList<>();
        Connection cons = DBConnect.getConnecttion();
        String sql = "SELECT shoes.*,shoesitem.* FROM shoes,shoesitem WHERE shoes.id = shoesitem.id";
        try {

                PreparedStatement ps = cons.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                        ShoesItem shoesItem = new ShoesItem(rs.getInt("shoes.id"),rs.getInt("ma_the_loai"), rs.getString("name"), rs.getString("img"),rs.getInt("size"), rs.getString("color"), rs.getString("material"), rs.getString("sumary"), rs.getDouble("price"));
                        ShoesItem test = shoesItem;
                        list.add(shoesItem);
                }
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return list;
    }

    @Override
    public ShoesItem getShoes(int id) throws SQLException {
        ShoesItem shoesItem = null;
        Connection cons = DBConnect.getConnecttion();
        String sql = "SELECT shoes.*,shoesitem.* FROM shoes,shoesitem WHERE shoes.id LIKE ? AND shoes.id = shoesitem.id";

                PreparedStatement ps = cons.prepareStatement(sql);
                ps.setString(1, "%" + id + "%");
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    shoesItem = new ShoesItem(rs.getInt("shoes.id"),rs.getInt("ma_the_loai"), rs.getString("name"), rs.getString("img"),rs.getInt("size"), rs.getString("color"), rs.getString("material"), rs.getString("sumary"), rs.getDouble("price"));
                }
        return shoesItem;   
    }
    
}
