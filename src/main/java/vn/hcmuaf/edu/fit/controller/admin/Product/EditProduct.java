package vn.hcmuaf.edu.fit.controller.admin.Product;

import vn.hcmuaf.edu.fit.model.Product;
import vn.hcmuaf.edu.fit.model.ProductDetails;
import vn.hcmuaf.edu.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "EditProduct", value = "/admin/EditProduct")
public class EditProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paramID = request.getParameter("productID");

        try {
            if (paramID != null) {
                Product listProduct = ProductService.getProductAllById(paramID);
                if (listProduct != null) {
                    // Gửi dữ liệu chi tiết sản phẩm đến trang book-details.jsp
                    request.setAttribute("listProduct", listProduct);
                    request.getRequestDispatcher("/admin/editProduct.jsp").forward(request, response);
                }
            }
            // Nếu không có paramID hoặc productDetails không tồn tại, chuyển hướng đến trang lỗi
//            response.sendRedirect(request.getContextPath() + "/error/page-error-404.html");

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
