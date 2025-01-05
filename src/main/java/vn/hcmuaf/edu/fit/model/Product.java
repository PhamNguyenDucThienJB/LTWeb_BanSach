package vn.hcmuaf.edu.fit.model;

import java.io.Serializable;
import java.util.List;

public class Product implements Serializable {
    String id;
    String name;
    String kind;
    String author;
    String imageUrl;
    String descrip;
    String content;
    List<String> listImg;
    double price;
    List<Comment> comments;
    ProductDetails details;

    public Product(String id, String name, String kind, String author, String imageUrl, String descrip, String content, double price) {
        this.id = id;
        this.name = name;
        this.kind = kind;
        this.author = author;
        this.imageUrl = imageUrl;
        this.descrip = descrip;
        this.content = content;
        this.price = price;
    }

    public Product(String name, String author, String description, String imageUrl, double price) {
        this.name = name;
        this.author = author;
        this.descrip = description;
        this.imageUrl = imageUrl;
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<String> getListImg() {
        return listImg;
    }

    public void setListImg(List<String> listImg) {
        this.listImg = listImg;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public ProductDetails getDetails() {
        return details;
    }

    public void setDetails(ProductDetails details) {
        this.details = details;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", kind='" + kind + '\'' +
                ", sizeBook='" + author + '\'' +
                ", weight=" + imageUrl +
                ", descrip='" + descrip + '\'' +
                ", content='" + content + '\'' +

                ", price=" + price +


                '}';
    }
}