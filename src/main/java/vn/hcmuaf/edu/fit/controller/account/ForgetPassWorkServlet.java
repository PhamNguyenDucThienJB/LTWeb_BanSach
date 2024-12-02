package vn.hcmuaf.edu.fit.controller.account;

import vn.hcmuaf.edu.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ForgetPassWorkServlet", value = "/ForgetPassWorkServlet")
public class ForgetPassWorkServlet extends HttpServlet {
    private String Validation_Error_Email = "Email không tồn tại";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String mail = request.getParameter("email");

        if (mail == null || mail.isEmpty() || !UserService.checkEmail(mail)) {

            response.sendRedirect("/vertify.jsp");

        } else {
            request.setAttribute("error", Validation_Error_Email);
            request.getRequestDispatcher("/page_ForgetPasswd.jsp").forward(request, response);

        }
    }
}
