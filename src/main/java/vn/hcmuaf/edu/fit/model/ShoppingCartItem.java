package vn.hcmuaf.edu.fit.model;

import java.text.NumberFormat;

public class ShoppingCartItem {
    private String masp;
    private int soLgMua;
    private ProductDetails sp;
    private double price;
    private Order order;

    public ShoppingCartItem() {
    }

    public ShoppingCartItem(String masp, int soLgMua, ProductDetails sp, double price, Order order) {
        this.masp = masp;
        this.soLgMua = soLgMua;
        this.sp = sp;
        this.price = price;
        this.order = order;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public String getMasp() {
        return masp;
    }

    public void setMasp(String masp) {
        this.masp = masp;
    }

    public int getSoLgMua() {
        return soLgMua;
    }

    public void setSoLgMua(int soLgMua) {
        this.soLgMua = soLgMua;
    }

    public ProductDetails getSp() {
        return sp;
    }

    public void setSp(ProductDetails sp) {
        this.sp = sp;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }


    public void quantityUp(int solg) {
        setSoLgMua(this.soLgMua + solg);
    }

    public double giaSanPhamTrongGioHang() {
        double cost = 0;
        cost = this.getSp().getPrice() * this.getSoLgMua();
        return cost;
    }

    @Override
    public String toString() {
        return "ItemProductInCart{" +
                "masp='" + masp + '\'' +
                ", soLgMua=" + soLgMua +
                ", sp=" + sp +
                ", price=" + price +
                ", order=" + order +
                '}';
    }

    public static String formatNum(double num) {
        NumberFormat vn = NumberFormat.getInstance();
        String result = vn.format(num);
        return result;
    }
}
