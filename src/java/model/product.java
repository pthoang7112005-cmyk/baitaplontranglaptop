/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class product {
    private int id,soluong;
    private String nameString,loaiString,motaString,imageString,brandString,xuatxuString;
    private float money;

    public product() {
    }

    public product(int id, int soluong, String nameString, String loaiString, String motaString, String imageString, String brandString, String xuatxuString,float money) {
        this.id = id;
        this.soluong = soluong;
        this.nameString = nameString;
        this.loaiString = loaiString;
        this.motaString = motaString;
        this.imageString = imageString;
        this.brandString = brandString;
        this.xuatxuString = xuatxuString;
        this.money=money;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public String getNameString() {
        return nameString;
    }

    public void setNameString(String nameString) {
        this.nameString = nameString;
    }

    public String getLoaiString() {
        return loaiString;
    }

    public void setLoaiString(String loaiString) {
        this.loaiString = loaiString;
    }

    public String getMotaString() {
        return motaString;
    }

    public void setMotaString(String motaString) {
        this.motaString = motaString;
    }

    public String getImageString() {
        return imageString;
    }

    public void setImageString(String imageString) {
        this.imageString = imageString;
    }

    public String getBrandString() {
        return brandString;
    }

    public void setBrandString(String brandString) {
        this.brandString = brandString;
    }

    public String getXuatxuString() {
        return xuatxuString;
    }

    public void setXuatxuString(String xuatxuString) {
        this.xuatxuString = xuatxuString;
    }

    public float getMoney() {
        return money;
    }

    public void setMoney(float money) {
        this.money = money;
    }
    
    
}
