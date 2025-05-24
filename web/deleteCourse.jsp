<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="classes.CourseDAO" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
CourseDAO courseDAO = new CourseDAO();
courseDAO.deleteCourse(id);
response.sendRedirect("adminDashbord.jsp");
%>