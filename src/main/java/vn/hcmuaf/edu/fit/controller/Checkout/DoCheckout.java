package vn.hcmuaf.edu.fit.controller.Checkout;

import vn.hcmuaf.edu.fit.bean.User;
import vn.hcmuaf.edu.fit.model.Customer;
import vn.hcmuaf.edu.fit.service.CustomerService;
import vn.hcmuaf.edu.fit.service.ShoppingCartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Collection;
import java.util.Locale;

@WebServlet(name = "DoCheckout", value = "/DoCheckout")
public class DoCheckout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        // Lấy giỏ hàng từ session
        ShoppingCartService cart = (ShoppingCartService) session.getAttribute("cart");
        if (cart == null) {
            cart = new ShoppingCartService();
            session.setAttribute("cart", cart);
        }

        // Kiểm tra nếu giỏ hàng rỗng
        if (cart.getCartItems().isEmpty()) {
            // Gán thông báo lỗi cho request
            request.setAttribute("message", "Giỏ hàng của bạn đang trống. Vui lòng thêm sản phẩm trước khi thanh toán.");
            request.setAttribute("type", "error"); // Loại thông báo lỗi
            // Chuyển hướng về trang giỏ hàng
            request.getRequestDispatcher("./shoping-cart.jsp").forward(request, response);
            return; // Dừng lại ở đây, không tiếp tục xử lý
        }

        // Lấy thông tin người dùng
        User auth = (User) session.getAttribute("auth");
        if (auth != null) {
            String userId = auth.getId();

            Customer customers = CustomerService.findByMTK(userId);
            request.setAttribute("inforUser", customers);
        }

        // Lấy danh sách sản phẩm từ giỏ hàng
        request.setAttribute("cartItems", cart.getCartItems());
        System.out.println("List Item At Checkout: " + cart.getCartItems());

        // Định dạng tổng giá tiền
        NumberFormat currencyFormatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        request.setAttribute("totalPrice", cart.getTotalPrice());

        // Chuyển hướng đến trang checkout
        request.getRequestDispatcher("./checkout.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
