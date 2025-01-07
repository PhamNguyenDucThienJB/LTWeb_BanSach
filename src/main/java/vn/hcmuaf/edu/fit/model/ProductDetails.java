package vn.hcmuaf.edu.fit.model;

import java.util.List;

public class ProductDetails {
    private String id;
    private String name;
    private String author;
    private String description;
    private double price;
    private List<String> listImg;

    // Constructor, getters, and setters
    public ProductDetails(String id, String name, String author, String description, double price, List<String> listImg) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.description = description;
        this.price = price;
        this.listImg = listImg;
    }


    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAuthor() {
        return author;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public List<String> getListImg() {
        return listImg;
    }

    public void setListImg(List<String> asList) {
    }
}
