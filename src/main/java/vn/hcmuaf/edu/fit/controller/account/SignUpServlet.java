package vn.hcmuaf.edu.fit.controller.account;

import vn.hcmuaf.edu.fit.bean.User;
import vn.hcmuaf.edu.fit.model.Customer;
import vn.hcmuaf.edu.fit.service.CustomerService;
import vn.hcmuaf.edu.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignUpServlet", value = "/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    private String VALIDATION_ERROR_PASS = "Mặt khẩu không trùng khớp";
    private String VALIDATION_ERROR_EMAIL = "Email đã tồn tại";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");

        if (!repass.equals(pass)) {
            request.setAttribute("error", VALIDATION_ERROR_PASS);
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        } else if (!UserService.checkEmail(email)) {
            request.setAttribute("error", VALIDATION_ERROR_EMAIL);
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        } else {
            // Tạo đối tượng User và Customer
            User newUser = new User(email, pass, name);
            Customer newCus = new Customer();
            UserService.register(newUser);
            newCus.setMATAIKHOAN(newUser.getId());
            newCus.setTENKH(newUser.getTentk());
            CustomerService.registerKH(newCus, newUser);

            // Đặt URL chuyển hướng
            String url;
            if (request.getParameter("save-login") != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("auth", newUser);
                url = "/IndexServlet"; // Đảm bảo đây là mapping servlet chính xác
            } else {
                url = "signin.jsp";
            }
            response.sendRedirect(url);
        }
    }

}
