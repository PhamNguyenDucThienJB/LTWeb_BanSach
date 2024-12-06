package vn.hcmuaf.edu.fit.controller.account;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;
import vn.hcmuaf.edu.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

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

        // Lấy ngôn ngữ từ session
        String lang = (String) request.getSession().getAttribute("lang");
        if (lang == null) {
            lang = "en"; // Mặc định là tiếng Anh
        }
        Locale locale;
        switch (lang) {
            case "vi_VN":
                locale = new Locale("vi", "VN");
                break;
            case "ja_JP":
                locale = new Locale("ja", "JP");
                break;
            default:
                locale = new Locale("en", "US");
                break;
        }

        // Chọn Locale và tải tệp ngôn ngữ
        ResourceBundle messages = ResourceBundle.getBundle("lang.lang", locale);

        String mail = request.getParameter("email");

        if (!UserService.checkEmail(mail)) {
            try {
                UserService.sendMail(mail, ramdom_code);
                System.out.println("Code was sent to: " + mail);

                // Lưu thông báo thành công
                HttpSession session = request.getSession();
                request.setAttribute("success", messages.getString("VALIDATION_SUCCESS"));
                session.setAttribute("mail_verify", mail);
                request.getRequestDispatcher("/vertify.jsp").forward(request, response);
            } catch (MessagingException e) {
                e.printStackTrace();
                System.out.println("Error In Process");
            }
        } else {
            // Lưu thông báo lỗi
            request.setAttribute("error", messages.getString("VALIDATION_ERROR_EMAIL"));
            request.getRequestDispatcher("/page_ForgetPasswd.jsp").forward(request, response);
        }
    }
}
