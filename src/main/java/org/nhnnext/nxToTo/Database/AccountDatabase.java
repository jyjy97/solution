package org.nhnnext.nxToTo.Database;

import org.nhnnext.nxToTo.Instance.Account;
import org.springframework.data.repository.CrudRepository;

/**
 * Created By Alek
 * Date: 11/22/13
 * Project: NEXToTo
 * Package: org.nhnnext.nxToTo.Database
 */

public interface AccountDatabase extends CrudRepository <Account, Long> {
	Account findBystudentNumber(int studentNumber);
}
