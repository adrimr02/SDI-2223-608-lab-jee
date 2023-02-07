package es.uniovi.sdi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ServletRemoveFromCart", value = "/RemoveFromCart")
public class ServletRemoveFromCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Map<String,Integer> cart = (HashMap<String,Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        String product = request.getParameter("product");
        if (product != null) {
            cart.remove(product);
        }

        getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
    }

}
