package org.nhnnext.nxToTo;

import au.com.bytecode.opencsv.CSVReader;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created By Alek
 * Date: 1/26/14
 * Project: PreCourseEnrollment
 * Package: org.nhnnext.nxToTo.Instance
 */

public class CSVControl {
	CSVControl() {

	}

	public static ArrayList<String[]> reader() throws IOException {
		CSVReader reader = new CSVReader(new FileReader("/work/list.csv"));
		String[] nextLine;
		ArrayList<String[]> strings = new ArrayList<String[]>();

		while (((nextLine = reader.readNext()) != null)) {
			strings.add(nextLine);
		}

		return strings;
	}
}
