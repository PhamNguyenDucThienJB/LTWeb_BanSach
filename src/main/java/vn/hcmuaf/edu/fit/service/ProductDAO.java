package vn.hcmuaf.edu.fit.service;

import vn.hcmuaf.edu.fit.dto.DBConnection;
import vn.hcmuaf.edu.fit.model.ProductDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public ProductDetails getProductById(String productId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT s.MaSP, s.TenSP, s.author, s.MoTa, s.Gia, a.Anh " +
                    "FROM sanpham s " +
                    "LEFT JOIN anhsp a ON s.MaSP = a.MaSP " +
                    "WHERE s.MaSP = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, productId);
            rs = stmt.executeQuery();

            // Kiểm tra nếu có dữ liệu
            if (rs.next()) {
                // Lấy thông tin sản phẩm
                String id = rs.getString("MaSP");
                String name = rs.getString("TenSP");
                String author = rs.getString("author");
                String description = rs.getString("MoTa");
                double price = rs.getDouble("Gia");

                // Danh sách chứa các hình ảnh của sản phẩm
                List<String> listImg = new ArrayList<>();
                do {
                    String image = rs.getString("Anh");
                    if (image != null) {
                        listImg.add(image); // Thêm hình ảnh vào danh sách
                    }
                } while (rs.next());

                // Trả về đối tượng ProductDetails
                return new ProductDetails(id, name, author, description, price, listImg);
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
        // Trả về null nếu không tìm thấy sản phẩm
        return null;
    }
}
