package vn.hcmuaf.edu.fit.controller.Cart;

import vn.hcmuaf.edu.fit.service.ShoppingCartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ListProductCart", value = "/ListProductCart")
public class ListProductCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        ShoppingCartService cart = (ShoppingCartService) session.getAttribute("cart");
        if (cart == null) {
            cart = new ShoppingCartService();
            session.setAttribute("cart", cart);
        }

        // Lấy danh sách sản phẩm từ giỏ hàng
        request.setAttribute("cartItems", cart.getCartItems());
        request.setAttribute("totalPrice", cart.getTotalPrice());
        request.getRequestDispatcher("./shoping-cart.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
