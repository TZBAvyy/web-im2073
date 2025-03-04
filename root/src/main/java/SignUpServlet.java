import java.io.*;
import java.sql.*;

import jakarta.servlet.*;            // Tomcat 10 (Jakarta EE 9)
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("\nGET Request to /signup");
        if (req.getSession().getAttribute("accInfo")==null) {
            req.getRequestDispatcher("/signup.jsp").include(req, resp);
        } else {
            resp.sendRedirect("/");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final String name = req.getParameter("name");
        final String address = req.getParameter("address");
        final String phoneNumber = req.getParameter("phoneNumber");
        final String email = req.getParameter("email");
        final String password = req.getParameter("password");

        System.out.println("\nPOST Request to /signup");
        System.out.println("Name: " + name);
        System.out.println("Address: " + address);
        System.out.println("Phone Number: " + phoneNumber);
        System.out.println("Email: " + email);
        System.out.println("Password: " + password + "\n...");

        final DBProperties dbProps = new DBProperties();
        final String sqlSelectStatement = "select * from users where email=?";
        final String sqlInsertStatement = "insert into users (name, address, phoneNumber, email, hashPassword) values (?, ?, ?, ?, ?)";
        try (
            Connection conn = DriverManager.getConnection(dbProps.url, dbProps.user, dbProps.password);
            PreparedStatement selectStmt = conn.prepareStatement(sqlSelectStatement);
            PreparedStatement insertStmt = conn.prepareStatement(sqlInsertStatement);
        ) {
            // FIRST CHECK IF EMAIL EXISTS ALREADY IN DB (NO REPEAT)
            selectStmt.setString(1, email);

            ResultSet resultSet = selectStmt.executeQuery();
            if (resultSet.next()) {
                req.setAttribute("error", "Email already exists.");
                req.getRequestDispatcher("/signup.jsp").include(req, resp);
                
                System.out.println("Email found in database (Name: " + resultSet.getString("name") + ")\n");

            } else {
                // INSERT INTO DB IF EMAIL IS UNIQUE
                insertStmt.setString(1, name);
                insertStmt.setString(2, address);
                insertStmt.setString(3, phoneNumber);
                insertStmt.setString(4, email);
                insertStmt.setString(5, password);

                insertStmt.executeUpdate();
                System.out.println("Account created successfully.\n");
                resp.sendRedirect("/login");
            } 
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
