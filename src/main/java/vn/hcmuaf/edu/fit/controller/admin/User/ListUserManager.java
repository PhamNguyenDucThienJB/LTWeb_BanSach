package vn.hcmuaf.edu.fit.controller.admin.User;

import vn.hcmuaf.edu.fit.model.Customer;
import vn.hcmuaf.edu.fit.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "ListUserManager", value = "/admin/ListUserManager")
public class ListUserManager extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Customer> list = CustomerService.getListCostumerAdmin();
        request.setAttribute("listUser", list);
        request.getRequestDispatcher("/admin/listUserManager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
