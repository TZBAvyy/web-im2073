import java.io.*;

import jakarta.servlet.*;            // Tomcat 10 (Jakarta EE 9)
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/order_confirm")
public class OrderConfirmServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("\nGET Request to /order/confirm");
        req.getRequestDispatcher("/orderConfirm.jsp").include(req, resp);
        resp.setHeader("Refresh", "3; URL=/orderDetails");
    }
}
