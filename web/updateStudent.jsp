<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="classes.DbConnector" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Update Student</h2>
        <%
            // Retrieve form data
            int studentId = Integer.parseInt(request.getParameter("id"));
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String courseIdStr = request.getParameter("courseId");
            int courseId = (courseIdStr != null && !courseIdStr.isEmpty()) ? Integer.parseInt(courseIdStr) : 0;

            DbConnector dbConnector = new DbConnector();
            Connection conn = dbConnector.getConnection();
            String query = "UPDATE users SET first_name = ?, last_name = ?, email = ?, course_id = ? WHERE id = ? AND role = 'student'";
            
            try {
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, firstName);
                pstmt.setString(2, lastName);
                pstmt.setString(3, email);
                if (courseId > 0) {
                    pstmt.setInt(4, courseId);
                } else {
                    pstmt.setNull(4, java.sql.Types.INTEGER);
                }
                pstmt.setInt(5, studentId);

                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<div class='alert alert-success'>Student updated successfully.</div>");
                } else {
                    out.println("<div class='alert alert-danger'>Failed to update student. Student not found or you don't have permission.</div>");
                }

                pstmt.close();
            } catch (SQLException e) {
                out.println("<div class='alert alert-danger'>Error updating student: " + e.getMessage() + "</div>");
                e.printStackTrace();
            } finally {
                dbConnector.closeConnection();
            }
        %>
        <a href="allStudents.jsp" class="btn btn-primary">Back to Student List</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>