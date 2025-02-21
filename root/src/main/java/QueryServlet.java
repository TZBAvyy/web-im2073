import java.io.*;
import java.sql.*;
import java.util.Arrays;

import jakarta.servlet.*;            // Tomcat 10 (Jakarta EE 9)
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
//import javax.servlet.*;            // Tomcat 9 (Java EE 8 / Jakarta EE 8)
//import javax.servlet.http.*;
//import javax.servlet.annotation.*;

@WebServlet("/list")   // Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class QueryServlet extends HttpServlet {

   // The doGet() runs once per HTTP GET request to this servlet.
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {
      String[][] result = new String[100][4];
      int memeCount = 0;
      try (
         // Step 1: Allocate a database 'Connection' object
         Connection conn = DriverManager.getConnection(
               "jdbc:mysql://localhost:3306/im2073_db?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC",
               "myuser", "xxxx");   // For MySQL
               // The format is: "jdbc:mysql://hostname:port/databaseName", "username", "password"

         // Step 2: Allocate a 'Statement' object in the Connection
         Statement stmt = conn.createStatement();
      ) {
         // Step 3: Execute a SQL SELECT query
         // === Form the SQL command - BEGIN ===
         String sqlStatement = "select memes.name, memetypes.name, memes.price, memes.image_link from memes " +
                              "inner join memetypes on memes.type_id = memetypes.id";
         // === Form the SQL command - END ===

         ResultSet resultSet = stmt.executeQuery(sqlStatement);  // Send the query to the server

         // Step 4: Process the query result set
         
         while(resultSet.next()) {
            String[] meme = new String[4];
            meme[0] = resultSet.getString(1);   // Name
            meme[1] = resultSet.getString(2);   // Type
            meme[2] = resultSet.getDouble(3)+"";// Price
            meme[3] = resultSet.getString(4);   // Image Link

            System.out.println(meme[0] + ", " + meme[1] + ", " + meme[2] + ", " + meme[3]); 
            result[memeCount] = meme;
            memeCount++;
         }

      } catch(SQLException ex) {
         ex.printStackTrace();
      }  // Step 5: Close conn and stmt - Done automatically by try-with-resources (JDK 7)
 
      // Renders jsp page
      request.setAttribute("result", Arrays.copyOfRange(result, 0, memeCount));
      request.getRequestDispatcher("/list.jsp").include(request, response);
   }
}