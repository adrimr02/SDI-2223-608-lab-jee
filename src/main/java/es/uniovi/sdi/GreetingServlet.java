package es.uniovi.sdi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "GreetingServlet", value = "/GreetingServlet")
public class GreetingServlet extends HttpServlet {
    int contador = 0;
    private Object mutex = new Object();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Hello World!</title></head>");
        out.println("<body>");
        String name = request.getParameter("name");
        if (name != null)
            out.println("Hello " + name + "<br>");
        out.println("");
        out.println("</body>");
        out.println("</html>");
        try {
            Thread.sleep(15000);
        } catch (InterruptedException e) {
            out.println("Thread ID: " + Thread.currentThread().getId() + "<br>");
        }
        synchronized (mutex) {
            contador++;
            out.println("Visits: " + contador + "<br>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
