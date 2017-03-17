package com.zhyonk.MyBlog;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONArray;
import com.zhyonk.entity.Article;
import com.zhyonk.entity.Carousel;
import com.zhyonk.service.ArticleService;

/**
 * 首页控制
 */
@Controller
public class IndexController {
	
	@Resource(name="articleServiceImpl")
	private ArticleService articleService;
	/**
	 * 获取所有的文章列表,返回Json数据
	 * @throws IOException 
	 */
	@RequestMapping(value = "/getAllArticle", method = RequestMethod.GET)
	public void home(ServletRequest request, ServletResponse response){
		response.setCharacterEncoding("utf-8");
		List<Article> articlelist = articleService.getAllArticle();
		try {
			response.getWriter().println(JSONArray.toJSON(articlelist));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value = "/content/id={article_id}", method = RequestMethod.GET)
	public void ReadMore(@PathVariable String article_id, ServletResponse response){
		response.setCharacterEncoding("utf-8");
		Article article = articleService.getArticleById(article_id);
		try {
			response.getWriter().println(JSONArray.toJSON(article));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/getCarousel", method = RequestMethod.GET)
	public void getCarousel(ServletRequest request, ServletResponse response){
		response.setCharacterEncoding("utf-8");
		List<Carousel> list = articleService.getCarousel();
		try {
			response.getWriter().println(JSONArray.toJSON(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
