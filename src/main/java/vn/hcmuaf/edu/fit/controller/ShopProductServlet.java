package vn.hcmuaf.edu.fit.controller;

import vn.hcmuaf.edu.fit.model.ProductDetails;
import vn.hcmuaf.edu.fit.service.ShopProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/shop-product")
public class ShopProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ShopProductDAO productDAO = new ShopProductDAO();
        List<ProductDetails> productList = productDAO.getAllProducts();

        // Gắn danh sách sản phẩm vào request
        request.setAttribute("productList", productList);

        // Chuyển tiếp tới JSP để hiển thị
        RequestDispatcher dispatcher = request.getRequestDispatcher("shop-product.jsp");
        dispatcher.forward(request, response);
    }
}