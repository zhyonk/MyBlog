package com.zhyonk.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeUtils {
	/**
	 * 得到几天前的时间
	 * 
	 * @param d
	 * @param day
	 * @return
	 */
	public static String getDateBefore(Date d, int day) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) - day);
		SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd");  
		String formatTime = format.format(now.getTime());
		return formatTime;
	}
}
