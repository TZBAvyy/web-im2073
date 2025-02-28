public class User {
    int id;
    String name;
    String address;
    String email;
    int phoneNumber;

    public User(int id, String name, String address, String email, int phoneNumber) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }
    public String getEmail() {
        return email;
    }
    public int getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public int getPhonenumber() {
        return phoneNumber;
    }

    @Override
    public String toString() {
        String result = "User %d [%s | %s | %d | %s]";
        return String.format(result, id, name, email, phoneNumber, address);
    }
}
