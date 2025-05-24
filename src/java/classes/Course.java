package classes;

public class Course {
    private int id;
    private String courseName;
    private String lectureName;

    public Course(int id, String courseName, String lectureName) {
        this.id = id;
        this.courseName = courseName;
        this.lectureName = lectureName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getLectureName() {
        return lectureName;
    }

    public void setLectureName(String lectureName) {
        this.lectureName = lectureName;
    }
}