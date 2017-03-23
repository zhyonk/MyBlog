package com.zhyonk.MyBlog;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONArray;
import com.zhyonk.entity.FeedBack;
import com.zhyonk.entity.Message;
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

	@RequestMapping(value = "/sendFeedbackEmail", method = RequestMethod.POST)
	public void se1(ServletRequest request, ServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String type = request.getParameter("type");
		String suggestion = request.getParameter("suggestion");
		MailService.sendFeedBackEmail(email);
		MailService.addFeedBackInfo(name,email,type,suggestion);
		try {
			response.getWriter().println("反馈成功了");
		} catch (IOException e) {
			response.getWriter().println("由于某些不可描述原因，反馈失败了");
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/getAllFeedback", method = RequestMethod.GET)
	public void getFeedBack(ServletRequest request, ServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		List<FeedBack> list= MailService.getAllFeedBack();
		try {
			response.getWriter().println(JSONArray.toJSON(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/sengMailToAll", method = RequestMethod.GET)
	public void sengMailToAll(ServletRequest request, ServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		MailService.sengMailToAll(MailService.getAllEmailAccount(), "测试一下", "正文");
		
		try {
			response.getWriter().println(JSONArray.toJSON(new Message("成功发送", "1")));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
