package com.zhyonk.MyBlog;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.mail.iap.Response;
import com.zhyonk.entity.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "/blog/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) {
		model.addAttribute("user", new User());
		return "/admin/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Validated User user, BindingResult bindingResult, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PrintWriter writer = null;

		try {
			
			writer = response.getWriter();
			if (bindingResult.hasErrors()) {
				writer.println("/admin/login");
				return "/admin/login";
			}
			// 使用权限工具进行用户登录，登录成功后跳到shiro配置的successUrl中，与下面的return没什么关系！
			SecurityUtils.getSubject().login(new UsernamePasswordToken(username, password));
			writer.println("/admin/index");
			HttpSession session=request.getSession();
			session.setAttribute("flag", "1");
			return "/admin/index";
		} catch (AuthenticationException e) {
			System.out.println("密码错了啊");
			HttpSession session = request.getSession();
			session.setAttribute("flag", "0");
			return "admin/login";
		}
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		return "/blog/index";
	}
}
