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
public class Electronics {
    private int id;
    private int typeId;
    private String name;
    private String img;
    private String brand;
    private String model;
    private String summary;

    public Electronics() {
    }

    public Electronics(int id, int typeId, String name, String img, String brand, String model, String summary) {
        super();
        this.id = id;
        this.typeId = typeId;
        this.name = name;
        this.img = img;
        this.brand = brand;
        this.model = model;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }
    
    
}
