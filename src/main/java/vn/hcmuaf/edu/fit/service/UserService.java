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
            message.setSubject("Xác minh tài khoản");
            message.setText("Mã xác nhận của bạn là: " + code);

            // send message
            Transport.send(message);

        } catch (AddressException e) {
            e.printStackTrace();

        } catch (javax.mail.MessagingException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        try {
            // Email người nhận
            String toEmail = "20130410@st.hcmuaf.edu.vn"; // Thay bằng email thực của bạn để kiểm tra

            // Sinh mã xác nhận ngẫu nhiên
            int code = UserService.randomCode();

            // Gửi email
            System.out.println("Đang gửi email...");
            UserService.sendMail(toEmail, code);

            System.out.println("Email đã được gửi thành công với mã xác nhận: " + code);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Đã xảy ra lỗi khi gửi email: " + e.getMessage());
        }
    }
}

