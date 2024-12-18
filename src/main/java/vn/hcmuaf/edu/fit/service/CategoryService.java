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
        String sql = "SELECT MALB, TenLS FROM loaisach";
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

    public static boolean addCategory(String id, String nameCategory) {
        String sql = "INSERT INTO loaisach (loaisach.MALB,loaisach.TenLS) VALUES (?,?)";
        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, id);
            preparedStatement.setString(2, nameCategory);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Add Success With: " + "ID " + id + " Name " + nameCategory);
                return true;
            } else {
                System.out.println("Fail With: " + "ID " + id + " Name " + nameCategory);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error With " + e);
        }

        return false;
    }

    public static boolean deleteCategory(String id) {
        String sql = "DELETE FROM loaisach WHERE loaisach.MALB=?";
        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(sql)) {

            pre.setString(1, id);
            int rowsEffected = pre.executeUpdate();
            if (rowsEffected > 0) {
                System.out.println("Delete Success With: " + id);
                return true;

            } else {
                System.out.println("Fail Delete With: " + id);
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static Category findByIDCategory(String id) {
        String sql = "SELECT loaisach.MALB, loaisach.TenLS FROM loaisach WHERE loaisach.MALB=?";
        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(sql)) {

            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return new Category(
                        rs.getString(1),
                        rs.getString(2)


                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public static boolean updateCategory(String newName, String id) {
        String sql = "UPDATE loaisach SET TenLS=? WHERE MALB=?";
        try (Connection connection = DBConnection.getInstall().getConnectionInstance();
             PreparedStatement pre = connection.prepareStatement(sql)) {

            pre.setString(1, newName);
            pre.setString(2, id);
            int rowsEffected = pre.executeUpdate();
            if (rowsEffected > 0) {
                System.out.println("Update Success With: " + id);
                return true;

            } else {
                System.out.println("Fail Update With: " + id);
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

}
