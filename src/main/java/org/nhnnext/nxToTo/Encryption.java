package org.nhnnext.nxToTo;

/**
 * Created By Alek
 * Date: 11/22/13
 * Project: NEXToTo
 * Package: org.nhnnext.nxToTo.Encryption
 */

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryption {
	public static String SHA1encryption(String passwd) {
		byte[] byteArray = passwd.getBytes();

		MessageDigest md = null;

		try {
			md = MessageDigest.getInstance("SHA1");
		} catch (NoSuchAlgorithmException e) { e.printStackTrace(); }

		if (md == null)
			return null;

		md.reset();
		md.update(byteArray);

		byte digest[] = md.digest();

		StringBuffer stringBuffer = new StringBuffer();

		for (int i = 0 ; i < digest.length ; i++) {
			stringBuffer.append(Integer.toHexString(0xFF & digest[i]));
		}

		return stringBuffer.toString();
	}
}
