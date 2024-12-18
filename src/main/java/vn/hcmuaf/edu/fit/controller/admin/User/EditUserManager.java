package vn.hcmuaf.edu.fit.controller.admin.User;

import vn.hcmuaf.edu.fit.model.Customer;
import vn.hcmuaf.edu.fit.service.CustomerService;
import vn.hcmuaf.edu.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "EditUserManager", value = "/admin/EditUserManager")
public class EditUserManager extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paramID = request.getParameter("idEdit");
        try {
            if (paramID != null) {
                Customer customer = CustomerService.findByMATAIKHOAN(paramID);
                request.setAttribute("infor", customer);
                request.getRequestDispatcher("/admin/editUser.jsp").forward(request, response);
            } else {
                response.sendRedirect("/admin/ListUserManager");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String tele = request.getParameter("phone");
        String roleStr = request.getParameter("role");
        int role = Integer.parseInt(roleStr);
        String paramID = request.getParameter("updateID");
        try {
            if (address != null && tele != null && roleStr != null && name != null) {
                System.out.println("Prcess Update With: " + paramID);
                Customer customer = new Customer();
                customer.setTENKH(name);
                customer.setDIACHI(address);
                customer.setSDT(tele);
                customer.setRole(role);
                // Cập nhật thông tin customer vào cơ sở dữ liệu
                boolean isUpdated = CustomerService.updateUser(customer, paramID);

                if (isUpdated) {
                    response.sendRedirect("/admin/ListUserManager");  // Nếu thành công, chuyển hướng
                } else {
                    response.sendRedirect("/admin/EditUserManager?idEdit=" + customer.getMAKH());  // Nếu có lỗi, quay lại trang chỉnh sửa
                }
            } else {
                response.sendRedirect("/admin/ListUserManager");  // Nếu thông tin không hợp lệ
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("/admin/ListUserManager");  // Nếu có lỗi về số, quay lại trang danh sách
        }

    }
}
