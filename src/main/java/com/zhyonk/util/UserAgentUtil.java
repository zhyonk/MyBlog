package com.zhyonk.util;

import org.apache.commons.lang3.StringUtils;

import com.zhyonk.entity.UserAgent;

/**
 * @author Defonds
 */
public class UserAgentUtil {

	/**
	 * 用途：根据客户端 User Agent Strings 判断其浏览器、操作平台 if 判断的先后次序：
	 * 根据设备的用户使用量降序排列，这样对于大多数用户来说可以少判断几次即可拿到结果： >>操作系统:Windows > 苹果 > 安卓 > Linux
	 * > ... >>Browser:Chrome > FF > IE > ...
	 * 
	 * @param userAgentStr
	 * @return
	 */
	public static void main(String[] args) {
		UserAgent userAgent = getUserAgent(
				"Mozilla/5.0 (iPhone; CPU iPhone OS 10_2_1 like Mac OS X; zh-CN) AppleWebKit/537.51.1 (KHTML, like Gecko) CriOS/23.0.1271.100 Mobile/14D27 Safari/7534.48.3 UCBrowser/11.4.9.940  AliApp(TUnionSDK/0.1.15)");
		System.out.println(userAgent);
	}

	public static UserAgent getUserAgent(String userAgent) {
		if (StringUtils.isBlank(userAgent)) {
			return null;
		}

		if (userAgent.contains("Windows")) {// 主流应用靠前
			if (userAgent.contains("Windows NT 6.2")) {// Windows 8
				return judgeBrowser(userAgent, "Windows", "8", null);// 判断浏览器
			} else if (userAgent.contains("Windows NT 6.1")) {// Windows 7
				return judgeBrowser(userAgent, "Windows", "7", null);
			} else if (userAgent.contains("Windows NT 6.0")) {// Windows Vista
				return judgeBrowser(userAgent, "Windows", "Vista", null);
			} else if (userAgent.contains("Windows NT 5.2")) {// Windows XP x64
																// Edition
				return judgeBrowser(userAgent, "Windows", "XP", "x64 Edition");
			} else if (userAgent.contains("Windows NT 5.1")) {// Windows XP
				return judgeBrowser(userAgent, "Windows", "XP", null);
			} else if (userAgent.contains("Windows NT 5.01")) {// Windows 2000,
																// Service Pack
																// 1 (SP1)
				return judgeBrowser(userAgent, "Windows", "2000", "SP1");
			} else if (userAgent.contains("Windows NT 5.0")) {// Windows 2000
				return judgeBrowser(userAgent, "Windows", "2000", null);
			} else if (userAgent.contains("Windows NT 4.0")) {// Microsoft
																// Windows NT
																// 4.0
				return judgeBrowser(userAgent, "Windows", "NT 4.0", null);
			} else if (userAgent.contains("Windows 98; Win 9x 4.90")) {// Windows
																		// Millennium
																		// Edition
																		// (Windows
																		// Me)
				return judgeBrowser(userAgent, "Windows", "ME", null);
			} else if (userAgent.contains("Windows 98")) {// Windows 98
				return judgeBrowser(userAgent, "Windows", "98", null);
			} else if (userAgent.contains("Windows 95")) {// Windows 95
				return judgeBrowser(userAgent, "Windows", "95", null);
			} else if (userAgent.contains("Windows CE")) {// Windows CE
				return judgeBrowser(userAgent, "Windows", "CE", null);
			}
		} else if (userAgent.contains("Mac OS X")) {
			if (userAgent.contains("iPod")) {
				return judgeBrowser(userAgent, "iPod", null, null);// 判断浏览器
			}
		} 
		if (userAgent.contains("iPhone")) {
			return judgeBrowser(userAgent, "iPhone", null, null);// 判断浏览器
		}
		if (userAgent.contains("Android")) {
			return judgeBrowser(userAgent, "Android", null, null);// 判断浏览器
		}
		return null;
	}

	/**
	 * 用途：根据客户端 User Agent Strings 判断其浏览器 if 判断的先后次序：
	 * 根据浏览器的用户使用量降序排列，这样对于大多数用户来说可以少判断几次即可拿到结果： >>Browser:Chrome > FF > IE >
	 * ...
	 * 
	 * @param userAgent:user
	 *            agent
	 * @param platformType:平台
	 * @param platformSeries:系列
	 * @param platformVersion:版本
	 * @return
	 */
	private static UserAgent judgeBrowser(String userAgent, String platformType, String platformSeries,
			String platformVersion) {
		if (userAgent.contains("MQQBrowser")) {
			String temp = userAgent.substring(userAgent.indexOf("MQQBrowser/")+11);

			String ffVersion = null;
			if (temp.indexOf(" ") < 0) {// temp形如"16.0.1"
				ffVersion = temp;
			} else {// temp形如"16.0.1 Gecko/20121011"
				ffVersion = temp.substring(0, temp.indexOf(" "));
			}
			return new UserAgent("MQQBrowser", ffVersion, platformType, platformSeries, platformVersion);
		}
		if (userAgent.contains("Chrome")) {
			String temp = userAgent.substring(userAgent.indexOf("Chrome/") + 7);// 拿到User
																				// Agent
																				// String
																				// "Chrome/"
																				// 之后的字符串,结果形如"24.0.1295.0
																				// Safari/537.15"或"24.0.1295.0"
			String chromeVersion = null;
			if (temp.indexOf(" ") < 0) {// temp形如"24.0.1295.0"
				chromeVersion = temp;
			} else {// temp形如"24.0.1295.0 Safari/537.15"
				chromeVersion = temp.substring(0, temp.indexOf(" "));
			}
			return new UserAgent("Chrome", chromeVersion, platformType, platformSeries, platformVersion);
		} else if (userAgent.contains("Firefox")) {
			String temp = userAgent.substring(userAgent.indexOf("Firefox/") + 8);// 拿到User
																					// Agent
																					// String
																					// "Firefox/"
																					// 之后的字符串,结果形如"16.0.1
																					// Gecko/20121011"或"16.0.1"
			String ffVersion = null;
			if (temp.indexOf(" ") < 0) {// temp形如"16.0.1"
				ffVersion = temp;
			} else {// temp形如"16.0.1 Gecko/20121011"
				ffVersion = temp.substring(0, temp.indexOf(" "));
			}
			return new UserAgent("Firefox", ffVersion, platformType, platformSeries, platformVersion);
		} else if (userAgent.contains("MSIE")) {
			if (userAgent.contains("MSIE 10.0")) {// Internet Explorer 10
				return new UserAgent("Internet Explorer", "10", platformType, platformSeries, platformVersion);
			} else if (userAgent.contains("MSIE 9.0")) {// Internet Explorer 9
				return new UserAgent("Internet Explorer", "9", platformType, platformSeries, platformVersion);
			} else if (userAgent.contains("MSIE 8.0")) {// Internet Explorer 8
				return new UserAgent("Internet Explorer", "8", platformType, platformSeries, platformVersion);
			} else if (userAgent.contains("MSIE 7.0")) {// Internet Explorer 7
				return new UserAgent("Internet Explorer", "7", platformType, platformSeries, platformVersion);
			} else if (userAgent.contains("MSIE 6.0")) {// Internet Explorer 6
				return new UserAgent("Internet Explorer", "6", platformType, platformSeries, platformVersion);
			}
		} else if (userAgent.contains("UCBrowser")) {
			
			String temp = userAgent.substring(userAgent.indexOf("UCBrowser/")+10);

			String ffVersion = null;
			if (temp.indexOf(" ") < 0) {// temp形如"16.0.1"
				ffVersion = temp;
			} else {// temp形如"16.0.1 Gecko/20121011"
				ffVersion = temp.substring(0, temp.indexOf(" "));
			}
			return new UserAgent("UCBrowser", ffVersion, platformType, platformSeries, platformVersion);
		} 
		else {// 暂时支持以上三个主流.其它浏览器,待续...
			return new UserAgent("other", null, platformType, platformSeries, platformVersion);
		}

		return null;
	}
}
