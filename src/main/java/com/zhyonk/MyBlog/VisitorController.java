package com.zhyonk.MyBlog;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONArray;
import com.zhyonk.entity.DayVisitorCount;
import com.zhyonk.entity.ProviceCount;
import com.zhyonk.entity.Visitor;
import com.zhyonk.entity.VisitorCount;
import com.zhyonk.entity.VisitorIpCount;
import com.zhyonk.service.VisitorService;

/**
 * 访客控制
 */
@Controller
public class VisitorController {
	
	@Resource(name="visitorService")
	private VisitorService visitorService;
	/**
	 * 获取访客数据
	 * @throws IOException 
	 */
	@RequestMapping(value = "/getVisitorData", method = RequestMethod.GET)
	public void getVisitorData(ServletRequest request, ServletResponse response){
		response.setCharacterEncoding("utf-8");
		List<Visitor> visitorlist = visitorService.getVisitorData();
		
		 SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		 
		for (Visitor visitor : visitorlist) {
			visitor.setStrTime(format.format(visitor.getTime()));
		}
		try {
			response.getWriter().println(JSONArray.toJSON(visitorlist));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/getVisitorCount", method = RequestMethod.GET)
	public void getVisitorCount(ServletRequest request, ServletResponse response){
		response.setCharacterEncoding("utf-8");
		List<VisitorCount> visitorlist = visitorService.getVisitorCount();
		try {
			response.getWriter().println(JSONArray.toJSON(visitorlist));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	@RequestMapping(value = "/getProviceCount", method = RequestMethod.GET)
	public void getProviceCount(ServletRequest request, ServletResponse response){
		response.setCharacterEncoding("utf-8");
		List<ProviceCount> visitorlist = visitorService.getProviceCount();
		try {
			response.getWriter().println(JSONArray.toJSON(visitorlist));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/getVisitorIpCount", method = RequestMethod.GET)
	public void getVisitorIpCount(ServletRequest request, ServletResponse response){
		response.setCharacterEncoding("utf-8");
		List<VisitorIpCount> visitorlist = visitorService.getVisitorIpCount();
		try {
			response.getWriter().println(JSONArray.toJSON(visitorlist));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/getTenDaysVisitorLog", method = RequestMethod.GET)
	public void getTenDaysVisitorLog(ServletRequest request, ServletResponse response){
		response.setCharacterEncoding("utf-8");
		List<DayVisitorCount> visitorlist = visitorService.getTenDaysVisitorLog();
		try {
			response.getWriter().println(JSONArray.toJSON(visitorlist));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
