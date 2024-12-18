package vn.hcmuaf.edu.fit.controller.admin.Product;

import vn.hcmuaf.edu.fit.model.Product;
import vn.hcmuaf.edu.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "ListProductServlet", value = "/admin/ListProductServlet")
public class ListProductServlet extends HttpServlet {
    private static long serialVersionUID = 1l;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Product> listProduct = ProductService.getDataProduct();
        System.out.println("Size: "+listProduct.size());
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("/admin/listProductManager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
