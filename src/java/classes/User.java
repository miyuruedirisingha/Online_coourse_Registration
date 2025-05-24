package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {

    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String phone;
    private String dob;
    private String address;
    private String role;
    private int courseId;

    public User() {
        // Default constructor
    }

    public User(String firstName, String lastName, String email, String password, String phone, String dob, String address, String role, int courseId) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.dob = dob;
        this.role = role;
        this.address = address;
        this.courseId = courseId;
    }

    public boolean register(DbConnector dbConnector) {
        Connection connection = dbConnector.getConnection();
        String query = "INSERT INTO users (first_name, last_name, email, password, phone, dob, address,role, course_id) VALUES (?, ?, ?, ?, ?, ?, ?,?, ?)";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, email);
            statement.setString(4, password);
            statement.setString(5, phone);
            statement.setString(6, dob);
            statement.setString(7, address);
            statement.setString(8, role);
            statement.setInt(9, courseId);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("User registration successful.");
                return true;
            } else {
                System.out.println("User registration failed.");
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Error registering user: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            dbConnector.closeConnection();
        }
    }

    public boolean login(DbConnector dbConnector) {
        Connection connection = dbConnector.getConnection();
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                this.id = resultSet.getInt("id");
                this.firstName = resultSet.getString("first_name");
                this.lastName = resultSet.getString("last_name");
                this.email = resultSet.getString("email");
                this.password = resultSet.getString("password");
                this.phone = resultSet.getString("phone");
                this.dob = resultSet.getString("dob");
                this.address = resultSet.getString("address");
                this.courseId = resultSet.getInt("course_id");
                this.role = resultSet.getString("role");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Error logging in: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            dbConnector.closeConnection();
        }
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }
}
