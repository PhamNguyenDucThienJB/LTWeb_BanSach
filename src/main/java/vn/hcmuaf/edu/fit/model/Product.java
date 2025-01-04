package vn.hcmuaf.edu.fit.model;

public class Product {
    private String title;
    private String author;
    private String description;
    private String imageUrl;
    private double price;

    // Constructor
    public Product(String title, String author, String description, String imageUrl, double price) {
        this.title = title;
        this.author = author;
        this.description = description;
        this.imageUrl = imageUrl;
        this.price = price;
    }

    // Getters and Setters
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    // Optional: Override toString() method for easy debugging or printing
    @Override
    public String toString() {
        return "Product [title=" + title + ", author=" + author + ", description=" + description + ", imageUrl=" + imageUrl + ", price=" + price + "]";
    }
}
