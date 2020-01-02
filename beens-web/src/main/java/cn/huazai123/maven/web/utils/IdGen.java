package cn.huazai123.maven.web.utils;

import java.util.UUID;

/**
 * ID������
 * 
 * @author pyh
 *
 */
public class IdGen {

	public static String uuid() {
		String uuids[] = UUID.randomUUID().toString().split("-");
		StringBuilder stringBuilder = new StringBuilder();
		for (int i = 0; i < uuids.length; i++) {
			stringBuilder.append(uuids[i]);
		}

		return stringBuilder.toString();
	}
}
