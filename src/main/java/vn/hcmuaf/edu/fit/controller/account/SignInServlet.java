package vn.hcmuaf.edu.fit.controller.account;

import vn.hcmuaf.edu.fit.bean.User;
import vn.hcmuaf.edu.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

@WebServlet(name = "SignInServlet", value = "/SignInServlet")
public class SignInServlet extends HttpServlet {
    private static final String ACCOUNT_NOT_FOUND = "Tài khoản của bạn đã bị khóa";
    private static final String INVALID_CREDENTIALS = "Tên đăng nhập hoặc mật khẩu không đúng";
    private static final String SUCCESS_LOGIN = "Đã đăng nhập thành công";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Lấy ngôn ngữ từ tham số hoặc session (mặc định là "en")
        String lang = request.getParameter("lang");
        if (lang == null) {
            lang = (String) request.getSession().getAttribute("lang");
        }
        if (lang == null) {
            lang = "en"; // Mặc định tiếng Anh
        }

        // Lưu ngôn ngữ vào session
        request.getSession().setAttribute("lang", lang);

        // Chọn Locale dựa trên tham số
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

        // Đọc tài nguyên từ tệp
        ResourceBundle messages = ResourceBundle.getBundle("lang.lang", locale);


        String email = request.getParameter("email");
        String passwd = request.getParameter("pass");

        // Kiểm tra thông tin đăng nhập
        User user = UserService.getInstance().checkLogin(email, passwd);

        if (user != null) {
            if (user.checkRole(-1)) {
                request.setAttribute("error", messages.getString("ACCOUNT_NOT_FOUND"));
                request.getRequestDispatcher("/signin.jsp").forward(request, response);
                return;
            }

            HttpSession session = request.getSession();
            session.setAttribute("auth", user);
            session.setAttribute("success", messages.getString("SUCCESS_LOGIN"));
            response.sendRedirect("/IndexServlet");
        } else {
            request.setAttribute("error", messages.getString("INVALID_CREDENTIALS"));
            request.getRequestDispatcher("/signin.jsp").forward(request, response);
        }
    }


}
