package vn.hcmuaf.edu.fit.model;


import java.io.Serializable;
import java.util.List;

public class Blog implements Serializable {
    String id;
    String title;
    String content;
    String img;
    String date;
    List<String> listdanhmuc;
    List<String> listchude;
    List<String> listdemuc;
    List<String> listchitiet;

    public Blog(String id, String title, String content, String img, String date, List<String> listdanhmuc, List<String> listdemuc) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.img = img;
        this.date = date;
        this.listdanhmuc = listdanhmuc;
        this.listdemuc = listdemuc;
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

    public List<String> getListdanhmuc() {
        return listdanhmuc;
    }

    public void setListdanhmuc(List<String> listdanhmuc) {
        this.listdanhmuc = listdanhmuc;
    }

    public List<String> getListchude() {
        return listchude;
    }

    public void setListchude(List<String> listchude) {
        this.listchude = listchude;
    }

    public List<String> getListdemuc() {
        return listdemuc;
    }

    public void setListdemuc(List<String> listBlog) {
        this.listdemuc = listdemuc;
    }

    public List<String> getListchitiet() {
        return listchitiet;
    }

    public void setListchitiet(List<String> listchitiet) {
        this.listchitiet = listchitiet;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id='" + id + '\'' +
                ", category='" + title + '\'' +
                ", cont='" + content + '\'' +
                ", img='" + img + '\'' +
                ", date='" + date + '\'' +
                ", listdanhmuc=" + listdanhmuc +
                ", listchude=" + listchude +
                ", listdemuc=" + listdemuc +
                ", listchitiet=" + listchitiet +
                '}';
    }
}

