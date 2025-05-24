<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="classes.User, classes.DbConnector" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    DbConnector dbConnector = new DbConnector();
    User user = new User();
    user.setEmail(username);
    user.setPassword(password);
    if (user.login(dbConnector)) {
        session.setAttribute("user", user);
        String role = user.getRole();
        if ("admin".equals(role)) {
            response.sendRedirect("adminDashbord.jsp");
        } else if ("student".equals(role)) {
            response.sendRedirect("studentDashbord.jsp");
        }
    } else {
        request.setAttribute("error", "Invalid username or password");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>