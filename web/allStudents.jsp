<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List, classes.User, classes.DbConnector, classes.CourseDAO, classes.Course, java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar-brand img {
            transition: transform 0.3s ease-in-out;
        }
        .navbar-brand:hover img {
            transform: scale(1.1);
        }
        .table-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
     <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="pngwing.com.png" alt="Logo" width="50" height="50" class="d-inline-block align-text-top me-2">
                <span class="fs-4 fw-bold">NextGen</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="adminDashbord.jsp"> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="allStudents.jsp"> Students</a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp"><i class="bi bi-box-arrow-in-right"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h2 class="text-center mb-4">Student List</h2>
        <div class="table-container p-4">
            <table class="table table-hover">
                <thead class="table-light">
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Course</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        DbConnector dbConnector = new DbConnector();
                        Connection conn = dbConnector.getConnection();
                        String query = "SELECT u.*, c.course_name FROM users u LEFT JOIN courses c ON u.course_id = c.id WHERE u.role = 'student'";
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(query);

                        while(rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getString("first_name") %></td>
                            <td><%= rs.getString("last_name") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("course_name") != null ? rs.getString("course_name") : "No course assigned" %></td>
                            <td>
                                <a href="editStudent.jsp?id=<%= rs.getInt("id") %>" class="btn btn-outline-primary btn-sm"><i class="bi bi-pencil"></i> Edit</a>
                                <button class="btn btn-outline-danger btn-sm" onclick="confirmDelete(<%= rs.getInt("id") %>, '<%= rs.getString("first_name") %> <%= rs.getString("last_name") %>')">
                                    <i class="bi bi-trash"></i> Delete
                                </button>
                            </td>
                        </tr>
                    <%
                        }
                        rs.close();
                        stmt.close();
                        dbConnector.closeConnection();
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this student?
                    <p class="fw-bold mt-2" id="studentName"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <a href="#" id="deleteLink" class="btn btn-danger">Delete</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function confirmDelete(id, name) {
            document.getElementById('studentName').textContent = name;
            document.getElementById('deleteLink').href = 'deleteStudent.jsp?id=' + id;
            var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
            deleteModal.show();
        }
    </script>
</body>
</html>