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
			ArrayList<Course> courses_psy = new ArrayList<Course>();
			ArrayList<Course> courses_chulhak = new ArrayList<Course>();
			ArrayList<Course> courses_economy = new ArrayList<Course>();
			ArrayList<Course> courses_untong = new ArrayList<Course>();
			ArrayList<Course> courses_jungchi = new ArrayList<Course>();
			ArrayList<Course> courses_social = new ArrayList<Course>();
			ArrayList<Course> courses_press = new ArrayList<Course>();

			while (iterator.hasNext()) {
				Course course = iterator.next();
				if (course.getCourseMajor().equals("국어국문학과"))
					courses_korean.add(course);
				else if (course.getCourseMajor().equals("심리학과"))
					courses_psy.add(course);
				else if (course.getCourseMajor().equals("철학과"))
					courses_chulhak.add(course);
				else if (course.getCourseMajor().equals("경제학과"))
					courses_economy.add(course);
				else if (course.getCourseMajor().equals("응용통계학과"))
					courses_untong.add(course);
				else if (course.getCourseMajor().equals("정치외교학과"))
					courses_jungchi.add(course);
				else if (course.getCourseMajor().equals("사회학과"))
					courses_social.add(course);
				else if (course.getCourseMajor().equals("언론홍보영상학부"))
					courses_press.add(course);
			}

			model.addAttribute("courses_korean", courses_korean);
			model.addAttribute("courses_psy", courses_psy);
			model.addAttribute("courses_chulhak", courses_chulhak);
			model.addAttribute("courses_economy", courses_economy);
			model.addAttribute("courses_untong", courses_untong);
			model.addAttribute("courses_jungchi", courses_jungchi);
			model.addAttribute("courses_social", courses_social);
			model.addAttribute("courses_press", courses_press);

			return "enrollment";
		}
	}

	@RequestMapping(value = "submit", params = {"firstCourse", "secondCourse", "thirdCourse"})
	public String submitPage(@RequestParam(value="firstCourse") String firstCourse,
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

			return "redirect:/complete";
		}



		}
	@RequestMapping(value="complete")
	public String completePage() {
		return "complete";
	}


}

