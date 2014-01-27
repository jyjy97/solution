package org.nhnnext.nxToTo;

import org.springframework.data.repository.CrudRepository;

/**
 * Created By Jinwoo Kim, Yonghyeon Yoo
 */

public interface AccountDatabase extends CrudRepository <Account, Long> {
	Account findBystudentNumber(int studentNumber);
}
