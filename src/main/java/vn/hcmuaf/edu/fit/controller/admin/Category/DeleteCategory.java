package vn.hcmuaf.edu.fit.controller.admin.Category;

import vn.hcmuaf.edu.fit.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteCategory", value = "/admin/DeleteCategory")
public class DeleteCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("idCategory");
        if (idParam != null) {
            boolean effected = CategoryService.deleteCategory(idParam);
            HttpSession session = request.getSession();
            if (effected) {
                session.setAttribute("message", "Xóa loại sách thành công!");
                session.setAttribute("messageType", "success"); // Để phân biệt loại thông báo
            } else {
                session.setAttribute("message", "Xóa loại sách thất bại. Vui lòng thử lại!");
                session.setAttribute("messageType", "error");
            }
        }
        // Chuyển hướng về trang danh sách
        response.sendRedirect(request.getContextPath() + "/admin/CategoryList");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
