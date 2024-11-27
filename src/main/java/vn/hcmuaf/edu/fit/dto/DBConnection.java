package vn.hcmuaf.edu.fit.dto;

import java.sql.*;

public class DBConnection {
    // Thay đổi driverClass, URL, username và password để phù hợp với MySQL
    private static String driverClass = "com.mysql.cj.jdbc.Driver"; // Driver cho MySQL
    private static String url = "jdbc:mysql://localhost:3306/bansach"; // Thay 'your_database_name' bằng tên DB
    private static String username = "root"; // Thay bằng tài khoản MySQL của bạn
    private static String password = ""; // Thay bằng mật khẩu MySQL của bạn
    static DBConnection install;
    Connection conn;
    // Nạp driver MySQL
    static {
        try {
            Class.forName(driverClass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public static DBConnection getInstall(){
        if(install==null)
            install= new DBConnection();
        return install;
    }
    public Statement get() {
        if (conn == null) return null;

        try {
            return conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (SQLException e) {
            return null;
        }

    }

    // Kết nối đến cơ sở dữ liệu
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }
    public Connection getConnectionInstance() {
        if (conn == null) {
            try {
                conn = DriverManager.getConnection(url, username, password);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return conn;
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
