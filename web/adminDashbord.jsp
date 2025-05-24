<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="classes.Course, classes.CourseDAO, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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
        .card {
            transition: box-shadow 0.3s ease-in-out;
        }
        .card:hover {
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }
        .btn-action {
            transition: transform 0.2s ease-in-out;
        }
        .btn-action:hover {
            transform: translateY(-2px);
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
                        <a class="nav-link active" href="adminDashbord.jsp"><i class="bi bi-house-door"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="allStudents.jsp"><i class="bi bi-people"></i> Students</a>
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
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="mb-0">Manage Courses</h2>
            <a href="addCourse.jsp" class="btn btn-primary btn-action">
                <i class="fas fa-plus me-2"></i>Add Course
            </a>
        </div>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <%
            CourseDAO courseDAO = new CourseDAO();
            List<Course> courses = courseDAO.getAllCourses();
            for (Course course : courses) {
            %>
            <div class="col">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title"><%= course.getCourseName() %></h5>
                        <p class="card-text"><strong>Lecturer:</strong> <%= course.getLectureName() %></p>
                    </div>
                    <div class="card-footer bg-transparent border-top-0">
                        <a href="editCourse.jsp?id=<%= course.getId() %>" class="btn btn-outline-primary btn-sm btn-action me-2">
                            <i class="fas fa-edit me-1"></i>Edit
                        </a>
                        <a href="deleteCourse.jsp?id=<%= course.getId() %>" class="btn btn-outline-danger btn-sm btn-action">
                            <i class="fas fa-trash me-1"></i>Delete
                        </a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <footer class="bg-light text-center py-3 mt-5">
        <div class="container">
            <p class="mb-0">&copy; 2024 NextGen. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>