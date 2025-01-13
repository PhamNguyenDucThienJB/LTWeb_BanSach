package vn.hcmuaf.edu.fit.controller.admin.Blog;

import vn.hcmuaf.edu.fit.model.Blog;
import vn.hcmuaf.edu.fit.service.BLogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "BlogListAdmin", value = "/admin/BlogListAdmin")
public class BlogListAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Blog> listBlog = BLogService.getData();
        request.setAttribute("listAdmin", listBlog);
        request.getRequestDispatcher("./listBlogManager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
