package vn.hcmuaf.edu.fit.controller.Order;

import vn.hcmuaf.edu.fit.bean.User;
import vn.hcmuaf.edu.fit.model.DetailRecipe;
import vn.hcmuaf.edu.fit.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ListOrder", value = "/ListOrder")
public class ListOrder extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        // Lấy thông tin người dùng từ session
        User auth = (User) session.getAttribute("auth");

        // Kiểm tra xem có tồn tại người dùng trong session không
        if (auth != null) {
            System.out.println("ID Session User: " + auth.getId());

            // Lấy danh sách chi tiết đơn hàng của người dùng từ OrderService
            List<DetailRecipe> listOrder = new ArrayList<>(OrderService.getOrderDetailsByIdUser(auth.getId()));

            // Kiểm tra nếu danh sách đơn hàng không rỗng
            if (listOrder != null && !listOrder.isEmpty()) {
                System.out.println("Danh sách đơn hàng có " + listOrder.size() + " mục.");

                // In thông tin chi tiết đơn hàng để kiểm tra
                for (DetailRecipe order : listOrder) {
                    System.out.println("Đơn hàng: " + order);
                    System.out.println("Mã đơn hàng: " + order.getMahd());
                    System.out.println("Mã sản phẩm: " + order.getMasp());
                    System.out.println("Tên sản phẩm: " + order.getTensp());
                    System.out.println("Số lượng: " + order.getSolg());
                    System.out.println("Giá sản phẩm: " + order.getPrice());
                    System.out.println("Tổng giá sản phẩm: " + order.getTotalprice());
                    System.out.println("Địa chỉ giao: " + order.getDiachigiao());
                    System.out.println("Trang Thai giao: " + order.getStatus());
                }

                // Nhóm các đơn hàng theo mã đơn hàng (mahd)
                Map<String, List<DetailRecipe>> groupedOrders = OrderService.getInstance().groupOrdersById(listOrder);
                request.setAttribute("groupedOrders", groupedOrders);

                // Chuyển dữ liệu đến JSP
                request.getRequestDispatcher("./listOrder.jsp").forward(request, response);
            } else {
                // Nếu không có đơn hàng nào
                System.out.println("Không có đơn hàng nào.");
                request.setAttribute("message", "Không có đơn hàng nào.");
            }
        } else {
            // Nếu không tìm thấy đối tượng người dùng trong session (chưa đăng nhập)
            System.out.println("Người dùng chưa đăng nhập.");
            response.sendRedirect("/signin.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Không cần xử lý POST trong trường hợp này
    }
}
