package com.zhyonk.MyBlog;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zhyonk.service.MailService;

/**
 * 访客控制
 */
@Controller
public class MailController {
	
	@Resource(name="mailService")
	private MailService MailService;
	
	@RequestMapping(value = "/sendVisitorEmail", method = RequestMethod.GET)
	public void se(ServletRequest request, ServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		
		String account = request.getParameter("account");
		MailService.sendVisitorEmail(account);
		try {
			response.getWriter().println("订阅成功了");
		} catch (IOException e) {
			response.getWriter().println("由于某些不可描述原因，订阅失败了");
			e.printStackTrace();
		}
	}
}
