package vn.hcmuaf.edu.fit.service;

import vn.hcmuaf.edu.fit.dto.DBConnection;
import vn.hcmuaf.edu.fit.model.Blog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BLogService {
    public static List<Blog> getData() {
        List<Blog> blogs = new ArrayList<>();
        String sql = "SELECT  mablog, tieude,mota,anhblog,ngaydang, danhmuc, chude from blog ";
        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(sql);
             ResultSet rs = pre.executeQuery()) {
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        new ArrayList<>(),
                        new ArrayList<>()
                );
                blogs.add(blog);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return blogs;
    }

    public static void main(String[] args) {
        // Khởi tạo đối tượng BlogService (giả sử bạn có lớp này)
        BLogService blogService = new BLogService();

        // Lấy danh sách các blog
        List<Blog> blogs = blogService.getData();

        // In thông tin các blog ra console
        if (blogs != null && !blogs.isEmpty()) {
            for (Blog blog : blogs) {
                System.out.println("Mã Blog: " + blog.getId());
                System.out.println("Tiêu đề: " + blog.getTitle());
                System.out.println("Mô tả: " + blog.getContent());
                System.out.println("Ảnh Blog: " + blog.getImg());
                System.out.println("Ngày đăng: " + blog.getDate());
//                System.out.println("Danh mục: " + blog.getDanhmuc());
//                System.out.println("Chủ đề: " + blog.getChude());
                System.out.println("---------------------------------------------");
            }
        } else {
            System.out.println("Không có blog nào.");
        }
    }
}
