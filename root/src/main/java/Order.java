import java.sql.*;
import java.util.Arrays;

public class Order {
    int id;
    int customer_id;
    double total_price;
    Timestamp purchaseDatetime;
    OrderItem[] items;

    public Order(int id, int customer_id, Timestamp purchaseDT,  double total_price, OrderItem[] items) {
        this.id = id;
        this.customer_id = customer_id;
        this.total_price = total_price;
        this.purchaseDatetime = purchaseDT;
        this.items = items;
    }

    public int getId() {
        return id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public Timestamp getPurchaseDatetime() {
        return purchaseDatetime;
    }

    public double getTotal_price() {
        return total_price;
    }

    public OrderItem[] getItems() {
        return items;
    }

    @Override
    public String toString() {
        String line = "Order [ID: %d, CustomerID: %d, Total: %.2f, Date: %tc]";
        System.out.print(String.format(line, id, customer_id, total_price, purchaseDatetime));
        System.out.print(" Items: | ");
        for (OrderItem item : items) {
            System.out.print(item + " | ");
        }
        return "";
    }

    public static Order[] getOrdersFromCustomer(int customer_id) {
        final DBProperties dbProps = new DBProperties();
        final String sqlStatementOrder = """
                select orders.id, orders.customer_id, orders.purchase_datetime,
                group_concat(orderitem.meme_id, ":", orderitem.meme_qty) as memes, 
                orders.total_price
                from orders join orderitem on orders.id=orderitem.order_id 
                where orders.customer_id=?
                group by orders.id;
                """;
        // Resulting table looks like:
        // +----+-------------+---------------------+-----------------+-------------+
        // | id | customer_id | purchase_datetime   | memes           | total_price |
        // +----+-------------+---------------------+-----------------+-------------+
        // |  1 |           1 | 2025-02-11 11:23:44 | 1:3,3:5         |       41.92 |
        // |  2 |           1 | 2025-03-01 14:24:43 | 1:3,2:1,3:2,8:3 |       53.94 |
        // |  3 |           1 | 2025-03-01 14:27:03 | 1:5,4:3,7:1,8:1 |       54.65 |
        // +----+-------------+---------------------+-----------------+-------------+
        try (
            Connection conn = DriverManager.getConnection(dbProps.url, dbProps.user, dbProps.password);
            PreparedStatement queryStmt = conn.prepareStatement(sqlStatementOrder);
        ) {
            queryStmt.setInt(1, customer_id);
            ResultSet resultSet = queryStmt.executeQuery();

            Order[] orders = new Order[100];
            int count = 0;
            while (resultSet.next()) {
                Order order = new Order(
                    resultSet.getInt("id"), 
                    resultSet.getInt("customer_id"), 
                    resultSet.getTimestamp("purchase_datetime"), 
                    resultSet.getDouble("total_price"),
                    convertOrderItems(resultSet.getString("memes").split(","))
                    );
                orders[count++] = order;
            }
            return Arrays.copyOf(orders, count);
        } catch(SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    // Private method to convert list of Strings of format "I:Q" to list of OrderItem
    // INPUT: String[] of "I:Q", where I is meme.id and Q is meme_qty
    // OUTPUT: OrderItem[]
    private static OrderItem[] convertOrderItems(String[] memesID_QTY) {
        OrderItem[] result = new OrderItem[100];
        int count = 0;
        for (String memeID_QTY : memesID_QTY) {
            String[] parts = memeID_QTY.split(":");
            // parts: String[2] of "I" (meme.id) and "Q" (meme_qty)
            Meme meme = Meme.getMeme(Integer.parseInt(parts[0]));
            // Static method in Meme to query DB for meme where memes.id = input
            OrderItem order_item = new OrderItem(meme, Integer.parseInt(parts[1]));
            result[count++] = order_item;
        }
        return Arrays.copyOf(result, count);
    }
}

