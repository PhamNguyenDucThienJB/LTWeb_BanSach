package vn.hcmuaf.edu.fit.service;

import vn.hcmuaf.edu.fit.bean.User;
import vn.hcmuaf.edu.fit.dto.DBConnection;
import vn.hcmuaf.edu.fit.dto.JDBIConnector;
import vn.hcmuaf.edu.fit.model.Customer;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class UserService {
    private static final Long serialVersionUID = 1l;
    private static UserService instance;

    private UserService() {
    }

    public static UserService getInstance() {
        if (instance == null) {
            instance = new UserService();
        }
        return instance;
    }

    public User checkLogin(String email, String password) {
        List<User> users = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT taikhoan.ID, taikhoan.email, taikhoan.PASS, taikhoan.tentk, taikhoan.ROLE FROM taikhoan WHERE email = ?")
                        .bind(0, email)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (users.size() != 1) return null;
        User user = users.get(0);
        if (!user.getPass().equals(hashPassword(password))
                || !user.getEmail().equals(email)
        ) return null;
        return user;
    }

    public static String hashPassword(String password) {
        try {
            MessageDigest sha256 = null;
            sha256 = MessageDigest.getInstance("SHA-256");
            byte[] hash = sha256.digest(password.getBytes());
            BigInteger number = new BigInteger(1, hash);
            return number.toString(16);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    public static List<User> getListUser() {
        List<User> list = new ArrayList<>();
        Statement statement = DBConnection.getInstall().get();
        if (statement != null) {

            try {
                ResultSet resultSet = statement.executeQuery("select ID, EMAIL, PASS, TENTK, ROLE from taikhoan;");
                while (resultSet.next()) {
                    list.add(new User(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getInt(5)));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            System.out.println("Không có tai khoan");
        }
        return list;
    }

    public static boolean checkEmail(String email) {
        String query = "SELECT COUNT(*) FROM taikhoan WHERE EMAIL = ?";
        try (Connection connection = DBConnection.getInstall().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1) == 0; // True nếu không tìm thấy email
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void register(User acc) {
        String generatedId = generateId(); // Tạo ID mới
        acc.setId(generatedId); // Gán ID này vào đối tượng User
        String query = "INSERT INTO taikhoan (ID, EMAIL, PASS, TENTK, ROLE) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getInstall().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, generatedId);
            preparedStatement.setString(2, acc.getEmail());
            preparedStatement.setString(3, hashPassword(acc.getPass()));
            preparedStatement.setString(4, acc.getTentk());
            preparedStatement.setInt(5, acc.getRole());

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Tài khoản đã được đăng ký thành công với ID: " + generatedId);
            } else {
                System.out.println("Không thể chèn dữ liệu vào bảng 'taikhoan'");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    private static String generateId() {
        // Lấy ID mới nhất từ cơ sở dữ liệu và sinh ID mới
        String query = "SELECT MAX(ID) FROM taikhoan";
        try (Connection connection = DBConnection.getInstall().getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            if (resultSet.next()) {
                String lastId = resultSet.getString(1);
                int newId = Integer.parseInt(lastId.substring(2)) + 1;
                return "AD" + String.format("%02d", newId); // Tạo ID như AD01, AD02, ...
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "AD01"; // Mặc định trả về AD01 nếu không có dữ liệu trước đó
    }


    public static String getLastMaTK() {
        Statement statement = DBConnection.getInstall().get();
        String result = "";
        if (statement != null)
            try {
                ResultSet rs = statement.executeQuery("SELECT taikhoan.ID from taikhoan ORDER BY ID DESC LIMIT 1");
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

}
