import java.io.*;
import java.sql.*;

import jakarta.servlet.*;            // Tomcat 10 (Jakarta EE 9)
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/orderDetails") 
public class OrderDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("\nGET /orderDetails");
        
        // get & check session from req
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("accInfo") == null) {
            // Store the original request URL in session and redirect to login
            session = req.getSession(true);
            session.setAttribute("redirectAfterLogin", "/orderDetails");
            resp.sendRedirect("login");
            return;
        }

        // retrieve user info
        User accInfo = (User) session.getAttribute("accInfo");

        try {
            // fetch orders for the logged in customer
            Order[] orders = Order.getOrdersFromCustomer(accInfo.id);

            if (orders == null || orders.length == 0) {
                req.setAttribute("error", "No orders found.");
            } else {
                req.setAttribute("orders", orders);
            }

            RequestDispatcher dispatcher = req.getRequestDispatcher("orderDetails.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            resp.getWriter().println("Error retrieving orders: " + e.getMessage());
        }
    }
}
