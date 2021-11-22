
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import java.sql.PreparedStatement;

import model.Category;
import model.Order;

public class OrderDAOImpl implements OrderDAO {

    @Override
    public void addOrder(Order h) {
        Connection con = DBConnect.getConnecttion();
        String sql = "insert into orders value(?,?,?,?,?,?,?)";
        PreparedStatement ps;

        try {
                ps = (PreparedStatement) con.prepareStatement(sql);
                ps.setInt(1, h.getId_history());
                ps.setInt(2, h.getUser_id());
                ps.setInt(3, h.getMa_san_pham());
                ps.setInt(4, h.getMa_the_loai());
                ps.setTimestamp(5, h.getNgay_mua());
                ps.setInt(6, h.getSo_luong());
                ps.setDouble(7, h.getThanh_tien());
                ps.executeUpdate();
                con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }

    }

    @Override
    public List<Order> getList(int id) {
        Connection con = DBConnect.getConnecttion();
        String sql = "select orders.*, shipment.* from orders,shipment where orders.user_id='"+ id +"' AND shipment.user_id = orders.user_id AND orders.ngay_mua = shipment.ngay_mua AND orders.ma_san_pham = shipment.ma_san_pham AND orders.ma_the_loai = shipment.ma_the_loai";
        List<Order> list = new ArrayList<Order>();
        try {
                PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                        int id_history = rs.getInt("id_history");
                        int user_id = rs.getInt("orders.user_id");
                        int ma_san_pham = rs.getInt("orders.ma_san_pham");
                        int ma_the_loai = rs.getInt("orders.ma_the_loai");
                        Timestamp ngay_mua = rs.getTimestamp("orders.ngay_mua");
                        String ho_ten = rs.getString("shipment.name");
                        String sdt = rs.getString("shipment.phone_number");
                        String dia_chi = rs.getString("shipment.address");
                        String shipment = rs.getString("shipment.shipment_method");
                        int so_luong = rs.getInt("so_luong");
                        double thanh_tien = rs.getDouble("thanh_tien");
                        list.add(new Order(id_history, user_id, ma_san_pham,ma_the_loai, ngay_mua, ho_ten, sdt, dia_chi, so_luong, thanh_tien, shipment));
                }
                con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return list;
    }

    @Override
    public void addShipment(Order h) {
        Connection con = DBConnect.getConnecttion();
        String sql = "insert into shipment value(?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps;

        try {
                ps = (PreparedStatement) con.prepareStatement(sql);
                ps.setInt(1, 0);
                ps.setString(2, h.getShipment());
                ps.setString(3, h.getHo_ten());
                ps.setString(4, h.getSdt());
                ps.setString(5, h.getDia_chi());
                ps.setInt(6, h.getUser_id());
                ps.setTimestamp(7, h.getNgay_mua());
                ps.setInt(8, h.getMa_san_pham());
                ps.setInt(9, h.getMa_the_loai());
                ps.executeUpdate();
                con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }        
    }
	

}
//select orders.*, shipment.* from orders,shipment where orders.user_id='"+ id +"' AND shipment.user_id = orders.user_id AND orders.ngay_mua = shipment.ngay_mua
//        String sql = "select orders.*, shipment.* from orders,shipment where user_id='"+ id +"' AND " ;