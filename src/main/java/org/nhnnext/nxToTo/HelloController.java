package org.nhnnext.nxToTo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;

/**
* Created By Alek
* Date: 11/22/13
* Project: NEXToTo
* Package: org.nhnnext.nxToTo
*/

@Controller
@RequestMapping("/")
public class HelloController {
	@Autowired
	private AccountDatabase accountDatabase;
	@Autowired
	private CourseDatabase courseDatabase;
	@Autowired
	private SurveyDatabase surveyDatabase;

	@RequestMapping(value = "")
	public String mainPage() {
		return "hello";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginAction(int identification, int grade, String major, String why, HttpSession httpSession) {
		try {
			Account targetAccount = accountDatabase.findBystudentNumber(identification);
			httpSession.setAttribute("identification", targetAccount.getStudentNumber());
			httpSession.setAttribute("major", targetAccount.getStudentMajor());
			return "redirect:/enrollment";
		} catch (NullPointerException e) {
			Account newAccount = new Account(identification, grade, major, why);
			accountDatabase.save(newAccount);
			httpSession.setAttribute("identification", newAccount.getStudentNumber());
			return "redirect:/enrollment";
		}
	}

	@RequestMapping(value = "enrollment")
	public String enrollmentPage(Model model, HttpSession httpSession) {
		if (httpSession.getAttribute("identification")==null)
			return "redirect:/";
		else {
			Iterator<Course> iterator = courseDatabase.findAll().iterator();
			ArrayList<Course> courses_korean = new ArrayList<Course>();
			ArrayList<Course> courses_business = new ArrayList<Course>();
			ArrayList<Course> courses_psy = new ArrayList<Course>();

			while (iterator.hasNext()) {
				Course course = iterator.next();
				if (course.getCourseMajor().equals("국어국문학과"))
					courses_korean.add(course);
				else if (course.getCourseMajor().equals("경영학과"))
					courses_business.add(course);
				else if (course.getCourseMajor().equals("심리학과"))
					courses_psy.add(course);
			}

			model.addAttribute("courses_korean", courses_korean);
			model.addAttribute("courses_business", courses_business);
			model.addAttribute("courses_psy", courses_psy);

			return "enrollment";
		}
	}

	@RequestMapping(value = "submit", params = {"firstCourse", "secondCourse", "thirdCourse"})
	public @ResponseBody String submitPage(@RequestParam(value="firstCourse") String firstCourse,
										   @RequestParam(value="secondCourse") String secondCourse,
										   @RequestParam(value="thirdCourse") String thirdCourse,
										   HttpSession httpSession) {
		if (httpSession.getAttribute("identification")==null)
			return "redirect:/";
		else {
			Account targetAccount = accountDatabase.findBystudentNumber(Integer.parseInt(String.valueOf(httpSession.getAttribute("identification"))));
			if (firstCourse == secondCourse || secondCourse == thirdCourse || thirdCourse == firstCourse) {
				return "redirect:/enrollment";
			} else {

				if (!firstCourse.equals("null")) {
					surveyDatabase.save(new Survey(targetAccount, courseDatabase.findBycourseNumber(firstCourse)));
				}
				if (!secondCourse.equals("null")) {
					surveyDatabase.save(new Survey(targetAccount, courseDatabase.findBycourseNumber(secondCourse)));
				}
				if (!thirdCourse.equals("null")) {
					surveyDatabase.save(new Survey(targetAccount, courseDatabase.findBycourseNumber(thirdCourse)));
				}
			}

			return "complete";
		}
	}
}

