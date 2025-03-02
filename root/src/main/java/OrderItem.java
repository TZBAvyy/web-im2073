public class OrderItem {
    Meme meme;
    int meme_qty;
    double subtotal;

    public OrderItem(Meme meme, int meme_qty) {
        this.meme = meme;
        this.meme_qty = meme_qty;
        this.subtotal = meme.price * meme_qty;
    }

    @Override
    public String toString() {
        return String.format("%s [x%d] ($%.2f)", meme.name, meme_qty, subtotal);
    }
    
    public Meme getMeme() {
        return meme;
    }

    public int getMeme_qty() {
        return meme_qty;
    }

    public double getSubtotal() {
        return subtotal;
    }
}