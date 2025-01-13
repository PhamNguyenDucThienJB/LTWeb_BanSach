package vn.hcmuaf.edu.fit.filtter;

import vn.hcmuaf.edu.fit.bean.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/AddCart") // Filter chỉ áp dụng cho đường dẫn /AddCart
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo tài nguyên nếu cần
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("auth") : null;

        if (user == null) { // Người dùng chưa đăng nhập
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/auth-popup.jsp");
            return; // Dừng xử lý tiếp
        }

        // Người dùng đã đăng nhập, tiếp tục xử lý
        chain.doFilter(request, response);
    }


    @Override
    public void destroy() {
        // Giải phóng tài nguyên nếu cần
    }
}
