package vn.hcmuaf.edu.fit.controller.Product;

import vn.hcmuaf.edu.fit.model.Category;
import vn.hcmuaf.edu.fit.model.Product;
import vn.hcmuaf.edu.fit.model.ProductDetails;
import vn.hcmuaf.edu.fit.service.CategoryService;
import vn.hcmuaf.edu.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@WebServlet(name = "ListProduct", value = "/ListProduct")
public class ListProduct extends HttpServlet {
    private static long serialVersionUID = 1l;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Product> list = ProductService.listAppearUser();
        List<Product> productList = new ArrayList<>(list);
        String numPage = request.getParameter("page");
        if (numPage == null) {
            numPage = "1";
        }

        int totalProduct = ProductService.getToTalProduct();
        int endPage = totalProduct / 15;
        if (totalProduct % 15 != 0) {
            endPage++;
        }

        int page = Integer.parseInt(numPage);
        if (page < 1) {
            page = 1;
        } else if (page > endPage) {
            page = endPage;
        }

        List<Product> listpage = ProductService.getPaginationPageOwn(page, productList);

        request.setAttribute("listProduct", listpage);
        request.setAttribute("currentPage", page);
        request.setAttribute("endPage", endPage);

//        Các loại sách
        Collection<Category> categoriesList = CategoryService.getData();
        request.setAttribute("categoriesList", categoriesList);


        request.setAttribute("sizeProduct", list.size());
        System.out.println("Size Product: " + list.size());
        request.getRequestDispatcher("/shop-product.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
