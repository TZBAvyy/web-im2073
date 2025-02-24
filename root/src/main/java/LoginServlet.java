import java.io.*;
import java.sql.*;

import jakarta.servlet.*;            // Tomcat 10 (Jakarta EE 9)
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("accInfo")==null) {
            req.getRequestDispatcher("/login.jsp").include(req, resp);
        } else {
            resp.sendRedirect("/");
        }        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String[] accountInformation = new String[3];
        String password_DB = null;

        try (
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/im2073_db?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC",
                "myuser", "xxxx");
        ) {
            String sqlStatement = "select name, address, hashPassword, phoneNumber from customers where email=?";
            PreparedStatement stmt = conn.prepareStatement(sqlStatement);
            stmt.setString(1, email);

            ResultSet resultSet = stmt.executeQuery();
            if (resultSet.next()) {
                accountInformation[0] = resultSet.getString(1);   // Name
                accountInformation[1] = resultSet.getString(2);   // Address
                password_DB = resultSet.getString(3);             // Hashed PW
                accountInformation[2] = resultSet.getInt(4)+"";   // Phone Number

                System.out.println(password_DB + "vs" + password);
                System.out.println(accountInformation[0] + ", " + accountInformation[1] + ", " + accountInformation[2]); 
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        if (accountInformation[0]==null) {
            System.out.println("No such account found.");
            req.setAttribute("error", "No such account found.");
            req.getRequestDispatcher("/login.jsp").include(req, resp);

        } else if (checkPassword(password, password_DB)) {
            System.out.println("Login successful.");
            req.getSession().setAttribute("accInfo", accountInformation);
            resp.sendRedirect("/");

        } else {
            System.out.println("Incorrect password.");
            req.setAttribute("error", "Incorrect password.");
            req.getRequestDispatcher("/login.jsp").include(req, resp);

        }
    }

    private boolean checkPassword(String password, String hashPassword) {
        return password.equals(hashPassword);
    }
}
