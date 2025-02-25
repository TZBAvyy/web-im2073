import java.io.*;

import jakarta.servlet.*;            // Tomcat 10 (Jakarta EE 9)
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("\nGET Request to /logout");
        if (req.getSession().getAttribute("accInfo")!=null) {
            req.getSession().invalidate();
            System.out.println("Session invalidated/cleared. User logged out.");
        } 
        resp.sendRedirect("/");
    }
}
