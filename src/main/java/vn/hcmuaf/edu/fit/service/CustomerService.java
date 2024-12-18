package vn.hcmuaf.edu.fit.service;

import vn.hcmuaf.edu.fit.bean.User;
import vn.hcmuaf.edu.fit.dto.DBConnection;
import vn.hcmuaf.edu.fit.model.Customer;

import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CustomerService {
    public static List<Customer> getListCustomer() {
        List<Customer> listC = new ArrayList<Customer>();
        Statement statement = DBConnection.getInstall().get();
        if (statement != null) {
            try {
                ResultSet rs = statement.executeQuery("SELECT MAKH, TENKH, MATAIKHOAN, DIACHI, SDT, taikhoan.role from khachhang, taikhoan where taikhoan.id = khachhang.mataikhoan");
                while (rs.next()) {
                    listC.add(new Customer(rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6)
                    ));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Không có khách hàng");
        }
        return listC;

    }

    public static List<Customer> getListCostumerAdmin() {
        List<Customer> list = new ArrayList<>();
        String slq = "SELECT kh.MAKH, kh.TENKH, t.EMAIL,kh.MATAIKHOAN, kh.DIACHI, kh.SDT, t.ROLE FROM taikhoan t JOIN khachhang kh ON t.ID = kh.MATAIKHOAN;";
        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(slq);
             ResultSet rs = pre.executeQuery()) {

            while (rs.next()) {
                Customer new_costumer = new Customer(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)


                );
                list.add(new_costumer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Size Of List Use: " + list.size());
        return list;
    }

    public static String getIdAccByMakh(String makh) {
        for (Customer c : getListCustomer()) {
            if (c.getMAKH().equals(makh)) {
                return c.getMATAIKHOAN();
            }
        }
        return null;
    }

    public static Customer getCusByIdAcc(String idAcc) {
        for (Customer c : getListCustomer()) {
            if (c.getMATAIKHOAN().equals(idAcc)) {
                return c;
            }
        }
        return null;
    }

    public static String getLastMaKH() {
        Statement statement = DBConnection.getInstall().get();
        String result = "";
        if (statement != null)
            try {
                ResultSet rs = statement.executeQuery("SELECT khachhang.MAKH from khachhang ORDER BY MAKH DESC LIMIT 1");
                while (rs.next()) {
                    result = rs.getString(1);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        else {
            System.out.println("Không có đơn hàng");
        }
        return result;
    }

    public static void registerKH(Customer acc, User user) {
        Connection connection = DBConnection.getInstall().getConnectionInstance();

        if (user == null || user.getId() == null) {
            System.out.println("Generated User ID: " + user.getId());
            System.out.println("User hoặc ID tài khoản không hợp lệ");
            return;
        }


        if (connection == null) {
            System.out.println("Không thể kết nối cơ sở dữ liệu");
            return;
        }

        // Lấy mã khách hàng cuối cùng
        String lastMaKH = getLastMaKH();
        String newMaKH = (lastMaKH != null && lastMaKH.startsWith("KH"))
                ? "KH" + (Integer.parseInt(lastMaKH.substring(2)) + 1)
                : "KH1";

        acc.setMAKH(newMaKH);
        acc.setDIACHI("TPHCM"); // Giá trị mẫu
        acc.setSDT("035640789");
        acc.setMATAIKHOAN(user.getId()); // Lấy ID từ UserService

        String sql = "INSERT INTO khachhang (MAKH, TENKH, MATAIKHOAN, DIACHI, SDT) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, acc.getMAKH());
            pstmt.setString(2, user.getTentk());
            pstmt.setString(3, acc.getMATAIKHOAN());
            pstmt.setString(4, acc.getDIACHI());
            pstmt.setString(5, acc.getSDT());
            pstmt.executeUpdate();
            System.out.println(new String("Đăng ký khách hàng thành công với mã: ".getBytes(), StandardCharsets.UTF_8) + acc.getMAKH());
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi khi đăng ký khách hàng");
        }
    }

    //Delete Customer
// Delete User
    public static boolean deleteCustumer(String iDUser) {
        String sqlCheck = "SELECT COUNT(*) FROM khachhang WHERE MAKH = ?";
        String sqlDelete = "DELETE FROM khachhang WHERE MAKH = ?";
        boolean isDeleted = false;

        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement checkStmt = connection.prepareStatement(sqlCheck);
             PreparedStatement deleteStmt = connection.prepareStatement(sqlDelete)) {

            // Kiểm tra xem tài khoản có tồn tại không
            checkStmt.setString(1, iDUser);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) {
                System.out.println("Không tìm thấy tài khoản với ID: " + iDUser);
                return false;
            }

            // Nếu tài khoản tồn tại, thực hiện xóa
            deleteStmt.setString(1, iDUser);
            int rowsAffected = deleteStmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Xóa tài khoản thành công: " + iDUser);
                isDeleted = true;
            } else {
                System.out.println("Có lỗi xảy ra khi xóa tài khoản: " + iDUser);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Có lỗi xảy ra khi xóa tài khoản: " + iDUser);
        }

        return isDeleted;
    }

    public static Customer findByMATAIKHOAN(String id) {

        String query = "SELECT kh.MAKH, kh.TENKH, t.EMAIL,kh.MATAIKHOAN, kh.DIACHI, kh.SDT, t.ROLE FROM taikhoan t JOIN khachhang kh ON t.ID = kh.MATAIKHOAN where MAKH = ?";
        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Customer(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)
                );

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean updateUser(Customer customer, String id) {
        String query = "UPDATE khachhang kh JOIN taikhoan tk ON kh.MATAIKHOAN = tk.ID SET kh.TENKH = ?, kh.DIACHI = ?, kh.SDT = ?, tk.ROLE = ? WHERE kh.MAKH = ? ";
        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement ps = connection.prepareStatement(query)) {

            // Gán giá trị cho các tham số trong câu lệnh SQL
            ps.setString(1, customer.getTENKH());
            ps.setString(2, customer.getDIACHI());
            ps.setString(3, customer.getSDT());
            ps.setInt(4, customer.getRoleNo());
            ps.setString(5, id);

            // Thực thi câu lệnh và kiểm tra kết quả
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu có ít nhất 1 dòng được cập nhật
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Trả về false nếu có lỗi xảy ra
    }

}


