/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;
import model.clothes.ClothesItem;

/**
 *
 * @author tutra
 */
public interface ClothesDAO {
    	public List<ClothesItem> findByName(String name);
	public List<ClothesItem> findAll();
        public ClothesItem getClothes(int id)throws SQLException;
}
