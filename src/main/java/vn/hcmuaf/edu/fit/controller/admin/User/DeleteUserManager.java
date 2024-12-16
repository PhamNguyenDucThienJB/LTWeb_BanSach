package vn.hcmuaf.edu.fit.controller.admin.User;

import vn.hcmuaf.edu.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteUserManager", value = "/DeleteUserManager")
public class DeleteUserManager extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pramID = request.getParameter("idUser");
        response.setContentType("application/json"); // Đặt kiểu phản hồi là JSON
        try {
            if (pramID != null) {
                boolean idDeleted = UserService.deleteUser(pramID);

                if (idDeleted) {
                    response.getWriter().write("{\"success\": true, \"message\": \"User deleted successfully!\"}");
                    // Chuyển hướng về trang ListUserManager sau khi xóa thành công
                    response.sendRedirect("/admin/ListUserManager");
                } else {
                    response.getWriter().write("{\"success\": false, \"message\": \"Failed to delete user.\"}");
                }
            } else {
                response.getWriter().write("{\"success\": false, \"message\": \"Invalid user ID.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"success\": false, \"message\": \"An error occurred.\"}");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
