package vn.hcmuaf.edu.fit.model;

import java.io.Serializable;

public class Category implements Serializable {
    String id;
    String bookName;

    public Category(String id, String bookName) {
        this.id = id;
        this.bookName = bookName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id='" + id + '\'' +
                ", bookName='" + bookName + '\'' +
                '}';
    }
}
