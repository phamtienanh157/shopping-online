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
public class Book {
    private int id;
    private int typeId;
    private String title;
    private String img;
    private String pages;
    private String language;
    private String author;
    private String publisher;
    private String summary;

    public Book() {
            // TODO Auto-generated constructor stub
    }

    public Book(int id, int typeId, String title, String img, String pages, String language, String author, String publisher, String summary) {
        super();
        this.id = id;
        this.typeId = typeId;
        this.title = title;
        this.img = img;
        this.pages = pages;
        this.language = language;
        this.author = author;
        this.publisher = publisher;
        this.summary = summary;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getPages() {
        return pages;
    }

    public void setPages(String pages) {
        this.pages = pages;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }



}
