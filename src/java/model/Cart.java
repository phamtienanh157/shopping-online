package model;

import model.book.BookItem;
import model.clothes.ClothesItem;
import model.electronics.ElectronicsItem;
import model.shoes.ShoesItem;

public class Cart {
    private double price;
    private int ma_the_loai;
    private BookItem bookItem;
    private ElectronicsItem electItem;
    private ClothesItem clothesItem;
    private ShoesItem shoesItem;
    private int quantity;

    public Cart() {
    }

    public Cart(BookItem p, int quantity) {
        electItem = new ElectronicsItem();  
        clothesItem = new ClothesItem();
        shoesItem = new ShoesItem();    
        
        this.ma_the_loai=1;
        this.bookItem = p;
        this.quantity = quantity;
    }
    public Cart(ElectronicsItem p, int quantity) {
        bookItem = new BookItem();  
        clothesItem = new ClothesItem();
        shoesItem = new ShoesItem();    
        
        this.ma_the_loai=2;
        this.electItem = p;
        this.quantity = quantity;
    }
    public Cart(ClothesItem p, int quantity) {
        bookItem = new BookItem();
        electItem = new ElectronicsItem();
        shoesItem = new ShoesItem();
        
        this.ma_the_loai=3;
        this.clothesItem = p;
        this.quantity = quantity;
    }
    public Cart(ShoesItem p, int quantity) {
        bookItem = new BookItem(); 
        electItem = new ElectronicsItem();
        clothesItem = new ClothesItem();
        
        this.ma_the_loai=4;
        this.shoesItem = p;
        this.quantity = quantity;
    }        

    public BookItem getBookItem() {
        return bookItem;
    }

    public void setBookItem(BookItem bookItem) {
        this.bookItem = bookItem;
    }

    public ElectronicsItem getElectItem() {
        return electItem;
    }

    public void setElectItem(ElectronicsItem electItem) {
        this.electItem = electItem;
    }

    public ClothesItem getClothesItem() {
        return clothesItem;
    }

    public void setClothesItem(ClothesItem clothesItem) {
        this.clothesItem = clothesItem;
    }

    public ShoesItem getShoesItem() {
        return shoesItem;
    }

    public void setShoesItem(ShoesItem shoesItem) {
        this.shoesItem = shoesItem;
    }

    public int getQuantity() {
            return quantity;
    }

    public void setQuantity(int quantity) {
            this.quantity = quantity;
    }

    public int getMa_the_loai() {
        return ma_the_loai;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}
