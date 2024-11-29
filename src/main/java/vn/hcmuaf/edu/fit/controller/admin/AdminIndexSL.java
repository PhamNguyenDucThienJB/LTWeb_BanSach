package vn.hcmuaf.edu.fit.controller.admin;

import vn.hcmuaf.edu.fit.bean.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminIndexSL", value = "/AdminIndexSL")
public class AdminIndexSL extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        // Kiểm tra nếu user không tồn tại hoặc không có quyền, redirect ngay lập tức
// Thừa không cần thiết
//        if (user == null || !user.checkRole(1)) {
//            response.sendRedirect("./error/page-error-500.html");
//            return;  // Dừng lại ở đây để tránh gọi forward sau khi đã redirect
//        }

        // Nếu điều kiện trên không đúng, tiếp tục forward tới trang admin
        request.getRequestDispatcher("/admin/admin-web.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

