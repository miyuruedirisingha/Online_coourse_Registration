<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="classes.Course, classes.CourseDAO" %>
<%
String courseName = request.getParameter("courseName");
String lectureName = request.getParameter("lectureName");

Course newCourse = new Course(0, courseName, lectureName);
CourseDAO courseDAO = new CourseDAO();
courseDAO.addCourse(newCourse);

response.sendRedirect("adminDashbord.jsp");
%>