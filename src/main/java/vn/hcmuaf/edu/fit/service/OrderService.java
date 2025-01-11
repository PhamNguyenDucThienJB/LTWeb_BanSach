package vn.hcmuaf.edu.fit.service;

import vn.hcmuaf.edu.fit.dto.DBConnection;
import vn.hcmuaf.edu.fit.model.Order;
import vn.hcmuaf.edu.fit.model.ShoppingCartItem;

import java.sql.*;
import java.util.Map;

public class OrderService {
    private static final long serialVersionalUID = 1L;
    private static OrderService instance;

    // Use Structure Singleton to maintain THE OnlyOne
    public static OrderService getInstance() {
        if (instance == null) {
            instance = new OrderService();
        }

        return instance;
    }

    public static String getLastMaHD() {
        String sql = "SELECT hoadon.MAHD FROM hoadon ORDER BY MAHD DESC LIMIT 1";
        String result = "";

        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(sql);
             ResultSet rs = pre.executeQuery()) {

            if (rs.next()) {
                result = rs.getString("MAHD"); // Lấy giá trị từ cột MAHD
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi lấy mã hóa đơn cuối cùng.", e);
        }

        if (result.isEmpty()) {
            System.out.println("Không có đơn hàng.");
        }

        return result;
    }


    public static void addOrder(Order order) {
        String sql = "INSERT INTO HOADON (MaHD, MaKH, NgayMua, GhiChu, TongTien, TrangThai) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(sql)) {

            // Tạo mã hóa đơn mới
            String lastMaHD = getLastMaHD();
            String stt = lastMaHD.substring(2); // Lấy phần số từ mã hóa đơn cuối
            String newMaHD = "HD" + (Integer.parseInt(stt) + 1);
            order.setId(newMaHD);

            // Lấy mã khách hàng từ dịch vụ
            String makh = CustomerService.getIdAccByMakh(order.getUser().getId());

            // Gán giá trị cho các tham số
            pre.setString(1, newMaHD);                 // MaHD
            pre.setString(2, makh);                    // MaKH
            pre.setDate(3, java.sql.Date.valueOf(order.getBuyDate())); // NgayMua
            pre.setString(4, order.getNote());         // GhiChu
            pre.setDouble(5, order.totalMoney());      // TongTien
            pre.setInt(6, order.getTrangthai());       // TrangThai

            // Thực thi truy vấn
            pre.executeUpdate();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }

    public static void addCTHD(Order order) {
        String sql = "INSERT INTO CTHD (MaHD, MaSP, SoLgMua) VALUES (?, ?, ?)";

        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(sql)) {

            for (Map.Entry<String, ShoppingCartItem> entry : order.getData().entrySet()) {
                // Gán giá trị cho các tham số
                pre.setString(1, order.getId());                            // MaHD
                pre.setString(2, entry.getValue().getSp().getId());         // MaSP
                pre.setInt(3, entry.getValue().getSoLgMua());               // SoLgMua

                // Thực thi truy vấn
                pre.addBatch(); // Thêm vào batch để tối ưu hiệu suất
            }

            // Thực thi batch
            pre.executeBatch();

        } catch (SQLException se) {
            se.printStackTrace();
            throw new RuntimeException("Lỗi khi thêm chi tiết hóa đơn.", se);
        }
    }


}
