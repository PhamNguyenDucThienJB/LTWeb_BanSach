package vn.hcmuaf.edu.fit.controller.admin.Order;

import vn.hcmuaf.edu.fit.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AcceptOrderServlet", value = "/admin/acceptOrder")
public class AcceptOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy mã đơn hàng từ tham số 'id' trên URL
        String mahd = request.getParameter("id");

        if (mahd != null) {
            // Gọi phương thức acceptOrder từ OrderService để cập nhật trạng thái đơn hàng
            boolean success = OrderService.acceptOrder(mahd);

            // Thông báo kết quả cho người dùng
            if (success) {
                request.setAttribute("message", "Đơn hàng đã được chấp nhận.");
            } else {
                request.setAttribute("message", "Không thể chấp nhận đơn hàng.");
            }
        } else {
            request.setAttribute("message", "Mã đơn hàng không hợp lệ.");
        }

        // Chuyển hướng về trang quản lý đơn hàng
        request.getRequestDispatcher("/admin/ListOrderAdmin").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
