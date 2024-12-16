package vn.hcmuaf.edu.fit.service;

import vn.hcmuaf.edu.fit.bean.User;
import vn.hcmuaf.edu.fit.dto.DBConnection;
import vn.hcmuaf.edu.fit.model.Customer;

import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.util.ArrayList;
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


}
