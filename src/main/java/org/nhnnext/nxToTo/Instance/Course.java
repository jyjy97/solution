package org.nhnnext.nxToTo.Instance;

import javax.persistence.*;
import java.util.List;

/**
 * Created By Alek
 * Date: 11/23/13
 * Project: NEXToTo
 * Package: org.nhnnext.nxToTo.Instance
 */

@Entity
public class Course {

	public Course() {

	}

	public Course(String courseName, String courseNumber, String courseProfessor, String courseTime, String courseLocation, String courseType, int courseLevel, int courseGrade) {
		this.courseName = courseName;
		this.courseNumber = courseNumber;
		this.courseProfessor = courseProfessor;
		this.courseTime = courseTime;
		this.courseLocation = courseLocation;
		this.courseType = courseType;
		this.courseLevel = courseLevel;
		this.courseGrade = courseGrade;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@OneToMany(mappedBy = "course", fetch = FetchType.EAGER)
	private List<Survey> surveys;

	@Column(length = 20, nullable = false)
	private String courseName;
	@Column(length = 20, nullable = false)
	private String courseMajor;
	@Column(length = 20, nullable = false)
	private String courseNumber;
	@Column(length = 20, nullable = false)
	private String courseProfessor;
	@Column(length = 20, nullable = false)
	private String courseTime;
	@Column(length = 20, nullable = false)
	private String courseLocation;
	@Column(length = 20, nullable = false)
	private String courseType;
	@Column(length = 20, nullable = false)
	private int courseLevel;
	@Column(length = 20, nullable = false)
	private int courseGrade;
	@Column(length = 3, nullable = false)
	private int coursePoint;

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseMajor() {
		return courseMajor;
	}

	public void setCourseMajor(String courseMajor) {
		this.courseMajor = courseMajor;
	}

	public String getCourseNumber() {
		return courseNumber;
	}

	public void setCourseNumber(String courseNumber) {
		this.courseNumber = courseNumber;
	}

	public String getCourseProfessor() {
		return courseProfessor;
	}

	public void setCourseProfessor(String courseProfessor) {
		this.courseProfessor = courseProfessor;
	}

	public String getCourseTime() {
		return courseTime;
	}

	public void setCourseTime(String courseTime) {
		this.courseTime = courseTime;
	}

	public String getCourseLocation() {
		return courseLocation;
	}

	public void setCourseLocation(String courseLocation) {
		this.courseLocation = courseLocation;
	}

	public String getCourseType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	public int getCourseLevel() {
		return courseLevel;
	}

	public void setCourseLevel(int courseLevel) {
		this.courseLevel = courseLevel;
	}

	public int getCourseGrade() {
		return courseGrade;
	}

	public void setCourseGrade(int courseGrade) {
		this.courseGrade = courseGrade;
	}

	public int getCoursePoint() {
		return coursePoint;
	}

	public void setCoursePoint(int coursePoint) {
		this.coursePoint = coursePoint;
	}
}
