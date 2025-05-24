<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Course | NextGen</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <style>
            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                background-color: #f8f9fa;
            }
            .navbar-brand img {
                transition: transform 0.3s ease-in-out;
            }
            .navbar-brand:hover img {
                transform: scale(1.1);
            }
            .form-container {
                background-color: white;
                border-radius: 15px;
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
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
                            <a class="nav-link" href="adminDashbord.jsp"><i class="bi bi-house-door"></i> Dashboard</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="form-container p-5">
                        <h2 class="text-center mb-4"><i class="bi bi-plus-circle"></i> Add New Course</h2>
                        <form action="addCourseProcess.jsp" method="post">
                            <div class="mb-3">
                                <label for="courseName" class="form-label">Course Name</label>
                                <input type="text" class="form-control" id="courseName" name="courseName" required>
                            </div>
                            <div class="mb-3">
                                <label for="lectureName" class="form-label">Lecture Name</label>
                                <input type="text" class="form-control" id="lectureName" name="lectureName" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg"><i class="bi bi-plus-lg"></i> Add Course</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <footer class="bg-light text-center text-lg-start mt-auto">
            <div class="container p-4">
                <p class="text-center text-muted mb-0">© 2024 NextGen. All rights reserved.</p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>