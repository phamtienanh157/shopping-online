/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.shoes;

/**
 *
 * @author phamt
 */
public class Shoes {
    private int id;
    private int typeId;
    private String name;
    private String img;
    private int size;
    private String color;
    private String material;
    private String summary;

    public Shoes() {
    }

    public Shoes(int id, int typeId, String name, String img, int size, String color, String material, String summary) {
        super();
        this.id = id;
        this.typeId = typeId;
        this.name = name;
        this.img = img;
        this.size = size;
        this.color = color;
        this.material = material;
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

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }
    
    
}
