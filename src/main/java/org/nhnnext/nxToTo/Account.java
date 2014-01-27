package org.nhnnext.nxToTo;

import javax.persistence.*;
import java.util.List;

/**
 * Created By Jinwoo Kim, Yonghyeon Yoo
 */

@Entity
public class Account {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
	private List<Survey> surveys;

	public Account() {

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

	public List<Survey> getSurveys() {
		return surveys;
	}

	public int getStudentNumber() {
		return studentNumber;
	}

	public int getStudentGrade() {
		return studentGrade;
	}

	public String getStudentWhy() {
		return studentWhy;
	}

	public String getStudentMajor() {
		return studentMajor;
	}
}
