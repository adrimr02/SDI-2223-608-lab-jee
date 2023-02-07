package es.uniovi.sdi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Products", value = "/products")
public class ProductsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("storeProducts", new ProductService().getProducts());
        getServletContext().getRequestDispatcher("/products-view.jsp").forward(request, response);
    }
}
