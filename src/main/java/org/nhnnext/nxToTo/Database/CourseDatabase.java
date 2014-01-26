package org.nhnnext.nxToTo.Database;

import org.nhnnext.nxToTo.Instance.Course;
import org.springframework.data.repository.CrudRepository;

/**
 * Created By Alek
 * Date: 11/24/13
 * Project: NEXToTo
 * Package: org.nhnnext.nxToTo.Database
 */

public interface CourseDatabase extends CrudRepository<Course, Long> {
	Course findBycourseNumber(String number);
}
