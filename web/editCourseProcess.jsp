<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="classes.Course, classes.CourseDAO" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
String courseName = request.getParameter("courseName");
String lectureName = request.getParameter("lectureName");

Course updatedCourse = new Course(id, courseName, lectureName);
CourseDAO courseDAO = new CourseDAO();
courseDAO.updateCourse(updatedCourse);

response.sendRedirect("adminDashbord.jsp");
%>