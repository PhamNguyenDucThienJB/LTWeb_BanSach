package vn.hcmuaf.edu.fit.service;

import vn.hcmuaf.edu.fit.dto.DBConnection;
import vn.hcmuaf.edu.fit.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
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
        String sql = "SELECT MaSP, MaLS, TenSP, KichThuoc, Tacgia, MoTa, NoiDung, Gia FROM sanpham";
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
                        rs.getString(5),
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

    public static List<Product> listAppearUser() {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT sanpham.MaSP, TenSP, GROUP_CONCAT(Anh) AS listImg, Gia " +
                "FROM sanpham " +
                "JOIN anhsp ON sanpham.MaSP = anhsp.MaSP " +
                "GROUP BY sanpham.MaSP";


        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(sql);
             ResultSet rs = pre.executeQuery()) {

            while (rs.next()) {
                // Tách listImg từ chuỗi GROUP_CONCAT
                String[] imgArray = rs.getString("listImg").split(",");
                List<String> listImg = Arrays.asList(imgArray);

                // Khởi tạo đối tượng Product
                Product newPro = new Product(
                        rs.getString("MaSP"),  // id
                        rs.getString("TenSP"), // name
                        listImg,               // listImg
                        rs.getInt("Gia")       // price
                );

                // Thêm vào danh sách
                productList.add(newPro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
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