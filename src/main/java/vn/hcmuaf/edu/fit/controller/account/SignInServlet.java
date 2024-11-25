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
    private static final String ACCOUNT_NOT_FOUND = "Tài khoản của bạn đã bị khóa";
    private static final String INVALID_CREDENTIALS = "Tên đăng nhập hoặc mật khẩu không đúng";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response); // Chuyển sang xử lý POST
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        String email = request.getParameter("email");
        String passwd = request.getParameter("pass");

        // Kiểm tra thông tin đăng nhập
        User user = UserService.getInstance().checkLogin(email, passwd);

        if (user != null) {
            // Kiểm tra nếu user bị khóa hoặc không hợp lệ
            if (user.checkRole(-1)) {
                request.setAttribute("error", ACCOUNT_NOT_FOUND);
                request.getRequestDispatcher("/signin.jsp").forward(request, response);
                return;
            }

            // Đăng nhập thành công
            HttpSession session = request.getSession();
            session.setAttribute("auth", user);
            response.sendRedirect("/IndexServlet");
        } else {
            // Sai thông tin đăng nhập
            request.setAttribute("error", INVALID_CREDENTIALS);
            request.getRequestDispatcher("/signin.jsp").forward(request, response);
        }
    }
}
