package vn.hcmuaf.edu.fit.controller.admin.User;

import vn.hcmuaf.edu.fit.service.CustomerService;
import vn.hcmuaf.edu.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
;

import vn.hcmuaf.edu.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;
@WebServlet(name = "DeleteUserManager", value = "/DeleteUserManager")
public class DeleteUserManager extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy tham số ID của tài khoản
        String userId = request.getParameter("idUser");

        // Kiểm tra tham số hợp lệ
        if (userId == null || userId.trim().isEmpty()) {
            // Gán thông báo lỗi vào request và chuyển hướng
            response.sendRedirect(request.getContextPath() + "/admin/ListUserManager?status=error&message=" + URLEncoder.encode("Thiếu ID tài khoản.", "UTF-8"));
            return;
        }

        try {
            // Thực hiện xóa tài khoản
            boolean isDeleted = UserService.deleteUser(userId);

            if (isDeleted) {
                // Gán thông báo thành công và chuyển hướng
                request.setAttribute("message", "Xóa tài khoản thành công.");
                request.setAttribute("status", "success");
                response.sendRedirect(request.getContextPath() + "/admin/ListUserManager?status=success&message=" + URLEncoder.encode("Xóa tài khoản thành công.", "UTF-8"));

            } else {
                // Gán thông báo lỗi và chuyển hướng
                response.sendRedirect(request.getContextPath() + "/admin/ListUserManager?status=error&message=" + URLEncoder.encode("Không tìm thấy tài khoản hoặc xóa thất bại.", "UTF-8"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Gán thông báo lỗi hệ thống và chuyển hướng
            response.sendRedirect(request.getContextPath() + "/admin/ListUserManager?status=error&message=" + URLEncoder.encode("Đã xảy ra lỗi hệ thống.", "UTF-8"));
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
