package vn.hcmuaf.edu.fit.controller.Product;

import vn.hcmuaf.edu.fit.model.Product;
import vn.hcmuaf.edu.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

@WebServlet(name = "ListProduct", value = "/ListProduct")
public class ListProduct extends HttpServlet {
    private static long serialVersionUID = 1l;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Product> list = ProductService.listAppearUser();
        request.setAttribute("listProduct", list);
        System.out.println("Size Product: " + list.size());
        request.getRequestDispatcher("/shop-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
