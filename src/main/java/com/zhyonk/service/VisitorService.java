package com.zhyonk.service;

import java.util.List;

import com.zhyonk.entity.ProviceCount;
import com.zhyonk.entity.UserAgent;
import com.zhyonk.entity.Visitor;
import com.zhyonk.entity.VisitorCount;
import com.zhyonk.entity.VisitorIpCount;

public interface VisitorService {
	/**
	 * 添加访问信息
	 * @param userAgent
	 * @param requestURL 
	 * @param remoteAddr 
	 */
	void addVisitorLog(UserAgent userAgent, String remoteAddr, String requestURL);
	/**
	 * 获取访客数据
	 * @return 
	 */
	List<Visitor> getVisitorData();
	/**
	 * 获取浏览器统计数据
	 * @return
	 */
	List<VisitorCount> getVisitorCount();
	/**
	 * 获取访客的访问量
	 * @return
	 */
	List<VisitorIpCount> getVisitorIpCount();
	/**
	 * 获取每个省份的访客量
	 * @return
	 */
	List<ProviceCount> getProviceCount();

}
