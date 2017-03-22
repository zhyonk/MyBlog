
package com.zhyonk.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhyonk.entity.DayVisitorCount;
import com.zhyonk.entity.ProviceCount;
import com.zhyonk.entity.Visitor;
import com.zhyonk.entity.VisitorCount;
import com.zhyonk.entity.VisitorIpCount;

public interface VisitorDao {
	/**
	 * 添加访问日志
	 * @param remoteAddr 访客IP
	 * @param city 访客城市
	 * @param country 访客国家
	 * @param provice 
	 * @param timestamp		    访问时间
	 * @param browserType 浏览器类型
	 * @param platformType 平台类型
	 * @param requestURL  访问完整url
	 */
	public void addVisitorLog(@Param(value="ip")String remoteAddr, @Param(value="country")String country,@Param(value="provice") String provice,@Param(value="city") String city, @Param(value="timestamp")Timestamp timestamp, @Param(value="browserType")String browserType, @Param(value="platformType")String platformType,
			@Param(value="requestURL")String requestURL);
	/**
	 * 获取访客数据
	 * @return
	 */
	public List<Visitor> getVisitorData();
	/**
	 * 获取浏览器统计数据
	 * @return
	 */
	public List<VisitorCount> getVisitorCount();
	/**
	 * 获取访客的访问量
	 * @return
	 */
	public List<VisitorIpCount> getVisitorIpCount();
	/**
	 * 获取每个省份的访客量
	 * @return
	 */
	public List<ProviceCount> getProviceCount();
	/**
	 * 获取从当日起前十天的数据
	 * @param dateBefore 
	 * @return
	 */
	public DayVisitorCount getTenDaysVisitorLog(@Param("dateBefore")String dateBefore);
}
