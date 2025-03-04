import java.sql.*;
import java.util.Arrays;

public class Meme{
    int id;
    String name;
    String desc;
    double price;
    String imagelink;

    public Meme(int id, String name, String desc, double price, String imagelink) {
        this.id = id;
        this.name = name;
        this.desc = desc;
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
    public String getDesc() {
        return desc;
    }

    // Static method to get all memes from the database
    // Return: Array[0:n] of Meme objects, where n is total number of rows in meme table in database
    public static Meme[] getMemes() throws SQLException {
        final DBProperties dbProps = new DBProperties();
        final String sqlStatement = """
                select memes.id, memes.name, memes.descrip, memes.price, memes.image_link from memes 
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
                    resultSet.getString("memes.descrip"),
                    resultSet.getDouble("memes.price"),
                    resultSet.getString("memes.image_link")
                );
                result[memeCount++] = meme;
                System.out.println(meme.name + ", " + meme.desc + ", " + meme.price + ", " + meme.imagelink);
            }
            return Arrays.copyOf(result, memeCount);
        } catch(SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public static Meme getMeme(int meme_id) {
        final DBProperties dbProps = new DBProperties();
        final String memeQuery = """
                select memes.id, memes.name, memes.descrip, memes.price, memes.image_link from memes
                where memes.id=?;
                """;
        try (
            Connection conn = DriverManager.getConnection(dbProps.url, dbProps.user, dbProps.password);
            PreparedStatement stmt = conn.prepareStatement(memeQuery);
        ) {
            stmt.setInt(1, meme_id);
            ResultSet rs = stmt.executeQuery();
            Meme meme = null;
            if (rs.next()) {
                meme = new Meme(
                    rs.getInt("memes.id"),
                    rs.getString("memes.name"),
                    rs.getString("memes.descrip"),
                    rs.getDouble("memes.price"),
                    rs.getString("memes.image_link")
                );
            }
            return meme;
        } catch(SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
}