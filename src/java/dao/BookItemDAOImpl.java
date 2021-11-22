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

import model.book.Book;
import model.book.BookItem;

public class BookItemDAOImpl implements BookItemDAO {

    public BookItemDAOImpl() {
            super();
    }

    @Override
    public List<BookItem> findByName(String name) {
        List<BookItem> list = new ArrayList<>();
        Connection cons = DBConnect.getConnecttion();
        String sql = "SELECT book.*,bookitem.* FROM book,bookitem WHERE book.name LIKE ? AND book.id = bookitem.bookId";
        try {

                PreparedStatement ps = cons.prepareStatement(sql);
                ps.setString(1, "%" + name + "%");
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                        BookItem bookItem = new BookItem(rs.getInt("book.id"),rs.getInt("ma_the_loai"), rs.getString("title"), rs.getString("img"), rs.getString("pages"),
                                rs.getString("language"), rs.getString("author"),rs.getString("publisher"), rs.getString("summary"), rs.getDouble("price"));
                        list.add(bookItem);
                }
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookItem> findAll() {
        List<BookItem> list = new ArrayList<>();
        Connection cons = DBConnect.getConnecttion();
        String sql = "SELECT book.*,bookitem.* FROM book,bookitem WHERE book.id = bookitem.bookId";
        try {

                PreparedStatement ps = cons.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                        BookItem bookItem = new BookItem(rs.getInt("book.id"),rs.getInt("ma_the_loai"), rs.getString("title"), rs.getString("img"), rs.getString("pages"),
                                rs.getString("language"), rs.getString("author"),rs.getString("publisher"), rs.getString("summary"), rs.getDouble("price"));
                        list.add(bookItem);
                }
        } catch (SQLException e) {
                e.printStackTrace();
        }

        return list;
    }

    @Override
    public BookItem getBook(int id) throws SQLException  {
        BookItem bookItem = null;
        Connection cons = DBConnect.getConnecttion();
        String sql = "SELECT book.*,bookitem.* FROM book,bookitem WHERE book.id LIKE ? AND book.id = bookitem.bookId";

                PreparedStatement ps = cons.prepareStatement(sql);
                ps.setString(1, "%" + id + "%");
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    bookItem = new BookItem(rs.getInt("book.id"),rs.getInt("ma_the_loai"), rs.getString("title"), rs.getString("img"), rs.getString("pages"),rs.getString("language"), rs.getString("author"),rs.getString("publisher"), rs.getString("summary"), rs.getDouble("price"));
                }
        return bookItem;   
    }

}