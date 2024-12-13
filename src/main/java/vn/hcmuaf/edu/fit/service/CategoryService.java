package vn.hcmuaf.edu.fit.service;

import vn.hcmuaf.edu.fit.dto.DBConnection;
import vn.hcmuaf.edu.fit.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryService {
    private static long serialVersionUID = 1L;
    private static CategoryService instance;

    public static CategoryService getInstance() {
        if (instance == null) {
            instance = new CategoryService();
        }
        return instance;
    }

    public static List<Category> getData() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT MALB, TenLS FROM loaibanh";
        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(sql);
             ResultSet rs = pre.executeQuery()) {
            while (rs.next()) {
                Category item = new Category(
                        rs.getString(1),
                        rs.getString(2));
//            dung iter để chạy vòng lặp for
                list.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


        return list;
    }


}
