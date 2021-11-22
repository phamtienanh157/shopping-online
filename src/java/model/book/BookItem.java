/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.book;

/**
 *
 * @author tutra
 */
public class BookItem extends Book{
	private double price;
        
	public BookItem() {

	}        
	public BookItem(int id, int typeId, String title, String img, String pages, String language, String author, String publisher, String summary, double price) {
		super(id, typeId, title, img, pages, language, author, publisher, summary);
		this.price = price;
	}



	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

}