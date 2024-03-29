package es.uniovi.sdi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

@WebServlet(name = "AddToShoppingCart", value = "/AddToShoppingCart")
public class ServletShoppingCart extends HttpServlet {
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
            addToShoppingCart(cart, product);
        }

        getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);



    }

    private void addToShoppingCart(Map<String, Integer> cart, String productKey) {
        if (cart.containsKey(productKey)) {
            int productCount = cart.get(productKey);
            cart.put(productKey, productCount + 1);
        } else {
            cart.put(productKey, 1);
        }
    }

}
