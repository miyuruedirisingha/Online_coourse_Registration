package classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {
    private DbConnector dbConnector;

    public CourseDAO() {
        dbConnector = new DbConnector();
    }

    public List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM courses";

        try (Connection conn = dbConnector.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Course course = new Course(
                    rs.getInt("id"),
                    rs.getString("course_name"),
                    rs.getString("lecture_name")
                );
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courses;
    }

    public void addCourse(Course course) {
        String sql = "INSERT INTO courses (course_name, lecture_name) VALUES (?, ?)";

        try (Connection conn = dbConnector.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, course.getCourseName());
            pstmt.setString(2, course.getLectureName());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Course getCourseById(int id) {
        String sql = "SELECT * FROM courses WHERE id = ?";
        Course course = null;

        try (Connection conn = dbConnector.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                course = new Course(
                    rs.getInt("id"),
                    rs.getString("course_name"),
                    rs.getString("lecture_name")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return course;
    }

    public void updateCourse(Course course) {
        String sql = "UPDATE courses SET course_name = ?, lecture_name = ? WHERE id = ?";

        try (Connection conn = dbConnector.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, course.getCourseName());
            pstmt.setString(2, course.getLectureName());
            pstmt.setInt(3, course.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCourse(int id) {
        String sql = "DELETE FROM courses WHERE id = ?";

        try (Connection conn = dbConnector.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}