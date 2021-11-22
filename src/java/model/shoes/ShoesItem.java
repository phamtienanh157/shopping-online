/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.shoes;

import model.shoes.Shoes;

/**
 *
 * @author phamt
 */
public class ShoesItem extends Shoes {

    private double price;

    public ShoesItem() {
    }

    public ShoesItem(int id, int typeId, String name, String img, int size, String color, String material, String summary, double price ) {
        super(id, typeId, name, img, size, color, material, summary);
        this.price = price;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
