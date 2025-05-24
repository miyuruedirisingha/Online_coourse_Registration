<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="classes.DbConnector" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Delete Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Delete Student</h2>
        <%
            int studentId = Integer.parseInt(request.getParameter("id"));
            DbConnector dbConnector = new DbConnector();
            Connection conn = dbConnector.getConnection();
            String query = "DELETE FROM users WHERE id = ? AND role = 'student'";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, studentId);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<div class='alert alert-success'>Student deleted successfully.</div>");
            } else {
                out.println("<div class='alert alert-danger'>Failed to delete student. Student not found or you don't have permission.</div>");
            }

            pstmt.close();
            dbConnector.closeConnection();
        %>
        <a href="allStudents.jsp" class="btn btn-primary">Back to Student List</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>