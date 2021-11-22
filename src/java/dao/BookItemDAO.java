/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;

import model.book.BookItem;

public interface BookItemDAO {
	public List<BookItem> findByName(String name);
	public List<BookItem> findAll();
        public BookItem getBook(int id)throws SQLException;
}