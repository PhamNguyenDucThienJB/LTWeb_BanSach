package vn.hcmuaf.edu.fit.filtter;

import vn.hcmuaf.edu.fit.bean.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
// Cách 1
@WebFilter("/admin/*") // Filter áp dụng cho mọi đường dẫn bắt đầu với /admin/
public class Adminfilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Có thể khởi tạo một số tài nguyên tại đây nếu cần
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String path = httpRequest.getRequestURI();
        if (path.endsWith("/admin/css/style.css") || path.startsWith(httpRequest.getContextPath() + "/admin/css/")) {
            chain.doFilter(request, response); // Bỏ qua filter
            return;
        }
        HttpSession session = httpRequest.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("auth") : null;

        // Kiểm tra nếu người dùng chưa đăng nhập hoặc không phải admin
        if (user == null || !user.checkRole(1)) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/error/page-error-403.html");
            return; // Dừng xử lý nếu không có quyền
        }

        // Tiếp tục xử lý nếu đủ quyền
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Có thể giải phóng tài nguyên tại đây nếu cần
    }
}
