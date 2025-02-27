import java.io.*;
import java.sql.*;
import java.util.Arrays;

import jakarta.servlet.*;            // Tomcat 10 (Jakarta EE 9)
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/list")   // Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class ListAllMemeServlet extends HttpServlet {

   public class Meme {
      String name;
      String type;
      double price;
      String imagelink;

      public String getImagelink() {
          return imagelink;
      }
      public String getName() {
          return name;
      }
      public double getPrice() {
          return price;
      }
      public String getType() {
          return type;
      }
   }

   // The doGet() runs once per HTTP GET request to this servlet.
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("\nGET Request to /list");
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
         final String sqlStatement = """
               select memes.name, memetypes.name, memes.price, memes.image_link from memes 
               inner join memetypes on memes.type_id = memetypes.id
               """;
         // === Form the SQL command - END ===

         ResultSet resultSet = stmt.executeQuery(sqlStatement);  // Send the query to the server

         // Step 4: Process the query result set
         Meme[] result = new Meme[100];  // Assume we have less than 100 memes
         int memeCount = 0;
         while(resultSet.next()) {
            Meme meme = new Meme();
            meme.name = resultSet.getString(1);
            meme.type = resultSet.getString(2);
            meme.price = resultSet.getDouble(3);
            meme.imagelink = resultSet.getString(4);

            result[memeCount++] = meme;
            System.out.println(meme.name + ", " + meme.type + ", " + meme.price + ", " + meme.imagelink);
         }

         // Renders jsp page
         request.setAttribute("result", Arrays.copyOfRange(result, 0, memeCount));
         request.getRequestDispatcher("/list.jsp").include(request, response);

      } catch(SQLException ex) {
         ex.printStackTrace();
      }  // Step 5: Close conn and stmt - Done automatically by try-with-resources (JDK 7)
   }
}