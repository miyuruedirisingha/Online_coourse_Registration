<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="classes.User, classes.DbConnector, classes.Course, classes.CourseDAO, java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NextGen Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #9a616d;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        .registration-container {
            max-width: 800px;
            margin: auto;
            padding: 2rem;
            background-color: #ffffff;
            border-radius: 1rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }
        .form-control, .form-select {
            border-radius: 0.5rem;
        }
        .btn-primary {
            background-color: black;
            border-color: #007bff;
            border-radius: 0.5rem;
            padding: 0.5rem 2rem;
            font-weight: bold;
        }
        .btn-primary:hover {
            background-color: #424649;
            border-color: #0056b3;
        }
        .logo {
            max-width: 100px;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="registration-container">
            <div class="text-center mb-4">
                <img src="pngwing.com.png" alt="NextGen Logo" class="logo">
                <h2 class="mb-3">Join NextGen</h2>
                <p class="text-muted">Embark on your learning journey with us</p>
            </div>
            <form action="register.jsp" method="post">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="inputFirstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="inputFirstName" name="firstName" required>
                    </div>
                    <div class="col-md-6">
                        <label for="inputLastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="inputLastName" name="lastName" required>
                    </div>
                    <div class="col-md-6">
                        <label for="inputEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="inputEmail" name="email" required>
                    </div>
                    <div class="col-md-6">
                        <label for="inputPhone" class="form-label">Phone Number</label>
                        <input type="tel" class="form-control" id="inputPhone" name="phone" required>
                    </div>
                    <div class="col-md-6">
                        <label for="inputDOB" class="form-label">Date of Birth</label>
                        <input type="date" class="form-control" id="inputDOB" name="dob" required>
                    </div>
                    <div class="col-md-6">
                        <label for="inputAddress" class="form-label">Address</label>
                        <input type="text" class="form-control" id="inputAddress" name="address" required>
                    </div>
                    <div class="col-md-6">
                        <label for="inputCourse" class="form-label">Course</label>
                        <select id="inputCourse" class="form-select" name="course" required>
                            <option value="">Choose...</option>
                            <%
                                CourseDAO courseDAO = new CourseDAO();
                                List<Course> courses = courseDAO.getAllCourses();
                                for (Course course : courses) {
                            %>
                                <option value="<%= course.getId() %>"><%= course.getCourseName() %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="inputPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="inputPassword" name="password" required>
                    </div>
                    <div class="col-12 mt-4">
                        <button type="submit" class="btn btn-primary w-100">Register</button>
                    </div>
                </div>
            </form>
            <div class="mt-4 text-center">
                <p>Already have an account? <a href="login.jsp">Log in</a></p>
            </div>
            
            <%
                if (request.getMethod().equalsIgnoreCase("POST")) {
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    String phone = request.getParameter("phone");
                    String dob = request.getParameter("dob");
                    String address = request.getParameter("address");
                    String role = "student";
                    int courseId = Integer.parseInt(request.getParameter("course"));

                    User user = new User(firstName, lastName, email, password, phone, dob, address, role, courseId);
                    DbConnector dbConnector = new DbConnector();
                    boolean registrationSuccess = user.register(dbConnector);

                    if (registrationSuccess) {
                        out.println("<div class='alert alert-success mt-3'>Registration successful! Redirecting to login page...</div>");
                        response.setHeader("Refresh", "3;url=login.jsp");
                    } else {
                        out.println("<div class='alert alert-danger mt-3'>Registration failed. Please try again.</div>");
                    }
                }
            %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>