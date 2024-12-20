package vn.hcmuaf.edu.fit.dto;

import org.apache.commons.dbcp2.BasicDataSource;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class DBConnection {
    private static String driverClass = "com.mysql.cj.jdbc.Driver";
    private static String url;
    private static String username;
    private static String password;
    static DBConnection install;
    Connection conn;
    private static BasicDataSource dataSource; // Connection Pool

    static {
        try {
            // Nạp driver MySQL
            Class.forName(driverClass);

            // Đọc file cấu hình từ classpath
            Properties properties = new Properties();
            try (InputStream input = DBConnection.class.getClassLoader().getResourceAsStream("db.properties")) {
                if (input == null) {
                    throw new RuntimeException("Không tìm thấy file db.properties trong classpath");
                }
                properties.load(input);
            }

            // Lấy thông tin từ file properties
            String dbName = properties.getProperty("db.name");
            String dbHost = properties.getProperty("db.host");
            String dbPort = properties.getProperty("db.port");
            username = properties.getProperty("db.user");
            password = properties.getProperty("db.pass");

            // Tạo URL kết nối
            url = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;

            // Cấu hình DBCP
            dataSource = new BasicDataSource();
            dataSource.setDriverClassName(driverClass);
            dataSource.setUrl(url);
            dataSource.setUsername(username);
            dataSource.setPassword(password);

            // Tùy chỉnh connection pool
            dataSource.setMaxWaitMillis(10000); // Thời gian chờ lấy kết nối (ms)
            dataSource.setMinEvictableIdleTimeMillis(15000); // Thời gian kết nối nhàn rỗi trước khi bị xóa (ms)
            dataSource.setTimeBetweenEvictionRunsMillis(15000); // Tần suất kiểm tra kết nối nhàn rỗi (ms)

            dataSource.setInitialSize(5); // Số kết nối tạo sẵn
            dataSource.setMaxTotal(20);   // Số kết nối tối đa
            dataSource.setMaxIdle(10);   // Số kết nối nhàn rỗi tối đa
            dataSource.setMinIdle(3);    // Số kết nối nhàn rỗi tối thiểu
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static DBConnection getInstall() {
        if (install == null)
            install = new DBConnection();
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

    public Connection getConnectionInstance() {
        try {
            // Check if the connection is closed or null
            if (conn == null || conn.isClosed()) {
                System.out.println("Connection is either closed or not open, creating a new connection.");
                conn = dataSource.getConnection(); // Get a new connection from the pool
            } else {
                System.out.println("Connection is still open.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error occurred while obtaining connection.");
        }
        return conn;
    }


    // Phương thức mới sử dụng connection pool đúng cách
    public static Connection getConnection() {
        try {
            if (dataSource == null) {
                throw new RuntimeException("Connection Pool chưa được khởi tạo.");
            }
            return dataSource.getConnection(); // Lấy kết nối từ pool
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Không thể lấy kết nối từ connection pool", e);
        }
    }

    public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null) {
                DatabaseMetaData metaData = conn.getMetaData();
                System.out.println("Thông tin cơ sở dữ liệu:");
                System.out.println("Tên cơ sở dữ liệu: " + metaData.getDatabaseProductName());
                System.out.println("Phiên bản cơ sở dữ liệu: " + metaData.getDatabaseProductVersion());
                System.out.println("URL kết nối: " + metaData.getURL());
                System.out.println("Tên người dùng: " + metaData.getUserName());
                Connection connection = dataSource.getConnection();
                System.out.println("Connection class: " + connection.getClass().getName());


            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Có lỗi khi kết nối đến cơ sở dữ liệu: " + e.getMessage());
        }
    }
}