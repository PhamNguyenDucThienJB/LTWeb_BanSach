package vn.hcmuaf.edu.fit.controller.Checkout;

import vn.hcmuaf.edu.fit.model.ShoppingCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Locale;

@WebServlet(name = "DoCheckout", value = "/DoCheckout")
public class DoCheckout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("cart", cart);
        }

        // Lấy danh sách sản phẩm từ giỏ hàng
        request.setAttribute("cartItems", cart.getCartItems());
        System.out.println("List Item At Checkout: " + cart.getCartItems());
        NumberFormat currencyFormatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        request.setAttribute("totalPrice", cart.getTotalPrice());
        request.getRequestDispatcher("./checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
