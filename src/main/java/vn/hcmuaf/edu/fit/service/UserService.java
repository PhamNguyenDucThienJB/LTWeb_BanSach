package vn.hcmuaf.edu.fit.service;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;
import vn.hcmuaf.edu.fit.bean.User;
import vn.hcmuaf.edu.fit.dto.DBConnection;
import vn.hcmuaf.edu.fit.dto.JDBIConnector;
import vn.hcmuaf.edu.fit.model.Customer;

import javax.mail.*;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;

import java.io.*;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.stream.Collectors;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

public class UserService {
    private static final Long serialVersionUID = 1l;
    private static UserService instance;

    private String name_mail = null;
    private String passwd_mail = null;

    private UserService() {
        loadProperties();
    }

    public static UserService getInstance() {
        if (instance == null) {
            instance = new UserService();
        }
        return instance;
    }

    // Cấu hình
    private void loadProperties() {
        try (InputStream input = UserService.class.getClassLoader().getResourceAsStream("api.properties")) {
            if (input == null) {
                System.out.println("Không thể tìm thấy file api.properties");
                return;
            }
            Properties properties = new Properties();
            properties.load(input);  // Đọc nội dung từ file vào properties

            // Lấy thông tin từ file properties
            name_mail = properties.getProperty("api.name_mail");
            passwd_mail = properties.getProperty("api.passwd_mail");

            if (name_mail == null || passwd_mail == null) {
                throw new IllegalArgumentException("Chưa cấu hình thông tin email trong api.properties");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    //    Method
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
//            Khởi tạo SHA-256
            MessageDigest sha256 = null;
            sha256 = MessageDigest.getInstance("SHA-256");
//            Chuyển đổi mật khẩu thành mảng byte
            byte[] hash = sha256.digest(password.getBytes());
//            Chuyển đổi mảng byte thành số nguyên lớn (BigInteger)
            BigInteger number = new BigInteger(1, hash);
//            Chuyển đổi số thành chuỗi hexa
            return number.toString(16);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    // Kết Hợp Với Salt để Bảo Mật Hơn
//    public User checkLogin(String email, String password) {
//        List<User> users = JDBIConnector.get().withHandle(h ->
//                h.createQuery("SELECT taikhoan.ID, taikhoan.email, taikhoan.PASS, taikhoan.tentk, taikhoan.ROLE FROM taikhoan WHERE email = ?")
//                        .bind(0, email)
//                        .mapToBean(User.class)
//                        .stream()
//                        .collect(Collectors.toList())
//        );
//
//        if (users.size() != 1) return null;
//        User user = users.get(0);
//
//        // Tách mật khẩu đã băm và salt từ cơ sở dữ liệu
//        String[] passwordParts = user.getPass().split(":");
//        String storedHashedPassword = passwordParts[0];
//        String storedSalt = passwordParts[1];
//
//        // Băm lại mật khẩu người dùng nhập vào với salt đã lưu
//        String hashedInputPassword = hashPasswordWithSalt(password, storedSalt);
//
//        // So sánh mật khẩu đã băm
//        if (!storedHashedPassword.equals(hashedInputPassword) || !user.getEmail().equals(email)) {
//            return null;
//        }
//
//        return user;
//    }
//
//
//    // Tạo salt ngẫu nhiên
//    private static String getSalt() {
//        SecureRandom secureRandom = new SecureRandom();
//        byte[] salt = new byte[16];
//        secureRandom.nextBytes(salt);
//        return new BigInteger(1, salt).toString(16);  // chuyển salt thành chuỗi hex
//    }
//
//    // Hàm băm mật khẩu với salt
//    public static String hashPassword(String password) {
//        try {
//            // Lấy salt ngẫu nhiên
//            String salt = getSalt();
//
//            // Kết hợp mật khẩu với salt
//            String passwordWithSalt = password + salt;
//
//            // Băm mật khẩu đã kết hợp với salt
//            MessageDigest sha256 = MessageDigest.getInstance("SHA-256");
//            byte[] hash = sha256.digest(passwordWithSalt.getBytes());
//
//            // Chuyển kết quả băm thành chuỗi hex
//            BigInteger number = new BigInteger(1, hash);
//            String hashedPassword = number.toString(16);
//
//            // Trả về giá trị băm cộng với salt (để lưu lại salt)
//            return hashedPassword + ":" + salt;
//
//        } catch (NoSuchAlgorithmException e) {
//            return null;
//        }
//    }
//
//    private String hashPasswordWithSalt(String password, String salt) {
//        try {
//            // Kết hợp mật khẩu và salt
//            String passwordWithSalt = password + salt;
//
//            // Băm mật khẩu đã kết hợp với salt
//            MessageDigest sha256 = MessageDigest.getInstance("SHA-256");
//            byte[] hash = sha256.digest(passwordWithSalt.getBytes());
//
//            // Chuyển kết quả băm thành chuỗi hex
//            BigInteger number = new BigInteger(1, hash);
//            return number.toString(16);
//
//        } catch (NoSuchAlgorithmException e) {
//            return null;
//        }
//    }
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
            System.out.println("Not Found");
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
                System.out.println("Register Success With ID: " + generatedId);
            } else {
                System.out.println("Can not insert into 'taikhoan'");
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

    //Phạm vi cần đạt được:
//Chúng ta muốn tạo ra một số ngẫu nhiên trong khoảng [100000, 999999], tức là có độ rộng 899999 - 100000 = 899999.
//
//Nhân trước:
//
//Math.random() cho giá trị trong khoảng [0.0, 1.0).
//Khi nhân với 899999, nó tạo ra một số trong khoảng [0, 899999).
//Điều này đảm bảo rằng giá trị nằm trong khoảng độ rộng cần thiết (899999).
//Cộng thêm 100000:
//
//Khi thêm 100000, toàn bộ phạm vi sẽ được dịch chuyển lên.
//Giá trị nhỏ nhất (0) trở thành 100000.
//Giá trị lớn nhất (899999) trở thành 999999.
    public static int randomCode() {
        return (int) Math.floor(((Math.random() * 899999) + 100000));
    }

    public static void sendMail(String toEmail, int code) throws MessagingException, UnsupportedEncodingException {
        String fromEmail = getInstance().name_mail;
        String pass = getInstance().passwd_mail;
        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        // get Session
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, pass);
            }
        });

        // compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Verify Gmail");

            String htmlContent =
                    "<div style=\"font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f9f9f9;\">" +
                            "<div style=\"max-width: 600px; margin: auto; background: #ffffff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);\">" +
                            "<h2 style=\"color: #333; text-align: center;\">Xác nhận tài khoản của bạn</h2>" +
                            "<p style=\"color: #555; line-height: 1.5;\">Xin chào,</p>" +
                            "<p style=\"color: #555; line-height: 1.5;\">Cảm ơn bạn đã sử dụng dịch vụ mua bán sách của chúng tôi. Đây là mã xác nhận của bạn:</p>" +
                            "<div style=\"text-align: center; margin: 20px 0;\">" +
                            "<span style=\"font-size: 24px; font-weight: bold; color: #007BFF;\">" + code + "</span>" +
                            "</div>" +
                            "<p style=\"color: #555; line-height: 1.5;\">Vui lòng nhập mã này trên trang xác nhận mật khẩu để hoàn tất quá trình đăng ký.</p>" +
                            "<p style=\"color: #555; line-height: 1.5;\">Nếu bạn không yêu cầu mã này, hãy bỏ qua email này.</p>" +
                            "<div style=\"margin-top: 20px; text-align: center;\">" +
                            "<a href=\"https://yourwebsite.com\" style=\"background: #007BFF; color: #ffffff; text-decoration: none; padding: 10px 20px; border-radius: 4px;\">Trang chủ</a>" +
                            "</div>" +
                            "</div>" +
                            "<p style=\"text-align: center; color: #aaa; font-size: 12px; margin-top: 20px;\">&copy; 2024 Your Company. All rights reserved.</p>" +
                            "</div>";
            // set content with HTML
            message.setContent(htmlContent, "text/html; charset=UTF-8");

            // send message
            Transport.send(message);

        } catch (AddressException e) {
            e.printStackTrace();

        } catch (javax.mail.MessagingException e) {
            e.printStackTrace();
        }

    }

    //    Update Information Account
//    Update Password
    public static void updatePasswWord(String email, String pass) {
        String query = "UPDATE taikhoan SET PASS=? WHERE EMAIL=? ";
        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(query)) {

            pre.setString(1, pass);

            pre.setString(2, email);

            int intcount = pre.executeUpdate();
            if (intcount > 0) {
                System.out.println("Update Password Success!");
            } else {
                System.out.println("Not Found email: " + email);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    // Delete User
    public static boolean deleteUser(String iDUser) {
        String sqlCheck = "SELECT COUNT(*) FROM taikhoan WHERE ID = ?";
        String sqlDelete = "DELETE FROM taikhoan WHERE ID = ?";
        boolean isDeleted = false;

        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement checkStmt = connection.prepareStatement(sqlCheck);
             PreparedStatement deleteStmt = connection.prepareStatement(sqlDelete)) {

            // Kiểm tra xem tài khoản có tồn tại không
            checkStmt.setString(1, iDUser);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) {
                System.out.println("Không tìm thấy tài khoản với ID: " + iDUser);
                return false;  // Nếu không có tài khoản, trả về false
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


    public static void main(String[] args) {
        try {
//            // Email người nhận
//            String toEmail = "20130410@st.hcmuaf.edu.vn"; // Thay bằng email thực của bạn để kiểm tra
//
//            // Sinh mã xác nhận ngẫu nhiên
//            int code = UserService.randomCode();
//
//            // Gửi email
//            System.out.println("Đang gửi email...");
//            UserService.sendMail(toEmail, code);
//
//            System.out.println("Email đã được gửi thành công với mã xác nhận: " + code);
            UserService userService = new UserService();
            userService.loadProperties();

            // Kiểm tra kết quả
            System.out.println("Email: " + userService.name_mail);
            System.out.println("Password: " + userService.passwd_mail);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Đã xảy ra lỗi khi gửi email: " + e.getMessage());
        }
    }

}

