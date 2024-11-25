package vn.hcmuaf.edu.fit.controller.account;

import vn.hcmuaf.edu.fit.bean.User;
import vn.hcmuaf.edu.fit.model.Customer;
import vn.hcmuaf.edu.fit.service.CustomerService;
import vn.hcmuaf.edu.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignInServlet", value = "/SignInServlet")
public class SignInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String passwd = request.getParameter("pass");

        User user = UserService.getInstance().checkLogin(email, passwd);
        if (user == null) {
            request.setAttribute("Error", "Tên đăng nhập hoặc mật khẩu không đúng!!!");
            request.getRequestDispatcher("/signin.jsp").forward(request, response);
        } else {
            if (user.checkRole(-1)) {
                request.setAttribute("Error", "Tài Khoản Của Bạn Đã Bị Khóa! Không Thể Đăng Nhập!!");
                request.getRequestDispatcher("/signin.jsp").forward(request, response);
            }
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            Customer customer = CustomerService.getCusByIdAcc(user.getId());
            session.setAttribute("cust", customer);
            response.sendRedirect(request.getContextPath() + "/IndexServlet");
        }
    }
}
