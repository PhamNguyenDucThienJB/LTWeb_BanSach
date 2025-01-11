package vn.hcmuaf.edu.fit.controller.Cart;

import vn.hcmuaf.edu.fit.model.ShoppingCart;
import vn.hcmuaf.edu.fit.model.ShoppingCartItem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateCart", value = "/UpdateCart")
public class UpdateCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String quantityStr = request.getParameter("quantity");

        if (productId == null || quantityStr == null) {
            response.sendRedirect("./ListProductCart");
            return;
        }

        int quantity;
        try {
            quantity = Integer.parseInt(quantityStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("./ListProductCart");
            return;
        }

        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

        if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("cart", cart);
        }

        ShoppingCartItem item = cart.getCartItemById(productId);

        if (item != null) {
            if (quantity > 0) {
                item.setSoLgMua(quantity); // Cập nhật số lượng sản phẩm
            } else {
                cart.remove(productId); // Xóa sản phẩm khỏi giỏ hàng
            }
        }

        response.sendRedirect("./ListProductCart");
    }

}
