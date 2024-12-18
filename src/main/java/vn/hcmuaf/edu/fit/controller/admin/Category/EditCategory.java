package vn.hcmuaf.edu.fit.controller.admin.Category;

import vn.hcmuaf.edu.fit.model.Category;
import vn.hcmuaf.edu.fit.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditCategory", value = "/admin/EditCategory")
public class EditCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("idCategoryEdit");
        if (idParam != null) {
            Category category = CategoryService.findByIDCategory(idParam);
            request.setAttribute("category", category);
            request.getRequestDispatcher("/admin/editCategory.jsp").forward(request, response);
        } else {
            // Nếu không tìm thấy category, chuyển hướng về danh sách category
            response.sendRedirect(request.getContextPath() + "/admin/CategoryList");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String newName = request.getParameter("nameC");
        try {
            boolean effected = CategoryService.updateCategory(newName, id);
            HttpSession session = request.getSession();

            if (effected) {
                System.out.println("Update Success");
                request.setAttribute("message", "Cập nhật loại sách thành công!");
                request.setAttribute("messageType", "success");
            } else {
                System.out.println("Fail Success");
                request.setAttribute("message", "Cập nhật loại sách thất bại. Vui lòng thử lại!");
                request.setAttribute("messageType", "error");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/admin/CategoryList");
    }
}
