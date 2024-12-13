package vn.hcmuaf.edu.fit.model;


import java.io.Serializable;
import java.util.List;

public class Blog implements Serializable {
    String id;
    String title;
    String content;
    String img;
    String date;
    String danhmuc;
    String chude;
    String listdemuc;
    String listchitiet;

    public Blog(String id, String title, String content, String img, String date, String danhmuc, String chude) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.img = img;
        this.date = date;
        this.danhmuc = danhmuc;
        this.chude = chude;

    }

    public String getDanhmuc() {
        return danhmuc;
    }

    public void setDanhmuc(String danhmuc) {
        this.danhmuc = danhmuc;
    }

    public String getChude() {
        return chude;
    }

    public void setChude(String chude) {
        this.chude = chude;
    }

    public String getListdemuc() {
        return listdemuc;
    }

    public void setListdemuc(String listdemuc) {
        this.listdemuc = listdemuc;
    }

    public String getListchitiet() {
        return listchitiet;
    }

    public void setListchitiet(String listchitiet) {
        this.listchitiet = listchitiet;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", img='" + img + '\'' +
                ", date='" + date + '\'' +
                ", danhmuc='" + danhmuc + '\'' +
                ", chude='" + chude + '\'' +
                ", listdemuc='" + listdemuc + '\'' +
                ", listchitiet='" + listchitiet + '\'' +
                '}';
    }
}


