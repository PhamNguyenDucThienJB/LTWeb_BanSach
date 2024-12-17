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
        String paramID= request.getParameter("idEdit");
        try {
            if (paramID !=null){
                Customer customer= CustomerService.findByMATAIKHOAN(paramID);
                request.setAttribute("infor",customer);
                request.getRequestDispatcher("/admin/editUser.jsp").forward(request,response);
            } else {
                response.sendRedirect("/admin/ListUserManager");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
