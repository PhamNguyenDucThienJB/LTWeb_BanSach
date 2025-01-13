package vn.hcmuaf.edu.fit.service;

import vn.hcmuaf.edu.fit.dto.DBConnection;
import vn.hcmuaf.edu.fit.model.DetailRecipe;
import vn.hcmuaf.edu.fit.model.Order;
import vn.hcmuaf.edu.fit.model.ShoppingCartItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

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

        // Trả về giá trị mặc định nếu bảng trống
        if (result == null || result.isEmpty()) {
            return "HD01";  // Giá trị mặc định cho hóa đơn đầu tiên
        }

        return result;
    }

    public static void addOrder(Order order) {
        // Sinh mã hóa đơn mới
        String mahd = generateOrderId();
        order.setId(mahd);

        // Lấy mã khách hàng từ cơ sở dữ liệu dựa trên người dùng
        String makh = CustomerService.getIdAccByIdUser(order.getUser().getId());
        System.out.println("Have " + makh);

        // Kiểm tra kết nối cơ sở dữ liệu
        Connection connection = null;
        try {
            connection = DBConnection.getInstall().getConnection();
            if (connection == null || connection.isClosed()) {
                System.out.println("Kết nối cơ sở dữ liệu không thành công.");
                return;
            } else {
                System.out.println("Kết nối cơ sở dữ liệu thành công.");
            }

            // Tạo câu truy vấn
            String sql = "INSERT INTO HOADON (MaHD, MaKH, NGAYLAPHD, GhiChu, THANHTIEN, TRANGTHAI) VALUES (?, ?, ?, ?, ?, ?)";

            // Gán các giá trị cho câu truy vấn
            System.out.println("MaHD: " + mahd);
            System.out.println("MaKH: " + makh);
            System.out.println("NgayMua: " + order.getBuyDate());
            System.out.println("GhiChu: " + order.getNote());
            System.out.println("TongTien: " + order.getPriceTotal());
            System.out.println("TrangThai: " + order.getTrangthai());

            try (PreparedStatement pre = connection.prepareStatement(sql)) {
                pre.setString(1, mahd);                      // MaHD
                pre.setString(2, makh);                      // MaKH
                pre.setDate(3, java.sql.Date.valueOf(order.getBuyDate())); // NgayMua
                pre.setString(4, order.getNote());           // GhiChu
                pre.setDouble(5, order.getPriceTotal());        // TongTien
                pre.setInt(6, order.getTrangthai());         // TrangThai

                // Thực thi truy vấn
                int rowsAffected = pre.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("Đơn hàng đã được thêm thành công.");
                } else {
                    System.out.println("Không thể thêm đơn hàng.");
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi thực hiện truy vấn thêm đơn hàng: " + e.getMessage());
            e.printStackTrace();
            // Nếu có thể, ghi lại lỗi trong một file log
            Logger.getLogger(OrderService.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            // Đảm bảo đóng kết nối nếu cần
            try {
                if (connection != null && !connection.isClosed()) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    // Phương thức sinh mã hóa đơn mới
    private static String generateOrderId() {
        String query = "SELECT MAX(MaHD) FROM HOADON";
        try (Connection connection = DBConnection.getInstall().getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            if (resultSet.next()) {
                String lastId = resultSet.getString(1); // Lấy mã hóa đơn cuối cùng
                if (lastId != null) {
                    int newId = Integer.parseInt(lastId.substring(2)) + 1;
                    return "HD" + String.format("%02d", newId); // Sinh mã hóa đơn dạng HD01, HD02, ...
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "HD01"; // Trả về HD01 nếu không có dữ liệu
    }

    public static void addCTHD(Order order, List<ShoppingCartItem> cartItems) {
        String sql = "INSERT INTO CTHD (MAHD, MASP, SL) VALUES (?, ?, ?)";

        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(sql)) {

            for (ShoppingCartItem item : cartItems) {
                String masp = item.getMasp();
                int soLgMua = item.getSoLgMua();

                // Gán giá trị vào câu truy vấn
                pre.setString(1, order.getId()); // MaHD từ Order
                pre.setString(2, masp);          // MaSP
                pre.setInt(3, soLgMua);          // SoLgMua

                // Thêm vào batch
                pre.addBatch();
            }

            // Thực thi batch
            pre.executeBatch();
            System.out.println("Chi tiết hóa đơn đã được thêm thành công.");
        } catch (SQLException se) {
            se.printStackTrace();
            throw new RuntimeException("Lỗi khi thêm chi tiết hóa đơn.", se);
        }
    }


    public static void addAddressShip(Order order) {
        String sql = "INSERT INTO giaohang (MaHD, NGAYGIAO, DIACHIGIAO,SDT) VALUES (?, ?, ?,?)";
        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setString(1, order.getId());
            pre.setString(2, order.getGiaohang().getNgayGiao());
            pre.setString(3, order.getGiaohang().getDiachigiao());
            pre.setString(4, order.getGiaohang().getSdt());
            pre.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void clearCart(Order order) {
        order.getData().clear();
        order.setBuyDate(null);
    }

    // Phương thức lấy danh sách đơn hàng và chi tiết sản phẩm trong đơn hàng dựa trên MAHD
    public static List<DetailRecipe> getOrderDetailsByIdUser(String idUser) {
        String sql = "SELECT \n" +
                "    hd.MAHD,\n" +
                "    hd.THANHTIEN,\n" +
                "    cthd.SL,\n" +
                "    hd.TRANGTHAI,\n" +
                "    kh.DIACHI,\n" +
                "    GROUP_CONCAT(DISTINCT asp.Anh SEPARATOR ', ') AS Anh,\n" +
                "    sp.MaSP,\n" +
                "    sp.TENSP,\n" +
                "    sp.GIA\n" +
                "FROM \n" +
                "    taikhoan tk\n" +
                "JOIN \n" +
                "    khachhang kh ON tk.ID = kh.MATAIKHOAN\n" +
                "JOIN \n" +
                "    hoadon hd ON kh.MAKH = hd.MAKH\n" +
                "JOIN \n" +
                "    cthd ON hd.MAHD = cthd.MAHD\n" +
                "JOIN \n" +
                "    anhsp asp ON cthd.MaSP = asp.MaSP\n" +
                "JOIN \n" +
                "    sanpham sp ON cthd.MaSP = sp.MaSP\n" +
                "WHERE \n" +
                "    tk.ID = ?\n" +
                "GROUP BY \n" +
                "    hd.MAHD, hd.THANHTIEN, hd.TRANGTHAI, kh.DIACHI, sp.MaSP, sp.TENSP, sp.GIA, cthd.SL\n" +
                "ORDER BY \n" +
                "    hd.MAHD DESC;\n";


        List<DetailRecipe> orderDetails = new ArrayList<>();

        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Thay thế tham số idUser vào câu truy vấn
            preparedStatement.setString(1, idUser);

            // Thực thi truy vấn và lấy kết quả
            ResultSet resultSet = preparedStatement.executeQuery();

            // Kiểm tra nếu có dữ liệu trả về
            if (resultSet != null) {
                // Lặp qua các kết quả trả về
                while (resultSet.next()) {
                    String maHD = resultSet.getString("MAHD");
                    String masp = resultSet.getString("MaSP");
                    String tensp = resultSet.getString("TENSP");
                    int solg = resultSet.getInt("SL");
                    int price = resultSet.getInt("GIA");
                    String anhsp = resultSet.getString("Anh");
                    int status = resultSet.getInt("TRANGTHAI");

                    float total = resultSet.getFloat("THANHTIEN");
                    String address = resultSet.getString("DIACHI");
                    // Tạo danh sách ảnh sản phẩm
                    List<String> images = new ArrayList<>();

                    if (anhsp != null && !anhsp.isEmpty()) {
                        // Tách chuỗi ảnh và lấy ảnh thứ 2 nếu có
                        String[] imageArray = anhsp.split(",");
                        if (imageArray.length >= 2) {
                            images.add(imageArray[2]);  // Lấy ảnh thứ 2 (chỉ mục 1)
                        } else {
                            images.add(imageArray[0]);  // Nếu không có ảnh thứ 2, lấy ảnh đầu tiên
                        }
                    }

                    // Tạo đối tượng DetailRecipe cho sản phẩm trong đơn hàng
                    DetailRecipe detail = new DetailRecipe(maHD, masp, tensp, solg, images, price, address, total, status);
                    orderDetails.add(detail);
                }
            } else {
                System.out.println("Không có dữ liệu nào được trả về.");
            }

        } catch (SQLException e) {
            // Xử lý ngoại lệ nếu có lỗi khi truy vấn
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi lấy chi tiết đơn hàng.", e);
        }

        return orderDetails;
    }

    public Map<String, List<DetailRecipe>> groupOrdersById(List<DetailRecipe> orders) {
        Map<String, List<DetailRecipe>> groupedOrders = new HashMap<>();

        for (DetailRecipe order : orders) {
            String mahd = order.getMahd();

            // Nếu mã đơn hàng đã tồn tại trong map, thêm sản phẩm vào danh sách
            if (!groupedOrders.containsKey(mahd)) {
                groupedOrders.put(mahd, new ArrayList<>());
            }
            groupedOrders.get(mahd).add(order);
        }

        return groupedOrders;
    }


}
