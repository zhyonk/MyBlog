
package com.zhyonk.serviceImpl;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.aspectj.util.CollectionUtil;
import org.springframework.cglib.core.CollectionUtils;
import org.springframework.stereotype.Service;

import com.zhyonk.dao.VisitorDao;
import com.zhyonk.entity.DayVisitorCount;
import com.zhyonk.entity.IpPosition;
import com.zhyonk.entity.ProviceCount;
import com.zhyonk.entity.UserAgent;
import com.zhyonk.entity.Visitor;
import com.zhyonk.entity.VisitorCount;
import com.zhyonk.entity.VisitorIpCount;
import com.zhyonk.service.VisitorService;
import com.zhyonk.util.IpAddressUtils;
import com.zhyonk.util.TimeUtils;
@Service("visitorService")
public class VisitorServiceImpl implements VisitorService {
	
	@Resource
	private VisitorDao visitorDao;
	
	/**
	 * 写入访问日志
	 */
	@Override
	public void addVisitorLog(UserAgent userAgent, String remoteAddr, String requestURL) {
		IpPosition ipObj = IpAddressUtils.getPosition(remoteAddr);
		visitorDao.addVisitorLog(remoteAddr,ipObj.getCountry(),ipObj.getProvince(),ipObj.getCity(),new Timestamp(Calendar.getInstance().getTime().getTime()),userAgent.getBrowserType(),userAgent.getPlatformType(),requestURL);
	}

	@Override
	public List<Visitor> getVisitorData() {
		
		List<Visitor> list = visitorDao.getVisitorData();
		return list;
	}

	@Override
	public List<VisitorCount> getVisitorCount() {
		List<VisitorCount> list = visitorDao.getVisitorCount();
		return list;
	}

	@Override
	public List<VisitorIpCount> getVisitorIpCount() {
		List<VisitorIpCount> list = visitorDao.getVisitorIpCount();
		return list;
	}

	@Override
	public List<ProviceCount> getProviceCount() {
		List<ProviceCount> list = visitorDao.getProviceCount();
		return list;
	}

	@Override
	public List<DayVisitorCount> getTenDaysVisitorLog() {
		List<DayVisitorCount> list = new ArrayList<DayVisitorCount>();
		//今天
		Date nowDate = new Date();
		
		for (int i = 1; i <= 10; i++) {
			String dateBefore = TimeUtils.getDateBefore(nowDate, i);
			DayVisitorCount log = visitorDao.getTenDaysVisitorLog(dateBefore);
			if(log.getDay()==null){
				log.setDay(dateBefore);
			}
			list.add(log);
		}
		return list;
	}
}
