package vn.hcmuaf.edu.fit.controller;

import vn.hcmuaf.edu.fit.model.Blog;
import vn.hcmuaf.edu.fit.service.BLogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DetailBlogServlet", value = "/DetailBlogServlet")
public class DetailBlogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pramIdBlog = request.getParameter("blogId");
        try {
            if (pramIdBlog != null) {
                Blog blog = BLogService.findById(pramIdBlog);
                if (blog != null) {
                    request.setAttribute("blog", blog);
                    request.getRequestDispatcher("blog-details.jsp").forward(request, response);
                    return;
                }
            }
            request.getRequestDispatcher("/error/page-error-404.html").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error With: " + e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }
}
