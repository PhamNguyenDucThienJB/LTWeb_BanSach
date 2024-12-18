package vn.hcmuaf.edu.fit.controller.admin.Category;

import vn.hcmuaf.edu.fit.model.Category;
import vn.hcmuaf.edu.fit.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddCategory", value = "/admin/AddCategory")
public class AddCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/addCategoryManager.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCategory = request.getParameter("val-id");
        String nameCategory = request.getParameter("nameC");

        boolean isAdded = CategoryService.addCategory(idCategory, nameCategory);

        // Lưu thông báo vào session
        HttpSession session = request.getSession();
        if (isAdded) {
            session.setAttribute("message", "Thêm loại sách thành công!");
            session.setAttribute("messageType", "success"); // Để phân biệt loại thông báo
        } else {
            session.setAttribute("message", "Thêm loại sách thất bại. Vui lòng thử lại!");
            session.setAttribute("messageType", "error");
        }

        // Chuyển hướng về trang danh sách
        response.sendRedirect(request.getContextPath() + "/admin/CategoryList");
    }
}
