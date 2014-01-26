package org.nhnnext.nxToTo.Instance;

import javax.persistence.*;

/**
 * Created By Alek
 * Date: 11/23/13
 * Project: NEXToTo
 * Package: org.nhnnext.nxToTo.Instance
 */

@Entity
public class Survey {

	public Survey() {

	}

	public Survey(Account account, Course course) {
		this.account = account;
		this.course = course;
		studentNumber = account.getStudentNumber();
		courseNumber = course.getCourseNumber();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne
	private Course course;

	public Course getCourse() {
		return course;
	}

	@ManyToOne
	private Account account;

	public Account getAccount() {
		return account;
	}

	@Column(length = 20, nullable = false)
	public int studentNumber;
	@Column(length = 20, nullable = false)
	public String courseNumber;

	public int getStudentNumber() {
		return studentNumber;
	}

	public String getCourseNumber() {
		return courseNumber;
	}

	public void setStudentNumber(int studentNumber) {
		this.studentNumber = studentNumber;
	}

	public void setCourseNumber(String courseNumber) {
		this.courseNumber = courseNumber;
	}
}
