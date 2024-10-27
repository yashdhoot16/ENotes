package com.DB;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

public class DBConnection {

	private static Connection conn;

	public static Connection getConnection() throws SQLException, ClassNotFoundException, IOException {
		if (conn == null || conn.isClosed()) {
			Class.forName("com.mysql.cj.jdbc.Driver");

			// First, connect to MySQL without specifying the database
			String url = "jdbc:mysql://localhost:3306/?useSSL=false&serverTimezone=UTC";
			String username = "root";
			String password = "admin";

			Connection initialCon = DriverManager.getConnection(url, username, password);

			// Execute SQL script to create the database and tables if they do not exist
			executeSqlScript(initialCon);

			// Now, connect to the newly created database
			url = "jdbc:mysql://localhost:3306/Enotes?useSSL=false&serverTimezone=UTC";
			conn = DriverManager.getConnection(url, username, password);
		}
		return conn;
	}

	private static void executeSqlScript(Connection con) throws IOException, SQLException {
		try (InputStream inputStream = DBConnection.class.getClassLoader().getResourceAsStream("database_setup.sql")) {
			if (inputStream == null) {
				throw new IOException("Unable to find database_setup.sql");
			}
			Scanner scanner = new Scanner(inputStream);
			scanner.useDelimiter(";");

			// Execute each query
			while (scanner.hasNext()) {
				String query = scanner.next().trim();
				if (!query.isEmpty()) {
					con.createStatement().execute(query);
				}
			}
			System.out.println("SQL script executed successfully.");
		}
	}
}