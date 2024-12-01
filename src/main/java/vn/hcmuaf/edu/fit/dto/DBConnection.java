package vn.hcmuaf.edu.fit.dto;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class DBConnection {
    private static HikariDataSource dataSource;
    static DBConnection install;

    static {
        try {
            // Đọc file cấu hình từ classpath
            Properties properties = new Properties();
            try (InputStream input = DBConnection.class.getClassLoader().getResourceAsStream("db.properties")) {
                if (input == null) {
                    throw new RuntimeException("Không tìm thấy file db.properties trong classpath");
                }
                properties.load(input);
            }

            // Cấu hình HikariCP
            HikariConfig config = new HikariConfig();
            String dbHost = properties.getProperty("db.host");
            String dbPort = properties.getProperty("db.port");
            String dbName = properties.getProperty("db.name");
            String username = properties.getProperty("db.user");
            String password = properties.getProperty("db.pass");

            // Cấu hình URL kết nối
            String url = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;
            config.setJdbcUrl(url);
            config.setUsername(username);
            config.setPassword(password);

            // Cấu hình thêm nếu cần
            config.setMaximumPoolSize(10);  // Số lượng kết nối tối đa trong pool
            config.setConnectionTimeout(30000); // Thời gian chờ kết nối (ms)
            config.setIdleTimeout(600000); // Thời gian tối đa một kết nối không được sử dụng (ms)

            // Tạo HikariDataSource
            dataSource = new HikariDataSource(config);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Lấy đối tượng DBConnection singleton
    public static DBConnection getInstall() {
        if (install == null)
            install = new DBConnection();
        return install;
    }

    // Lấy Statement từ connection
    public Statement get() {
        try (Connection conn = getConnectionInstance()) {
            if (conn != null) {
                return conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Lấy kết nối từ HikariCP DataSource
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    // Lấy kết nối instance
    public Connection getConnectionInstance() {
        try {
            return getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Kiểm tra kết nối trong main method
    public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null) {
                DatabaseMetaData metaData = conn.getMetaData();
                System.out.println("Thông tin cơ sở dữ liệu:");
                System.out.println("Tên cơ sở dữ liệu: " + metaData.getDatabaseProductName());
                System.out.println("Phiên bản cơ sở dữ liệu: " + metaData.getDatabaseProductVersion());
                System.out.println("URL kết nối: " + metaData.getURL());
                System.out.println("Tên người dùng: " + metaData.getUserName());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
