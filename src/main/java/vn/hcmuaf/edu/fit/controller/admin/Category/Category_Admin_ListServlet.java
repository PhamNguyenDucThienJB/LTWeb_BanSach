package vn.hcmuaf.edu.fit.controller.admin.Category;

import vn.hcmuaf.edu.fit.model.Category;
import vn.hcmuaf.edu.fit.service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "Category_Admin_ListServlet", value = "/admin/CategoryList")
public class Category_Admin_ListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Category> list = CategoryService.getData();
        request.setAttribute("listCategory", list);
        request.getRequestDispatcher("/admin/listcategoryManager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
