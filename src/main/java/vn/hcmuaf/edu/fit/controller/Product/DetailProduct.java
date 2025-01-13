package vn.hcmuaf.edu.fit.controller.Product;

import vn.hcmuaf.edu.fit.model.Product;
import vn.hcmuaf.edu.fit.model.ProductDetails;
import vn.hcmuaf.edu.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DetailProduct", value = "/DetailProduct")
public class DetailProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paramID = request.getParameter("productID");

        try {
            if (paramID != null) {
                ProductDetails productDetails = ProductService.getProductDetailsById(paramID);
                if (productDetails != null) {
                    // Gửi dữ liệu chi tiết sản phẩm đến trang book-details.jsp
                    request.setAttribute("detailProduct", productDetails);
                    request.getRequestDispatcher("/book-details.jsp").forward(request, response);
                    return; // Dừng xử lý tại đây
                }
            }
            // Nếu không có paramID hoặc productDetails không tồn tại, chuyển hướng đến trang lỗi
            request.getRequestDispatcher("/error/page-error-404.html").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error With: " + e);
            // Nếu xảy ra lỗi, gửi mã lỗi HTTP 500
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Có lỗi xảy ra khi xử lý yêu cầu.");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
