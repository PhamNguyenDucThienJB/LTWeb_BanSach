package vn.hcmuaf.edu.fit.controller.admin.Order;

import vn.hcmuaf.edu.fit.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteOrderAdmin", value = "/admin/DeleteOrderAdmin")
public class DeleteOrderAdmin extends HttpServlet {
    String VALIDATION_DELETE = "Success Delete !!!!!!";


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id"); // Lấy mã đơn hàng từ yêu cầu
        HttpSession session = request.getSession();
        if (idParam != null && !idParam.isEmpty()) {
            // Gọi dịch vụ xóa đơn hàng
            OrderService.deleteOrder(idParam);
            System.out.println("Delete: " + idParam);
            // Thiết lập thông báo thành công vào session
            session.setAttribute("message", VALIDATION_DELETE + idParam);

            // Chuyển hướng hoặc forward đến trang kết quả
            response.sendRedirect("/admin/ListOrderAdmin");
        } else {

            // Nếu không có mã đơn hàng, có thể chuyển hướng đến trang lỗi hoặc thông báo
            System.out.println("Error");
            session.setAttribute("message", "Không tìm thấy mã đơn hàng.");
            request.getRequestDispatcher("/admin/ListOrderAdmin").forward(request, response);
        }

    }
}
