package model;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

public class Order {
    private int id_history;
    private int user_id;
    private int ma_san_pham;
    private int ma_the_loai;
    private Timestamp ngay_mua;
    private String ho_ten;
    private String sdt;
    private String dia_chi;
    private int so_luong;
    private double thanh_tien;
    private String shipment;

    public Order() {
    }

    public Order(int id_history, int user_id, int ma_san_pham, int ma_the_loai, Timestamp ngay_mua, String ho_ten, String sdt, String dia_chi, int so_luong, double thanh_tien, String shipment) {
        this.id_history = id_history;
        this.user_id = user_id;
        this.ma_san_pham = ma_san_pham;
        this.ma_the_loai = ma_the_loai;
        this.ngay_mua = ngay_mua;
        this.ho_ten = ho_ten;
        this.sdt = sdt;
        this.dia_chi = dia_chi;
        this.so_luong = so_luong;
        this.thanh_tien = thanh_tien;
        this.shipment = shipment;
    }



    public int getId_history() {
            return id_history;
    }

    public void setId_history(int id_history) {
            this.id_history = id_history;
    }

    public int getUser_id() {
            return user_id;
    }

    public void setUser_id(int user_id) {
            this.user_id = user_id;
    }

    public int getMa_san_pham() {
            return ma_san_pham;
    }

    public void setMa_san_pham(int ma_san_pham) {
            this.ma_san_pham = ma_san_pham;
    }

    public int getMa_the_loai() {
        return ma_the_loai;
    }

    public void setMa_the_loai(int ma_the_loai) {
        this.ma_the_loai = ma_the_loai;
    }

    public Timestamp getNgay_mua() {
            return ngay_mua;
    }

    public void setNgay_mua(Timestamp ngay_mua) {
            this.ngay_mua = ngay_mua;
    }

    public int getSo_luong() {
            return so_luong;
    }

    public void setSo_luong(int so_luong) {
            this.so_luong = so_luong;
    }

    public double getThanh_tien() {
            return thanh_tien;
    }

    public void setThanh_tien(double thanh_tien) {
            this.thanh_tien = thanh_tien;
    }

    public String getHo_ten() {
        return ho_ten;
    }

    public void setHo_ten(String ho_ten) {
        this.ho_ten = ho_ten;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getDia_chi() {
        return dia_chi;
    }

    public void setDia_chi(String dia_chi) {
        this.dia_chi = dia_chi;
    }

    public String getShipment() {
        return shipment;
    }

    public void setShipment(String shipment) {
        this.shipment = shipment;
    }

    

}
