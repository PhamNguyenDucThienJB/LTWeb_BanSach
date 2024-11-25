package vn.hcmuaf.edu.fit.dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Thay đổi driverClass, URL, username và password để phù hợp với MySQL
    private static String driverClass = "com.mysql.cj.jdbc.Driver"; // Driver cho MySQL
    private static String url = "jdbc:mysql://localhost:3306/bansach"; // Thay 'your_database_name' bằng tên DB
    private static String username = "root"; // Thay bằng tài khoản MySQL của bạn
    private static String password = ""; // Thay bằng mật khẩu MySQL của bạn

    // Nạp driver MySQL
    static {
        try {
            Class.forName(driverClass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Kết nối đến cơ sở dữ liệu
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }

    public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null) {
                System.out.println("Kết nối thành công!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
