package org.nhnnext.nxToTo;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created By Jinwoo Kim, Yonghyeon Yoo
 */

@Entity
public class Course {

	public Course() {

	}

	public Course(String courseName, String courseNumber, String courseProfessor, String courseTime, String courseLocation, String courseType, int courseLevel, String courseGrade, String courseMajor, int coursePoint) {
		this.courseName = courseName;
		this.courseNumber = courseNumber;
		this.courseProfessor = courseProfessor;
		this.courseTime = courseTime;
		this.courseLocation = courseLocation;
		this.courseType = courseType;
		this.courseLevel = courseLevel;
		this.courseGrade = courseGrade;
		this.courseMajor = courseMajor;
		this.coursePoint = coursePoint;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@OneToMany(mappedBy = "course", fetch = FetchType.EAGER)
	private List<Survey> surveys;

	@Column(length = 100, nullable = false)
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
	private String courseGrade;
	@Column(length = 3, nullable = false)
	private int coursePoint;

	private int NumofTotalStudent;

	private int NumofSecondGradeStudent;
	private int NumofThirdGradeStudent;
	private int NumofFourthGradeStudent;

	private int NumofMainMajorStudent;
	private int NumofMultiMajorStudent;
	private int NumofPartMajorStudent;
	private int NumofOtherStudent;

	public void calcCourseResult() {
		setNumofTotalStudent(0);

		setNumofSecondGradeStudent(0);
		setNumofThirdGradeStudent(0);
		setNumofFourthGradeStudent(0);

		setNumofMainMajorStudent(0);
		setNumofMultiMajorStudent(0);
		setNumofPartMajorStudent(0);
		setNumofOtherStudent(0);

		int secondGrade = 0;
		int thirdGrade = 0;
		int fourthGrade = 0;

		int mainMajor = 0;
		int multiMajor = 0;
		int partMajor = 0;
		int otherMajor = 0;

		List<Survey> surveys = getSurveys();
		ArrayList<Account> accounts = new ArrayList<Account>();
		for (Survey survey : surveys) {
			accounts.add(survey.getAccount());
		}

		setNumofTotalStudent(accounts.size());

		for (Account account : accounts) {
			if (account.getStudentGrade()==2)
				secondGrade++;
			else if (account.getStudentGrade()==3)
				thirdGrade++;
			else if (account.getStudentGrade()==4)
				fourthGrade++;

			if (account.getStudentWhy().equals("main"))
				mainMajor++;
			else if (account.getStudentWhy().equals("multi"))
				multiMajor++;
			else if (account.getStudentWhy().equals("part"))
				partMajor++;
			else if (account.getStudentWhy().equals("other"))
				otherMajor++;
		}

		setNumofSecondGradeStudent(secondGrade);
		setNumofThirdGradeStudent(thirdGrade);
		setNumofFourthGradeStudent(fourthGrade);

		setNumofMainMajorStudent(mainMajor);
		setNumofMultiMajorStudent(multiMajor);
		setNumofPartMajorStudent(partMajor);
		setNumofOtherStudent(otherMajor);
	}

	public int getNumofTotalStudent() {
		return NumofTotalStudent;
	}

	void setNumofTotalStudent(int numofTotalStudent) {
		NumofTotalStudent = numofTotalStudent;
	}

	public int getNumofSecondGradeStudent() {
		return NumofSecondGradeStudent;
	}

	public void setNumofSecondGradeStudent(int numofSecondGradeStudent) {
		NumofSecondGradeStudent = numofSecondGradeStudent;
	}

	public int getNumofThirdGradeStudent() {
		return NumofThirdGradeStudent;
	}

	public void setNumofThirdGradeStudent(int numofThirdGradeStudent) {
		NumofThirdGradeStudent = numofThirdGradeStudent;
	}

	public int getNumofFourthGradeStudent() {
		return NumofFourthGradeStudent;
	}

	public void setNumofFourthGradeStudent(int numofFourthGradeStudent) {
		NumofFourthGradeStudent = numofFourthGradeStudent;
	}

	public int getNumofMainMajorStudent() {
		return NumofMainMajorStudent;
	}

	public void setNumofMainMajorStudent(int numofMainMajorStudent) {
		NumofMainMajorStudent = numofMainMajorStudent;
	}

	public int getNumofMultiMajorStudent() {
		return NumofMultiMajorStudent;
	}

	public void setNumofMultiMajorStudent(int numofMultiMajorStudent) {
		NumofMultiMajorStudent = numofMultiMajorStudent;
	}

	public int getNumofPartMajorStudent() {
		return NumofPartMajorStudent;
	}

	public void setNumofPartMajorStudent(int numofPartMajorStudent) {
		NumofPartMajorStudent = numofPartMajorStudent;
	}

	public int getNumofOtherStudent() {
		return NumofOtherStudent;
	}

	public void setNumofOtherStudent(int numofOtherStudent) {
		NumofOtherStudent = numofOtherStudent;
	}

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

	public String getCourseGrade() {
		return courseGrade;
	}

	public void setCourseGrade(String courseGrade) {
		this.courseGrade = courseGrade;
	}

	public int getCoursePoint() {
		return coursePoint;
	}

	public void setCoursePoint(int coursePoint) {
		this.coursePoint = coursePoint;
	}

	public List<Survey> getSurveys() {
		return surveys;
	}
}
