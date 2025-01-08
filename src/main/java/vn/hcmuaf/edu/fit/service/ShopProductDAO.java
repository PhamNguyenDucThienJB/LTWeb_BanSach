package vn.hcmuaf.edu.fit.service;

import vn.hcmuaf.edu.fit.dto.DBConnection;
import vn.hcmuaf.edu.fit.model.ProductDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ShopProductDAO {
    public List<ProductDetails> getAllProducts() {
        List<ProductDetails> products = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT s.MaSP, s.TenSP, s.author, s.MoTa, s.Gia, a.Anh " +
                    "FROM sanpham s " +
                    "LEFT JOIN anhsp a ON s.MaSP = a.MaSP " +
                    "LIMIT 16"; // Giới hạn 16 sản phẩm
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            Map<String, ProductDetails> productMap = new HashMap<>();

            while (rs.next()) {
                String id = rs.getString("MaSP");
                ProductDetails product = productMap.get(id);

                if (product == null) {
                    String name = rs.getString("TenSP");
                    String author = rs.getString("author");
                    String description = rs.getString("MoTa");
                    double price = rs.getDouble("Gia");
                    product = new ProductDetails(id, name, author, description, price, new ArrayList<>());
                    productMap.put(id, product);
                    products.add(product);
                }

                String image = rs.getString("Anh");
                if (image != null) {
                    product.getListImg().add(image);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return products;
    }
}

