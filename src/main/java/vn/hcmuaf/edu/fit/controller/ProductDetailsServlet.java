package vn.hcmuaf.edu.fit.controller;

import vn.hcmuaf.edu.fit.service.ProductDAO;
import vn.hcmuaf.edu.fit.model.ProductDetails;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/product-details")
public class ProductDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("MaSP");
        if (productId != null && !productId.isEmpty()) {
            ProductDAO productDAO = new ProductDAO();
            ProductDetails product = productDAO.getProductById(productId);

            if (product != null) {
                request.setAttribute("product", product);
            } else {
                request.setAttribute("error", "Không tìm thấy sản phẩm với mã: " + productId);
            }
        } else {
            request.setAttribute("error", "Mã sản phẩm không hợp lệ.");
        }
        request.getRequestDispatcher("bookDetails.jsp").forward(request, response);
    }

}
