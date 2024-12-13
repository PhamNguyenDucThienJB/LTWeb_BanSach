package vn.hcmuaf.edu.fit.service;

import vn.hcmuaf.edu.fit.dto.DBConnection;
import vn.hcmuaf.edu.fit.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    private static final long serialVersionalUID = 1L;
    private static ProductService instance;

    // Use Structure Singleton to maintain THE OnlyOne
    public static ProductService getInstance() {
        if (instance == null) {
            instance = new ProductService();
        }

        return instance;
    }

    public static List<Product> getDataProduct() {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT MaSP, MaLS, TenSP, KichThuoc, KhoiLuong, MoTa, NoiDung, Gia FROM sanpham";
        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(sql);
             ResultSet rs = pre.executeQuery();

        ) {
            while (rs.next()) {
                Product product = new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8)

                );
                listProduct.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


        return listProduct;
    }
    public static void main(String[] args) {
        // Gọi phương thức getData để lấy dữ liệu sản phẩm
        List<Product> products = ProductService.getDataProduct();

        // In ra thông tin của các sản phẩm để kiểm tra kết quả
        for (Product product : products) {
            System.out.println(product);  // Sử dụng phương thức toString() của Product để in ra thông tin
        }
    }
}
