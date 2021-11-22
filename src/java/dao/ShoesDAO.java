/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;
import model.shoes.ShoesItem;

/**
 *
 * @author tutra
 */
public interface ShoesDAO {
	public List<ShoesItem> findByName(String name);
	public List<ShoesItem> findAll();    
        public ShoesItem getShoes(int id)throws SQLException;
}
