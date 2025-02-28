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
}