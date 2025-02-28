import java.io.*;
import java.sql.*;
import java.util.Arrays;

import jakarta.servlet.*;            // Tomcat 10 (Jakarta EE 9)
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/order")   // Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class OrderServlet extends HttpServlet{
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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User accInfo = (User)req.getSession().getAttribute("accInfo");

        // TODO: Redirect deletes history, add order info in session => GET request retrieves order info from session
        if (accInfo==null) {
            resp.sendRedirect("/login");
            return;
        }

        final int[] memes = Arrays.stream(req.getParameterValues("memes"))
            .mapToInt(Integer::parseInt)
            .toArray();
        // final String[] memes = req.getParameterValues("memes");

        final DBProperties dbProps = new DBProperties();
        final String sqlStatement = """
                insert into orders (customer_id, total_price, purchase_datetime) values (?, ?, ?)
                """;;
        try (
            Connection conn = DriverManager.getConnection(dbProps.url, dbProps.user, dbProps.password);
            PreparedStatement stmt = conn.prepareStatement(sqlStatement);
        ) {
            for (int meme_id = 0; meme_id < memes.length; meme_id++) {
                stmt.setInt(1, accInfo.id);
                stmt.executeUpdate();
                meme_id++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
