package org.nhnnext.nxToTo;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created By Jinwoo Kim, Yonghyeon Yoo
 */

@Controller
@RequestMapping("/")
public class HelloController {
	@Autowired
	ReCaptchaImpl reCaptcha;

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
	public String loginAction(int identification, int grade, String major, String why, HttpSession httpSession,
							  String recaptcha_challenge_field, String recaptcha_response_field, String remoteAddress) {

		ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
		reCaptcha.setPrivateKey("6LcTsu0SAAAAAETYICm55vPzqT0VQ0rwzofYTvhY");

		ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddress, recaptcha_challenge_field, recaptcha_response_field);

		if (reCaptchaResponse.isValid()) {
			try {
				Account targetAccount = accountDatabase.findBystudentNumber(identification);
				httpSession.setAttribute("identification", targetAccount.getStudentNumber());
				httpSession.setAttribute("status", "duplicate");
				return "redirect:/loginCheck?status=duplicate";
			} catch (NullPointerException e) {
				httpSession.setAttribute("identification", identification);
				httpSession.setAttribute("grade", grade);
				httpSession.setAttribute("major", major);
				httpSession.setAttribute("why", why);
				httpSession.setAttribute("status", "ok");
				return "redirect:/loginCheck?status=ok";
			}
		} else {
			return "redirect:/loginCheck?status=auto";
		}


	}

	@RequestMapping(value = "loginCheck")
	public String loginCheckPage() {
		return "loginCheck";
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
			ArrayList<Course> courses_money = new ArrayList<Course>();
			ArrayList<Course> courses_untong = new ArrayList<Course>();
			ArrayList<Course> courses_jungchi = new ArrayList<Course>();
			ArrayList<Course> courses_social = new ArrayList<Course>();
			ArrayList<Course> courses_press = new ArrayList<Course>();
			ArrayList<Course> courses_business = new ArrayList<Course>();

			while (iterator.hasNext()) {
				Course course = iterator.next();
				if (course.getCourseMajor().equals("국어국문학과"))
					courses_korean.add(course);
				else if (course.getCourseMajor().equals("심리학"))
					courses_psy.add(course);
				else if (course.getCourseMajor().equals("철학"))
					courses_chulhak.add(course);
				else if (course.getCourseMajor().equals("경제학과"))
					courses_money.add(course);
				else if (course.getCourseMajor().equals("응용통계학과"))
					courses_untong.add(course);
				else if (course.getCourseMajor().equals("정치외교학과"))
					courses_jungchi.add(course);
				else if (course.getCourseMajor().equals("사회학과"))
					courses_social.add(course);
				else if (course.getCourseMajor().equals("언론홍보영상학부"))
					courses_press.add(course);
				else if (course.getCourseMajor().equals("경영학부"))
					courses_business.add(course);
			}

			model.addAttribute("courses_korean", courses_korean);
			model.addAttribute("courses_psy", courses_psy);
			model.addAttribute("courses_chulhak", courses_chulhak);
			model.addAttribute("courses_money", courses_money);
			model.addAttribute("courses_untong", courses_untong);
			model.addAttribute("courses_jungchi", courses_jungchi);
			model.addAttribute("courses_social", courses_social);
			model.addAttribute("courses_press", courses_press);
			model.addAttribute("courses_business", courses_business);

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

			if (firstCourse.equals(secondCourse) || secondCourse.equals(thirdCourse) || thirdCourse.equals(firstCourse)) {
				return "redirect:/enrollment";

			} else {
				if (httpSession.getAttribute("status")=="duplicate") {
					List<Survey> surveys = targetAccount.getSurveys();

					for (Survey survey : surveys) {
						surveyDatabase.delete(survey);
					}

					targetAccount = accountDatabase.findBystudentNumber(Integer.parseInt(String.valueOf(httpSession.getAttribute("identification"))));
				} else if (httpSession.getAttribute("status")=="ok") {
					targetAccount = accountDatabase.save(new Account(Integer.parseInt(String.valueOf(httpSession.getAttribute("identification"))), Integer.parseInt(String.valueOf(httpSession.getAttribute("grade"))), String.valueOf(httpSession.getAttribute("major")), String.valueOf(httpSession.getAttribute("why"))));
				}

				if (!firstCourse.equals(" ")) {
					surveyDatabase.save(new Survey(targetAccount, courseDatabase.findBycourseNumber(firstCourse)));
				}
				if (!secondCourse.equals(" ")) {
					surveyDatabase.save(new Survey(targetAccount, courseDatabase.findBycourseNumber(secondCourse)));
				}
				if (!thirdCourse.equals("")) {
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

	@RequestMapping(value = "adminCheck.do")
	public String adminCheck(String pass, HttpSession httpSession) {
		if (pass.equals("제51대총학생회솔루션이한솔27")) {
			httpSession.setAttribute("admin", "true");
			return "redirect:/solutionAdminPage/main";
		}
		else
			return "redirect:/solutionyonsei.ac.kr";
	}

	@RequestMapping(value = "admin")
	public String adminPage() {
		return "admin";
	}
}

