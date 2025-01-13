package vn.hcmuaf.edu.fit.model;

public class Ship {
    private String mahd;
    private String ngayGiao;
    private String diachigiao;
    private String sdt;

    public Ship() {

    }

    public Ship(String mahd, String ngayGiao, String diachigiao, String sdt) {
        this.mahd = mahd;
        this.ngayGiao = ngayGiao;
        this.diachigiao = diachigiao;
        this.sdt = sdt;
    }

    public String getMahd() {
        return mahd;
    }

    public void setMahd(String mahd) {
        this.mahd = mahd;
    }

    public String getNgayGiao() {
        return ngayGiao;
    }

    public void setNgayGiao(String ngayGiao) {
        this.ngayGiao = ngayGiao;
    }

    public String getDiachigiao() {
        return diachigiao;
    }

    public void setDiachigiao(String diachigiao) {
        this.diachigiao = diachigiao;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }
}
