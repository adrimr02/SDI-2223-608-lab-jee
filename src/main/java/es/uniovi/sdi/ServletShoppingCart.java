package es.uniovi.sdi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
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

        request.setAttribute("selectedItems", cart);
        getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);

        /* response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<HTML>");
        out.println("<HEAD><TITLE>Tienda SDI: Cesta de la compra</TITLE></HEAD>");
        out.println("<BODY>");
        out.println(shoppingCartToHtml(cart) + "<br>");
        out.println("<a href=\"index.jsp\">Volver</a></BODY></HTML>");
        */

    }

    private void addToShoppingCart(Map<String, Integer> cart, String productKey) {
        if (cart.containsKey(productKey)) {
            int productCount = cart.get(productKey);
            cart.put(productKey, productCount + 1);
        } else {
            cart.put(productKey, 1);
        }
    }

    private String shoppingCartToHtml(Map<String, Integer> cart) {
        StringBuilder shoppingCartToHtml = new StringBuilder();

        for (Entry<String, Integer> product : cart.entrySet())
            shoppingCartToHtml.append("<p>[")
                    .append(product.getKey()).append("], ")
                    .append(product.getValue()).append(" unidades</p>");

        return shoppingCartToHtml.toString();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
