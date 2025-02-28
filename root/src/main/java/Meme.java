import java.sql.*;
import java.util.Arrays;

public class Meme{
    int id;
    String name;
    String type;
    double price;
    String imagelink;

    public Meme(int id, String name, String type, double price, String imagelink) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.price = price;
        this.imagelink = imagelink;
    }

    public int getId() {
        return id;
    }
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

    // Static method to get all memes from the database
    // Return: Array[0:n] of Meme objects, where n is total number of rows in meme table in database
    public static Meme[] getMemes() throws SQLException {
        final DBProperties dbProps = new DBProperties();
        final String sqlStatement = """
                select memes.id, memes.name, memetypes.name, memes.price, memes.image_link from memes 
                inner join memetypes on memes.type_id = memetypes.id
                """;
        try(
            Connection conn = DriverManager.getConnection(dbProps.url, dbProps.user, dbProps.password);
            Statement stmt = conn.createStatement();
        ) {
            ResultSet resultSet = stmt.executeQuery(sqlStatement);

            Meme[] result = new Meme[100];
            int memeCount = 0;
            while(resultSet.next()) {
                Meme meme = new Meme(
                    resultSet.getInt("memes.id"),
                    resultSet.getString("memes.name"),
                    resultSet.getString("memetypes.name"),
                    resultSet.getDouble("memes.price"),
                    resultSet.getString("memes.image_link")
                );
                result[memeCount++] = meme;
                System.out.println(meme.name + ", " + meme.type + ", " + meme.price + ", " + meme.imagelink);
            }
            return Arrays.copyOf(result, memeCount);
        } catch(SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
}