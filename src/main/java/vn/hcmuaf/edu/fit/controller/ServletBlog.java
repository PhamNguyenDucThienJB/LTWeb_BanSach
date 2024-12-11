package vn.hcmuaf.edu.fit.controller;

import vn.hcmuaf.edu.fit.model.Blog;
import vn.hcmuaf.edu.fit.service.BLogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

@WebServlet(name = "ServletBlog", value = "/ListBlog")
public class ServletBlog extends HttpServlet {
    private static final long serialVersionUID = 1L;
//    private BLogService data = new BLogService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Blog> blogs = BLogService.getData();
        request.setAttribute("listBlogs", blogs);
        System.out.println("Blog List Size: " + blogs.size());
        request.getRequestDispatcher("/blog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
