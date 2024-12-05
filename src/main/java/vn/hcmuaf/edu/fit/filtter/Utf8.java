package vn.hcmuaf.edu.fit.filtter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(filterName = "Utf8", urlPatterns = "/*")
public class Utf8 implements Filter {
    @Override
    public void init(FilterConfig config) throws ServletException {
        // Bộ lọc có thể không cần cấu hình thêm ở đây
    }

    @Override
    public void destroy() {
        // Không cần xử lý gì khi hủy bộ lọc
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws ServletException, IOException {
        // Đảm bảo sử dụng đúng mã hóa UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Tiếp tục chuỗi bộ lọc
        chain.doFilter(request, response);
    }
}
