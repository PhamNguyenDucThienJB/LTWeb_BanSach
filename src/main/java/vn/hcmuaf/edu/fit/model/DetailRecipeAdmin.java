package vn.hcmuaf.edu.fit.model;

import java.util.Date;
import java.util.List;

public class DetailRecipeAdmin {
    private String mahd;
    private String maKH;
    private int solg;
    private String diachigiao;
    private float totalprice;
    private int status;
    private String tele;
    private Date date;

    public DetailRecipeAdmin(String mahd, String maKH, int solg, String diachigiao, float totalprice, int status, String tele, Date date) {
        this.mahd = mahd;
        this.maKH = maKH;
        this.solg = solg;
        this.diachigiao = diachigiao;
        this.totalprice = totalprice;
        this.status = status;
        this.tele = tele;
        this.date = date;
    }

    public String getMahd() {
        return mahd;
    }

    public void setMahd(String mahd) {
        this.mahd = mahd;
    }

    public String getMaKH() {
        return maKH;
    }

    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }

    public int getSolg() {
        return solg;
    }

    public void setSolg(int solg) {
        this.solg = solg;
    }

    public String getDiachigiao() {
        return diachigiao;
    }

    public void setDiachigiao(String diachigiao) {
        this.diachigiao = diachigiao;
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

    public String getTele() {
        return tele;
    }

    public void setTele(String tele) {
        this.tele = tele;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
