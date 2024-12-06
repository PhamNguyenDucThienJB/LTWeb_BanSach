package vn.hcmuaf.edu.fit.controller.account;

import vn.hcmuaf.edu.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.StringCharacterIterator;
import java.util.Locale;
import java.util.ResourceBundle;

@WebServlet(name = "UpdatePasswordServlet", value = "/UpdatePasswordServlet")
public class UpdatePasswordServlet extends HttpServlet {
    private final String Validation_SUCCCES = "Đã đổi mật khẩu thành công";
    private final String Validation_ERROR_PASS = "Mật khẩu mới và mật khẩu nhập lại không khớp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Không sử dụng GET, có thể để trống hoặc xử lý nếu cần.
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPass = request.getParameter("pass"); // Mật khẩu mới
        String confirmPass = request.getParameter("repass"); // Mật khẩu nhập lại
        String email = request.getParameter("email"); // Email của người dùng

        // Lấy ngôn ngữ từ session (hoặc mặc định là "en")
        String lang = (String) request.getSession().getAttribute("lang");
        if (lang == null) {
            lang = "en"; // Mặc định là tiếng Anh
        }

        // Chọn Locale và tải tệp ngôn ngữ
        Locale locale = new Locale(lang);
        ResourceBundle messages = ResourceBundle.getBundle("lang.lang", locale);

        try {
            // Kiểm tra nếu mật khẩu mới và mật khẩu nhập lại không giống nhau
            if (!newPass.equals(confirmPass)) {
                request.setAttribute("error", messages.getString("VALIDATION_ERROR_PASS"));

                request.getRequestDispatcher("/page_New_ForgetPasswd.jsp").forward(request, response);
                return;
            }

            // Mã hóa mật khẩu mới trước khi lưu vào cơ sở dữ liệu
            String hashedPass = UserService.hashPassword(newPass);

            // Cập nhật mật khẩu mới vào cơ sở dữ liệu
            UserService.updatePasswWord(email, hashedPass);

            // Thông báo thành công
            request.setAttribute("success", messages.getString("VALIDATION_SUCCESS_UPDATE"));
            request.getRequestDispatcher("/signin.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", messages.getString("VALIDATION_ERROR_PROCESS"));
            request.getRequestDispatcher("/page_ForgetPasswd.jsp").forward(request, response);
        }
    }
}
