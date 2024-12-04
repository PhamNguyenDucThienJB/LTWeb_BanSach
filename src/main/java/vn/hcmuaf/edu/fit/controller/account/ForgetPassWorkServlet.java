package vn.hcmuaf.edu.fit.controller.account;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;
import vn.hcmuaf.edu.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ForgetPassWorkServlet", value = "/ForgetPassWorkServlet")
public class ForgetPassWorkServlet extends HttpServlet {
    private String Validation_Error_Email = "Email không tồn tại";
    private String Validation_ERROR_CODE = "Mã code không đúng";
    private String Validation_SUCCESS = "Mã code đã được gửi, vui lòng kiểm tra Gmail";
    int ramdom_code = UserService.randomCode();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int code_number = Integer.parseInt(request.getParameter("number"));


        try {
            if (code_number == ramdom_code) {
                // Mã đúng

                System.out.println("Correct Code");
                request.getRequestDispatcher("/page_New_ForgetPasswd.jsp").forward(request,response);
            } else {
                // Mã sai
                request.setAttribute("error",Validation_ERROR_CODE);
                System.out.println("Uncorrect Code");
                request.getRequestDispatcher("/vertify.jsp").forward(request,response);
            }
        } catch (NumberFormatException e) {
            // Xử lý trường hợp không nhập số hợp lệ
            response.getWriter().write("Mã xác nhận phải là một số.");

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String mail = request.getParameter("email");

        if (!UserService.checkEmail(mail)) {

            try {
                request.setCharacterEncoding("UTF-8");
                response.setCharacterEncoding("UTF-8");
                UserService.sendMail(mail, ramdom_code);
                System.out.println("Code was sent to: " + mail);
                request.setCharacterEncoding("UTF-8");
                response.setCharacterEncoding("UTF-8");
            } catch (MessagingException e) {
                e.printStackTrace();
                System.out.println("Error In Process");
            }
            HttpSession session = request.getSession();
            request.setAttribute("success",Validation_SUCCESS);
            session.setAttribute("mail_vertify", mail);
            request.getRequestDispatcher("/vertify.jsp").forward(request,response);

        } else {
            request.setAttribute("error", Validation_Error_Email);
            request.getRequestDispatcher("/page_ForgetPasswd.jsp").forward(request, response);

        }
    }
}
