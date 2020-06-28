package com.model;

public class MyCar {
    private String qname;
    private float price;
    private int quantity;

    public MyCar() {
    }

    public MyCar(String qname, float price, int quantity) {
        this.qname = qname;
        this.price = price;
        this.quantity = quantity;
    }

    public String getQname() {
        return qname;
    }

    public void setQname(String qname) {
        this.qname = qname;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
