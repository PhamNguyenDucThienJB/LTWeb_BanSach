package vn.hcmuaf.edu.fit.controller.account;

import vn.hcmuaf.edu.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.StringCharacterIterator;
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
        String confirmPass = request.getParameter("pass"); // Mật khẩu nhập lại
        String email = request.getParameter("email"); // Email của người dùng

        try {
            // Kiểm tra nếu mật khẩu mới và mật khẩu nhập lại không giống nhau
            if (!newPass.equals(confirmPass)) {
                request.setAttribute("error", Validation_ERROR_PASS);
                request.getRequestDispatcher("/page_ForgetPasswd.jsp").forward(request, response);
                return;
            }

            // Mã hóa mật khẩu mới trước khi lưu vào cơ sở dữ liệu
            String hashedPass = UserService.hashPassword(newPass);

            // Cập nhật mật khẩu mới vào cơ sở dữ liệu
            UserService.updatePasswWord(email, hashedPass);

            // Thông báo thành công
            request.setAttribute("success", Validation_SUCCCES);
            request.getRequestDispatcher("/signin.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi trong quá trình thay đổi mật khẩu. Vui lòng thử lại.");
            request.getRequestDispatcher("/page_ForgetPasswd.jsp").forward(request, response);
        }
    }
}
