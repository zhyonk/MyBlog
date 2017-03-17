package com.zhyonk.filter;

import java.io.IOException;


import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.context.support.XmlWebApplicationContext;

import com.zhyonk.entity.UserAgent;
import com.zhyonk.service.VisitorService;
import com.zhyonk.util.UserAgentUtil;

public class VisitorsFilter implements Filter{
	
	private VisitorService visitorService;
	
	@Override
	public void destroy() {
			
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		//访问者访问的完整URL
		String requestURL =new String(httpServletRequest.getRequestURL());
		String user_agent = httpServletRequest.getHeader("User-Agent");
		//访问者IP地址
		String remoteAddr = httpServletRequest.getRemoteAddr();
		System.out.println("URL: "+requestURL);
		System.out.println(remoteAddr);
		System.out.println(user_agent);
		//返回浏览器类型数据
		UserAgent userAgent = UserAgentUtil.getUserAgent(user_agent);
		visitorService.addVisitorLog(userAgent,remoteAddr,requestURL);
		
		filterChain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		ServletContext servletContext = filterConfig.getServletContext();
		XmlWebApplicationContext cxt = (XmlWebApplicationContext) WebApplicationContextUtils.getWebApplicationContext(servletContext);
		if(cxt != null && cxt.getBean("visitorService") != null && visitorService == null)
			visitorService = (VisitorService) cxt.getBean("visitorService");        
	}

}
