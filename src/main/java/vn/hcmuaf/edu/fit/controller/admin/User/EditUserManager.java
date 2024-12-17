package vn.hcmuaf.edu.fit.controller.admin.User;

import vn.hcmuaf.edu.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "EditUserManager", value = "/EditUserManager")
public class EditUserManager extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paramID= request.getParameter("idEdit");
        try {
            if (paramID !=null){
                response.sendRedirect("/admin/edituserManager.jsp?idEdit=" + paramID);
            } else {
                response.sendRedirect("/admin/ListUserManager");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
