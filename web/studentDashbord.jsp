<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<%@ page import="classes.User, classes.Course, classes.CourseDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard | NextGen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar-brand img {
            transition: transform 0.3s ease-in-out;
        }
        .navbar-brand:hover img {
            transform: scale(1.1);
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .card-header {
            background-color: #0d6efd;
            color: white;
            border-radius: 15px 15px 0 0 !important;
        }
        .avatar-container {
            position: relative;
            width: 150px;
            height: 150px;
            margin: 0 auto 20px;
            border-radius: 50%;
            overflow: hidden;
            border: 3px solid #0d6efd;
        }
        .avatar-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .avatar-container input[type="file"] {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }
        .table th {
            font-weight: 600;
            color: #495057;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
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
                        <a class="nav-link" href="home.jsp"><i class="bi bi-house-door"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <div class="row g-4">
            <!-- Profile Section -->
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header">
                        <h5 class="mb-0"><i class="bi bi-person-circle"></i> Profile</h5>
                    </div>
                    <div class="card-body">
                        <%
                            User user = (User) session.getAttribute("user");
                            if (user == null) {
                                response.sendRedirect("login.jsp");
                                return;
                            }
                        %>
                        <div class="avatar-container">
                            <img src="images/avatar.jpg" alt="Avatar" id="avatar">
                            <input type="file" id="file-upload" accept="image/*" onchange="previewImage(event)">
                        </div>
                        <h4 class="text-center mb-4"><%= user.getFirstName() %> <%= user.getLastName() %></h4>
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th scope="row"><i class="bi bi-person-badge"></i> Student ID:</th>
                                    <td><%= user.getId() %></td>
                                </tr>
                                <tr>
                                    <th scope="row"><i class="bi bi-envelope"></i> Email:</th>
                                    <td><%= user.getEmail() %></td>
                                </tr>
                                <tr>
                                    <th scope="row"><i class="bi bi-geo-alt"></i> Address:</th>
                                    <td><%= user.getAddress() %></td>
                                </tr>
                                <tr>
                                    <th scope="row"><i class="bi bi-telephone"></i> Mobile Number:</th>
                                    <td><%= user.getPhone() %></td>
                                </tr>
                                <tr>
                                    <th scope="row"><i class="bi bi-calendar"></i> DOB:</th>
                                    <td><%= user.getDob() %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Course Section -->
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header">
                        <h5 class="mb-0"><i class="bi bi-book"></i> Enrolled Course</h5>
                    </div>
                    <div class="card-body">
                        <%
                            User users = (User) session.getAttribute("user");
                            if (users != null) {
                                int courseId = user.getCourseId();
                                CourseDAO courseDAO = new CourseDAO();
                                Course enrolledCourse = courseDAO.getCourseById(courseId);

                                if (enrolledCourse != null) {
                        %>
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th scope="row"><i class="bi bi-journal-text"></i> Course Name:</th>
                                    <td><%= enrolledCourse.getCourseName() %></td>
                                </tr>
                                <tr>
                                    <th scope="row"><i class="bi bi-person-video3"></i> Lecture Name:</th>
                                    <td><%= enrolledCourse.getLectureName() %></td>
                                </tr>
                            </tbody>
                        </table>
                        <%
                            } else {
                        %>
                        <p class="text-muted">No course enrolled.</p>
                        <%
                            }
                        } else {
                        %>
                        <p class="text-muted">User information not available.</p>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-light text-center text-lg-start mt-auto">
        <div class="container p-4">
            <p class="text-center text-muted mb-0">© 2024 NextGen. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function previewImage(event) {
            const reader = new FileReader();
            reader.onload = function () {
                const output = document.getElementById('avatar');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
</body>
</html>