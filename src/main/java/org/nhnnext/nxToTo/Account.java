package org.nhnnext.nxToTo;

import javax.persistence.*;
import java.util.List;

/**
 * Created By Alek
 * Date: 11/22/13
 * Project: NEXToTo
 * Package: org.nhnnext.nxToTo.Instance
 */

@Entity
public class Account {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
	private List<Survey> surveys;


	Account() {

	}

	public Account(int studentNumber, int studentGrade, String studentMajor, String studentWhy) {
		this.studentNumber = studentNumber;
		this.studentGrade = studentGrade;
		this.studentMajor = studentMajor;
		this.studentWhy = studentWhy;
	}

	@Column(length=20, nullable = false)
	private int studentNumber;

	@Column(length=20, nullable = false)
	private int studentGrade;

	@Column(length=20, nullable = false)
	private String studentMajor;

	@Column(length=20, nullable = false)
	private String studentWhy;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<Survey> getSurveys() {
		return surveys;
	}

	public void setSurveys(List<Survey> surveys) {
		this.surveys = surveys;
	}

	public int getStudentNumber() {
		return studentNumber;
	}

	public void setStudentNumber(int studentNumber) {
		this.studentNumber = studentNumber;
	}

	public int getStudentGrade() {
		return studentGrade;
	}

	public void setStudentGrade(int studentGrade) {
		this.studentGrade = studentGrade;
	}

	public String getStudentMajor() {
		return studentMajor;
	}

	public void setStudentMajor(String studentMajor) {
		this.studentMajor = studentMajor;
	}

	public String getStudentWhy() {
		return studentWhy;
	}

	public void setStudentWhy(String studentWhy) {
		this.studentWhy = studentWhy;
	}
}
