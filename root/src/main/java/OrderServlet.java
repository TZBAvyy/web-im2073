import java.io.*;
import java.sql.*;
import java.util.Enumeration;

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
        System.out.println("\nPOST Request to /order");

        Double total_price = 0.0;
        int[] meme_qty_list = new int[100]; // List of int where index = meme_id and value = qty

        System.out.println("Received Parameters in POST request:");
        Enumeration<String> params = req.getParameterNames(); 
        while(params.hasMoreElements()){

            String paramName = params.nextElement();
            System.out.println("Name - "+paramName+", Value - "+req.getParameter(paramName));

            if (paramName.equals("total_price")) {
                total_price = Double.parseDouble(req.getParameter(paramName));
            } else if (paramName.contains("meme_")) {
                // Splits param of name "meme_N", where N is the meme.id 
                String[] parts = paramName.split("_");
                int meme_id = Integer.parseInt(parts[1]);
                meme_qty_list[meme_id] = Integer.parseInt(req.getParameter(paramName));
            }
        }

        System.out.println("Parameter values retrieved and compiled");

        final User accInfo = (User)req.getSession().getAttribute("accInfo");
        // TODO: Redirect deletes history, add order info in session => GET request retrieves order info from session
        if (accInfo==null) {
            resp.sendRedirect("/login");
            return;
        }
        System.out.println("Account Verified. Name: " + accInfo.name + ", Id: " + accInfo.id);

        final DBProperties dbProps = new DBProperties();
        final String sqlOrderStatement = """
                insert into orders (customer_id) values (?)
                """;
        try (
            Connection conn = DriverManager.getConnection(dbProps.url, dbProps.user, dbProps.password);
            PreparedStatement insertOrderStatement = conn.prepareStatement(sqlOrderStatement, PreparedStatement.RETURN_GENERATED_KEYS);
        ) {
            insertOrderStatement.setInt(1, accInfo.id);
            insertOrderStatement.executeUpdate();

            System.out.println("Order created: [UserID: "+accInfo.id+", TotalPrice: "+total_price+"]");

            ResultSet order_key = insertOrderStatement.getGeneratedKeys();
            if (order_key.next()) {

                int order_id = order_key.getInt(1);
                if (order_id==0) return;

                System.out.println("Order id retrieved (id: " + order_id + ")");

                int meme_id = 0;
                for (int qty : meme_qty_list) {
                    if (qty!=0) {
                        createOrderItem(meme_id, order_id, qty, conn);
                    }
                    meme_id++;
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("POST End");
        resp.sendRedirect("/order_confirm");
    }

    private void createOrderItem(int meme_id, int order_id, int qty, Connection conn) {
        final String sqlOrderItemStatement = """
                insert into orderitems (order_id, meme_id, meme_qty) values (?, ?, ?)
                """;
        try (PreparedStatement insertOrderItemStatement = conn.prepareStatement(sqlOrderItemStatement)) {
            insertOrderItemStatement.setInt(1, order_id);
            insertOrderItemStatement.setInt(2, meme_id);
            insertOrderItemStatement.setInt(3, qty);
            insertOrderItemStatement.executeUpdate();
            String line = "Order item created: [Order: %d, Meme: %d, Qty: %d]";
            System.out.println(String.format(line, order_id, meme_id, qty));
        } catch(SQLException e) {
            e.printStackTrace();
            return;
        }
    }
}
