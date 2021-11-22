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
import model.electronics.ElectronicsItem;

/**
 *
 * @author tutra
 */
public class ElectronicsDAOImpl implements ElectronicsDAO {

    public ElectronicsDAOImpl() {
            super();
    }

    @Override
    public List<ElectronicsItem> findByName(String name) {
        List<ElectronicsItem> list = new ArrayList<>();
        Connection cons = DBConnect.getConnecttion();
	String sql = "SELECT electronics.*,electronicsitem.* FROM electronics,electronicsitem WHERE electronics.name LIKE ? AND electronics.id = electronicsitem.electronicsId";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ElectronicsItem electronicsItem = new ElectronicsItem(rs.getInt("electronics.id"),rs.getInt("ma_the_loai"), rs.getString("name"), rs.getString("img"), rs.getString("brand"),rs.getString("model"), rs.getString("summary"), rs.getDouble("price"));
		list.add(electronicsItem);
            }
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;
    }

    @Override
    public List<ElectronicsItem> findAll() {
        List<ElectronicsItem> list = new ArrayList<>();
        Connection cons = DBConnect.getConnecttion();
	String sql = "SELECT electronics.*,electronicsitem.* FROM electronics,electronicsitem WHERE electronics.id = electronicsitem.electronicsId";
        try {
            PreparedStatement ps = cons.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ElectronicsItem electronicsItem = new ElectronicsItem(rs.getInt("electronics.id"),rs.getInt("ma_the_loai"), rs.getString("name"), rs.getString("img"), rs.getString("brand"),rs.getString("model"), rs.getString("summary"), rs.getDouble("price"));
		list.add(electronicsItem);
            }
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;
    }

    @Override
    public ElectronicsItem getElect(int id) throws SQLException {
        ElectronicsItem elec = null;
        Connection cons = DBConnect.getConnecttion();
        String sql = "SELECT electronics.*,electronicsitem.* FROM electronics,electronicsitem WHERE electronics.id LIKE ? AND electronics.id = electronicsitem.electronicsId";

                PreparedStatement ps = cons.prepareStatement(sql);
                ps.setString(1, "%" + id + "%");
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    elec = new ElectronicsItem(rs.getInt("electronics.id"),rs.getInt("ma_the_loai"), rs.getString("name"), rs.getString("img"), rs.getString("brand"),rs.getString("model"), rs.getString("summary"), rs.getDouble("price"));
                }
        return elec;   
    }
    
    
}
