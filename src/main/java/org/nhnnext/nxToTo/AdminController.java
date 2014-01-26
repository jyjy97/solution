package org.nhnnext.nxToTo;

import org.nhnnext.nxToTo.Database.AccountDatabase;
import org.nhnnext.nxToTo.Database.CourseDatabase;
import org.nhnnext.nxToTo.Database.SurveyDatabase;
import org.nhnnext.nxToTo.Instance.Course;
import org.nhnnext.nxToTo.Instance.Survey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * Created By Alek
 * Date: 1/25/14
 * Project: PreCourseEnrollment
 * Package: PACKAGE_NAME
 */

@Controller
@RequestMapping("/solutionAdminPage")
public class AdminController {
	@Autowired
	private AccountDatabase accountDatabase;
	@Autowired
	private CourseDatabase courseDatabase;
	@Autowired
	private SurveyDatabase surveyDatabase;

	@RequestMapping(value = "createCourse")
	public String createCoursePage(Model model) {
		Iterator<Course> iterator = courseDatabase.findAll().iterator();
		ArrayList<Course> courses = new ArrayList<Course>();
		while(iterator.hasNext()) {
			Course targetCourse = iterator.next();
			courses.add(targetCourse);
		}
		model.addAttribute("courses", courses);
		return "admin_createCourses";
	}

	@RequestMapping(value = "createCourse.do", method = RequestMethod.POST)
	public String createCourseAction(Course course) {
		courseDatabase.save(course);
		return "redirect:/solutionAdminPage/createCourse";
	}

	@RequestMapping(value = "showAllSurveys")
	public String surveyResultPage(Model model) {
		Iterator<Survey> iterator = surveyDatabase.findAll().iterator();
		ArrayList<Survey> surveys = new ArrayList<Survey>();
		while(iterator.hasNext()) {
			Survey targetSurvey = iterator.next();
			surveys.add(targetSurvey);
		}
		model.addAttribute("surveys", surveys);
		return "admin_showAllSurveys";
	}
}
