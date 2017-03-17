package com.zhyonk.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import com.alibaba.fastjson.JSON;
import com.zhyonk.entity.IpPosition;

public class IpAddressUtils {

	public static void main(String[] args) {
		System.out.println(getPosition("223.104.15.211").getCity());
	}

	/**
	 * 获取IP对应的位置
	 * 
	 * @param string
	 * @return
	 */
	public static IpPosition getPosition(String ip) {
		String strurl = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=" + ip;
		BufferedReader in = null;
		String result = "";
		IpPosition ipPosition = null;
		try {
			URL url = new URL(strurl);

			URLConnection connection = url.openConnection();

			connection.connect();

			in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));

			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
			ipPosition = getJson(result);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return ipPosition;
	}
	/**
	 * 获取对应的IpPosition对象
	 * @param result IpPosition对象
	 * @return
	 */
	private static IpPosition getJson(String result) {
		IpPosition ipPosition;
		if(result.contains("-3")){
			return new IpPosition();
		}
		String str = "";
		String strJson = result.substring(result.indexOf("{"), result.indexOf("}") + 1);
		System.out.println(strJson);
		if (strJson.contains("\"ret\":1")) {
			System.out.println("能查到的ip");
			ipPosition = JSON.parseObject(strJson, IpPosition.class);
		} else {
			ipPosition = JSON.parseObject(strJson, IpPosition.class);
			ipPosition.setCountry("中国");
			ipPosition.setProvince("本地");
			ipPosition.setCity("局域网");
		}

		return ipPosition;
	}

}
