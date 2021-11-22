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
import model.clothes.ClothesItem;


/**
 *
 * @author tutra
 */
public class ClothesDAOImpl implements ClothesDAO{

    @Override
    public List<ClothesItem> findByName(String name) {
        List<ClothesItem> list = new ArrayList<>();
            Connection cons = DBConnect.getConnecttion();
            String sql = "SELECT clothes.*,clothesitem.* FROM clothes,clothesitem WHERE clothes.name LIKE ? AND clothes.id = clothesitem.id";
            try {

                    PreparedStatement ps = cons.prepareStatement(sql);
                    ps.setString(1, "%" + name + "%");
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                            ClothesItem clothesItem = new ClothesItem(rs.getInt("clothes.id"),rs.getInt("ma_the_loai"), rs.getString("name"), rs.getString("img"), rs.getString("brand"),rs.getString("size"), rs.getString("color"),rs.getString("sumary"), rs.getDouble("price"));
                            list.add(clothesItem);
                    }
            } catch (SQLException e) {
                    e.printStackTrace();
            }
            return list;
    }

    @Override
    public List<ClothesItem> findAll() {
        List<ClothesItem> list = new ArrayList<>();
            Connection cons = DBConnect.getConnecttion();
            String sql = "SELECT clothes.*,clothesitem.* FROM clothes,clothesitem WHERE clothes.id = clothesitem.id";
            try {

                    PreparedStatement ps = cons.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                            ClothesItem clothesItem = new ClothesItem(rs.getInt("clothes.id"),rs.getInt("ma_the_loai"), rs.getString("name"), rs.getString("img"), rs.getString("brand"),rs.getString("size"), rs.getString("color"),rs.getString("sumary"), rs.getDouble("price"));
                            list.add(clothesItem);
                    }
            } catch (SQLException e) {
                    e.printStackTrace();
            }
            return list;
    }

    @Override
    public ClothesItem getClothes(int id) throws SQLException {
        ClothesItem clothesItem = null;
        Connection cons = DBConnect.getConnecttion();
        String sql = "SELECT clothes.*,clothesitem.* FROM clothes,clothesitem WHERE clothes.id LIKE ? AND clothes.id = clothesitem.id";

                PreparedStatement ps = cons.prepareStatement(sql);
                ps.setString(1, "%" + id + "%");
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    clothesItem = new ClothesItem(rs.getInt("clothes.id"),rs.getInt("ma_the_loai"), rs.getString("name"), rs.getString("img"), rs.getString("brand"),rs.getString("size"), rs.getString("color"),rs.getString("sumary"), rs.getDouble("price"));
                }
        return clothesItem;   
    }
    
}
