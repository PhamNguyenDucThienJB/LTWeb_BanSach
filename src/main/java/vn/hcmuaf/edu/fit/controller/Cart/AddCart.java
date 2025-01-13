package vn.hcmuaf.edu.fit.controller.Cart;

import vn.hcmuaf.edu.fit.model.ProductDetails;
import vn.hcmuaf.edu.fit.service.ShoppingCartService;
import vn.hcmuaf.edu.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddCart", value = "/AddCart")
public class AddCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // Lấy giỏ hàng từ session
        HttpSession session = request.getSession();
        ShoppingCartService cart = (ShoppingCartService) session.getAttribute("cart");
        if (cart == null) {
            cart = new ShoppingCartService();
            session.setAttribute("cart", cart);
        }

        // Lấy thông tin sản phẩm
        String productId = request.getParameter("productId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        ProductDetails product = ProductService.getProductDetailsById(productId); // Tạo phương thức getProductById

        // Thêm sản phẩm vào giỏ hàng
        if (product != null) {
            cart.addToCart(product, quantity);
            session.setAttribute("sizeCart", cart.getCount());
            session.setAttribute("message", product.getName() + " Was added to Cart");
            System.out.println(product.getId() + " Was added to Cart");
            System.out.println(cart.getCartItems());
        } else {
            session.setAttribute("message", "Error occurred, unable to add product to the cart.");
            System.out.println("Error Appear But I do not reason why");
        }

        // Chuyển hướng lại trang trước
        response.sendRedirect("/ListProduct");

    }
}
