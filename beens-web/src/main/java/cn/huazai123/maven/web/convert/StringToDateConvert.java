package cn.huazai123.maven.web.convert;

import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class StringToDateConvert implements Converter<String, Date> {

	@Override
	public Date convert(String source) {
		System.out.println(source);
		return null;
	}

}
