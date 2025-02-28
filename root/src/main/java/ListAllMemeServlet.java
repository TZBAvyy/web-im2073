import java.io.*;
import java.sql.*;

import jakarta.servlet.*;            // Tomcat 10 (Jakarta EE 9)
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/list")   // Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class ListAllMemeServlet extends HttpServlet {

   // The doGet() runs once per HTTP GET request to this servlet.
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("\nGET Request to /list");
      try {
         final Meme[] memes = Meme.getMemes();
         request.setAttribute("result", memes);
         request.getRequestDispatcher("/list.jsp").include(request, response);
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
}