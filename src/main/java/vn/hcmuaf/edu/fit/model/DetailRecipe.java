package vn.hcmuaf.edu.fit.model;

import java.text.NumberFormat;
import java.util.Date;
import java.util.List;

public class DetailRecipe {
    private String mahd;
    private String masp;
    private String tensp;
    private int solg;
    private List<String> anhsp;
    private int price;
    private String diachigiao;
    private float totalprice;
    private int status;
    private String tele;
    private Date date;


    public DetailRecipe(String mahd, String masp, String tensp, int solg, List<String> anhsp, int price, String diachigiao, float totalprice, int status, String tele, Date date) {
        this.mahd = mahd;
        this.masp = masp;
        this.tensp = tensp;
        this.solg = solg;
        this.anhsp = anhsp;
        this.price = price;
        this.diachigiao = diachigiao;
        this.totalprice = totalprice;
        this.status = status;
        this.tele = tele;
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getToTalPrice() {
        int res = 0;
        res = this.price * this.solg;
        return res;
    }

    public String getDiachigiao() {
        return diachigiao;
    }

    public void setDiachigiao(String diachigiao) {
        this.diachigiao = diachigiao;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public String getTele() {
        return tele;
    }

    public void setTele(String tele) {
        this.tele = tele;
    }

    public List<String> getAnhsp() {
        return anhsp;
    }

    public void setAnhsp(List<String> anhsp) {
        this.anhsp = anhsp;
    }


    public String getMahd() {
        return mahd;
    }

    public void setMahd(String mahd) {
        this.mahd = mahd;
    }

    public String getMasp() {
        return masp;
    }

    public void setMasp(String masp) {
        this.masp = masp;
    }

    public int getSolg() {
        return solg;
    }

    public void setSolg(int solg) {
        this.solg = solg;
    }

    public static String formatNum(int price) {
        NumberFormat vn = NumberFormat.getInstance();
        String result = vn.format(price);
        return result;
    }

    public float getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(float totalprice) {
        this.totalprice = totalprice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "CTHD{" +
                "mahd='" + mahd + '\'' +
                ", masp='" + masp + '\'' +
                ", tensp='" + tensp + '\'' +
                ", solg=" + solg +
                ", anhsp=" + anhsp +
                ", price=" + price +
                '}';
    }
}

