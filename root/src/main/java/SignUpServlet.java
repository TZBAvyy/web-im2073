import java.io.*;
import java.sql.*;

import jakarta.servlet.*;            // Tomcat 10 (Jakarta EE 9)
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("accInfo")==null) {
            req.getRequestDispatcher("/signup.jsp").include(req, resp);
        } else {
            resp.sendRedirect("/");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String phoneNumber = req.getParameter("phoneNumber");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try (
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/im2073_db?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC",
                "myuser", "xxxx");
        ) {
            // FIRST CHECK IF EMAIL EXISTS ALREADY IN DB (NO REPEAT)
            String sqlSelectStatement = "select * from customers where email=?";
            PreparedStatement selectStmt = conn.prepareStatement(sqlSelectStatement);
            selectStmt.setString(1, email);

            ResultSet resultSet = selectStmt.executeQuery();
            if (resultSet.next()) {
                req.setAttribute("error", "Email already exists.");
                req.getRequestDispatcher("/signup.jsp").include(req, resp);
            } else {
                // INSERT INTO DB
                String sqlInsertStatement = "insert into customers (name, address, phoneNumber, email, hashPassword) values (?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(sqlInsertStatement);
                insertStmt.setString(1, name);
                insertStmt.setString(2, address);
                insertStmt.setString(3, phoneNumber);
                insertStmt.setString(4, email);
                insertStmt.setString(5, password);

                insertStmt.executeUpdate();
                resp.sendRedirect("/login");
            } 
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
