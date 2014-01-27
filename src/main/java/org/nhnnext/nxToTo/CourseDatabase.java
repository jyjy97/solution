package org.nhnnext.nxToTo;

import org.springframework.data.repository.CrudRepository;

/**
 * Created By Jinwoo Kim, Yongheon Yoo
 */

public interface CourseDatabase extends CrudRepository<Course, Long> {
	Course findBycourseNumber(String number);
}
