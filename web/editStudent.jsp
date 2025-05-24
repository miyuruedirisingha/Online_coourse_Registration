<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="classes.User, classes.DbConnector, classes.CourseDAO, classes.Course, java.util.List, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Student | NextGen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            padding: 30px;
        }
        .navbar-brand img {
            transition: transform 0.3s ease-in-out;
        }
        .navbar-brand:hover img {
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="pngwing.com.png" alt="Logo" width="50" height="50" class="d-inline-block align-text-top me-2">
                <span class="fs-4 fw-bold">NextGen</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="adminDashbord.jsp"><i class="bi bi-house-door"></i> Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="allStudents.jsp"><i class="bi bi-people"></i> All Students</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="form-container">
                    <h2 class="text-center mb-4"><i class="bi bi-person-badge"></i> Edit Student</h2>
                    <%
                        int studentId = Integer.parseInt(request.getParameter("id"));
                        DbConnector dbConnector = new DbConnector();
                        Connection conn = dbConnector.getConnection();
                        String query = "SELECT * FROM users WHERE id = ? AND role = 'student'";
                        PreparedStatement pstmt = conn.prepareStatement(query);
                        pstmt.setInt(1, studentId);
                        ResultSet rs = pstmt.executeQuery();
                        if (rs.next()) {
                    %>
                    <form action="updateStudent.jsp" method="post">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <div class="mb-3">
                            <label for="firstName" class="form-label"><i class="bi bi-person"></i> First Name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" value="<%= rs.getString("first_name") %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="lastName" class="form-label"><i class="bi bi-person"></i> Last Name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" value="<%= rs.getString("last_name") %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label"><i class="bi bi-envelope"></i> Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%= rs.getString("email") %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="courseId" class="form-label"><i class="bi bi-book"></i> Course</label>
                            <select class="form-select" id="courseId" name="courseId">
                                <option value="">Select a course</option>
                                <%
                                    CourseDAO courseDAO = new CourseDAO();
                                    List<Course> courses = courseDAO.getAllCourses();
                                    for (Course course : courses) {
                                %>
                                    <option value="<%= course.getId() %>" <%= (course.getId() == rs.getInt("course_id")) ? "selected" : "" %>><%= course.getCourseName() %></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg"><i class="bi bi-check-circle"></i> Update Student</button>
                            <a href="allStudents.jsp" class="btn btn-secondary btn-lg"><i class="bi bi-x-circle"></i> Cancel</a>
                        </div>
                    </form>
                    <%
                        } else {
                            out.println("<div class='alert alert-danger' role='alert'><i class='bi bi-exclamation-triangle'></i> Student not found.</div>");
                        }
                        rs.close();
                        pstmt.close();
                        dbConnector.closeConnection();
                    %>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-light text-center text-lg-start mt-5">
        <div class="container p-4">
            <p class="text-center text-muted mb-0">© 2024 NextGen. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>