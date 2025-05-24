
package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnector {
    private static final String URL = "jdbc:mysql://localhost:3306/onlinecourse";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private Connection connection;

    public DbConnector() {
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            // Establish the connection
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connected successfully.");
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Failed to connect to the database.");
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Database connection closed.");
            } catch (SQLException e) {
                System.out.println("Failed to close the database connection.");
                e.printStackTrace();
            }
        }
    }
}
