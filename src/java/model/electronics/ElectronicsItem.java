/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.electronics;

/**
 *
 * @author tutra
 */
public class ElectronicsItem extends Electronics {
    private double price;

    public ElectronicsItem() {
    }

    
    public ElectronicsItem(int id, int typeId, String name, String img, String brand, String model, String summary, double price) {
        super(id, typeId, name, img, brand, model, summary);
        this.price = price;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
