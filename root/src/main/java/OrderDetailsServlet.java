import java.io.*;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;            // Tomcat 10 (Jakarta EE 9)
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/orderDetails") 
public class OrderDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("\nGET Request to /order");
        try {
            final Meme[] memes = Meme.getMemes();
            req.setAttribute("memes", memes);
            req.getRequestDispatcher("/order.jsp").include(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
