package org.nhnnext.nxToTo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;
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
		Iterator<Survey> iterator1 = surveyDatabase.findAll().iterator();
		ArrayList<Survey> surveys = new ArrayList<Survey>();
		while(iterator1.hasNext()) {
			Survey targetSurvey = iterator1.next();
			surveys.add(targetSurvey);
		}

		Iterator<Course> iterator2 = courseDatabase.findAll().iterator();
		ArrayList<Course> courses = new ArrayList<Course>();
		while(iterator2.hasNext()) {
			Course targetCourse = iterator2.next();
			courses.add(targetCourse);
		}

		for (Course course : courses) {
			course.calcCourseResult();
		}

		model.addAttribute("surveys", surveys);
		model.addAttribute("courses", courses);
		return "admin_showAllSurveys";
	}

	@RequestMapping(value = "importCSV.do")
	public String importCSVAction() throws IOException {
		ArrayList<String[]> strings = CSVControl.reader();
		for (String[] node : strings) {
			Course course = new Course(node[6], node[4], node[7], node[8], node[9], node[2], Integer.parseInt(node[3]), node[1], node[0], Integer.parseInt(node[5]));
			courseDatabase.save(course);
		}

		return "redirect:/solutionAdminPage/showAllSurveys";
	}
}
