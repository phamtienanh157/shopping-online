/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.clothes;

/**
 *
 * @author phamt
 */
public class ClothesItem extends Clothes{
    private double price;

    public ClothesItem() {
    }

    public ClothesItem(int id, int typeId, String name, String img, String branch, String size, String color, String summary, double price) {
        super(id, typeId, name, img, branch, size, color, summary);
        this.price = price;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
