package vn.hcmuaf.edu.fit.controller.Order;

import vn.hcmuaf.edu.fit.bean.User;
import vn.hcmuaf.edu.fit.model.Order;
import vn.hcmuaf.edu.fit.model.Ship;
import vn.hcmuaf.edu.fit.model.ShoppingCartItem;
import vn.hcmuaf.edu.fit.service.CustomerService;
import vn.hcmuaf.edu.fit.service.OrderService;
import vn.hcmuaf.edu.fit.service.ShoppingCartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "AddNewOrder", value = "/AddNewOrder")
public class AddNewOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(true);

        // Lấy thông tin từ session
        User auth = (User) session.getAttribute("auth");
        System.out.println("ID Session User: " + auth.getId());
        String convertIdCustumer = CustomerService.getIdAccByIdUser(auth.getId());
        System.out.println("ID Custumer: " + convertIdCustumer);
        // Lấy thông tin từ form

        ShoppingCartService cart = (ShoppingCartService) session.getAttribute("cart");
        if (cart == null) {
            cart = new ShoppingCartService();
            session.setAttribute("cart", cart);
        }

        // Lấy danh sách sản phẩm từ giỏ hàng
        request.setAttribute("cartItems", cart.getCartItems());
        request.setAttribute("totalPrice", cart.getTotalPrice());
        System.out.println("Total: ");

        String ten = request.getParameter("name");
        String diachi = request.getParameter("address");
        String phone = request.getParameter("tele");
        String email = request.getParameter("email");
        String ghichu = request.getParameter("note");


        // Tạo đối tượng Order
        Order order = new Order();
//        System.out.println("Total Order:" + order.totalMoney());

        order.setUser(auth);
        order.setBuyDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        order.setPriceTotal(cart.getTotalPrice());
        order.setNote(ghichu);
        order.setTrangthai(1); // Trạng thái: 1 - Đang xử lý

        // Lưu thông tin hóa đơn vào cơ sở dữ liệu
        OrderService.addOrder(order);

        // Lưu thông tin giao hàng
        Ship ship = new Ship();
        ship.setNgayGiao(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        ship.setDiachigiao(diachi);
        ship.setSdt(phone);
        order.setGiaohang(ship);
        System.out.println("List Product in Cart:");
        List<ShoppingCartItem> cartItems = cart.getCartItems();
        for (ShoppingCartItem item : cartItems) {
            String masp = item.getMasp();
            int soLgMua = item.getSoLgMua();
            System.out.println("MaSP: " + masp + ", Quanlity: " + soLgMua);
        }


        OrderService.addCTHD(order, cartItems);
        OrderService.addAddressShip(order);

        // Xóa giỏ hàng sau khi đặt hàng thành công
        session.removeAttribute("cart");

        // Chuyển hướng người dùng đến trang xác nhận
        response.sendRedirect("./ListProduct");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
