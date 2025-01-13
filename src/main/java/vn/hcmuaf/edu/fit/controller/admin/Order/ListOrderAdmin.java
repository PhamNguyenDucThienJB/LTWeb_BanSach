package vn.hcmuaf.edu.fit.controller.admin.Order;

import vn.hcmuaf.edu.fit.bean.User;
import vn.hcmuaf.edu.fit.model.DetailRecipe;
import vn.hcmuaf.edu.fit.model.DetailRecipeAdmin;
import vn.hcmuaf.edu.fit.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ListOrderAdmin", value = "/admin/ListOrderAdmin")
public class ListOrderAdmin extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy danh sách đơn hàng
        List<DetailRecipeAdmin> orders = OrderService.getListOrders();

        // Kiểm tra danh sách có rỗng hay không
        if (orders == null || orders.isEmpty()) {
            request.setAttribute("message", "Không có đơn hàng nào.");
        } else {
            request.setAttribute("orders", orders);
        }

        // Chuyển dữ liệu sang trang JSP
        request.getRequestDispatcher("/admin/listOrderManager.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Không cần xử lý POST trong trường hợp này
    }
}
