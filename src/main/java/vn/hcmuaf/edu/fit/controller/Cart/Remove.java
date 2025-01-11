package vn.hcmuaf.edu.fit.controller.Cart;

import vn.hcmuaf.edu.fit.model.ShoppingCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Remove", value = "/Remove")
public class Remove extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productCode = request.getParameter("productId");

        if (productCode == null || productCode.isEmpty()) {
            System.out.println("Product ID is missing.");
            response.sendRedirect("./ListProductCart");
            return;
        }

        ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");

        if (cart != null) {
            cart.remove(productCode);
            System.out.println("Removed product " + productCode);
        } else {
            System.out.println("Shopping cart not found in session.");
        }

        response.sendRedirect("./ListProductCart");
    }
}
