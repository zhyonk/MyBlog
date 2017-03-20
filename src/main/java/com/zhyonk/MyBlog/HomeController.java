package com.zhyonk.MyBlog;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletRequest;

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
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/blog/index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) {
		model.addAttribute("user",new User());
		return "/admin/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Validated User user,BindingResult bindingResult,ServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
        try {  
            if(bindingResult.hasErrors()){  
                return "/admin/login";  
            }  
            //使用权限工具进行用户登录，登录成功后跳到shiro配置的successUrl中，与下面的return没什么关系！  
            SecurityUtils.getSubject().login(new UsernamePasswordToken(username, password));  
            request.setAttribute("msg", "success");
            return "/admin/index"; 
        } catch (AuthenticationException e) {  
            return "//login";  
        } 
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		return "/blog/index";
	}
}
