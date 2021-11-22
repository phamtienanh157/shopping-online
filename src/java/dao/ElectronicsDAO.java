/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;
import model.electronics.ElectronicsItem;


public interface ElectronicsDAO {
    public List<ElectronicsItem> findByName(String name);
    public List<ElectronicsItem> findAll();
    public ElectronicsItem getElect(int id)throws SQLException;
}
