package com.lzx.convert;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;
import org.springframework.util.StringUtils;
/**
 * 类型转换器
 * @author liqingkun7
 *
 */
public class String2DateConvert implements Converter<String, Date> {
	private static final String DATE_LONG = "yyyy-MM-dd HH:mm:ss";
	private static final String DATE_PATTERN = "yyyy-MM-dd HH:mm";
	private static final String DATE_SHORT = "yyyy-MM-dd";

	@Override
	public Date convert(String source) {
		SimpleDateFormat sdf = null;
		if (!StringUtils.isEmpty(source)) {

			if (source.length() == DATE_LONG.length()) {
				sdf = new SimpleDateFormat(DATE_LONG);
			} else if (source.length() == DATE_PATTERN.length()) {
				sdf = new SimpleDateFormat(DATE_PATTERN);
			}
			if (source.length() == DATE_SHORT.length()) {
				sdf = new SimpleDateFormat(DATE_SHORT);
			}
			try {
				return sdf.parse(source);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
