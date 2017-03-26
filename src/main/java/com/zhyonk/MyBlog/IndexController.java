package com.zhyonk.MyBlog;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.zhyonk.entity.Article;
import com.zhyonk.entity.ArticleType;
import com.zhyonk.entity.Carousel;
import com.zhyonk.entity.Message;
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
		
		 SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		for (Article article : articlelist) {
			article.setStrDate(format.format(article.getDate()));
		}
		try {
			response.getWriter().println(JSONArray.toJSON(articlelist));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/getArticleType", method = RequestMethod.GET)
	public void getArticleType(ServletRequest request, ServletResponse response){
		response.setCharacterEncoding("utf-8");
		List<ArticleType> articlelist = articleService.getArticleType();
		
		try {
			response.getWriter().println(JSONArray.toJSON(articlelist));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value = "/postArticle", method = RequestMethod.POST)
	public void postArticle(ServletRequest request, ServletResponse response) throws UnsupportedEncodingException, ParseException{
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String text1 = request.getParameter("text1");
		String text2 = request.getParameter("text2");
		String smalltitle = request.getParameter("smalltitle");
		String strdate = request.getParameter("date");
		String img_src = request.getParameter("path");
		
		Timestamp date = new Timestamp(Long.parseLong(strdate));
		articleService.postArticle(title,smalltitle,text1,text2,img_src,date);
		
		try {
			response.getWriter().println(JSONArray.toJSON(new Message("文章发布成功", "1")));
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
	
	@RequestMapping(value = "/addArticleType", method = RequestMethod.POST)
	public void addArticleType(ServletRequest request, ServletResponse response){
		response.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		
		articleService.addArticleType(name);
		try {
			response.getWriter().println(JSONArray.toJSON(new Message("success", "1")));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/editCarousel", method = RequestMethod.POST)
	public void editCarousel(ServletRequest request, ServletResponse response){
		Carousel car = new Carousel();
		int carStr = Integer.parseInt(request.getParameter("id"));
		String big_title = request.getParameter("big_title");
		String small_title = request.getParameter("small_title");
		String img_src = request.getParameter("img_src");
		String link = request.getParameter("link");
		car.setId(carStr);
		car.setBig_title(big_title);
		car.setSmall_title(small_title);
		car.setImg_src(img_src);
		car.setLink(link);
		response.setCharacterEncoding("utf-8");
		articleService.editCarousel(car);
		try {
			response.getWriter().println(JSONArray.toJSON(new Message("成功","success")));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/delArticleType", method = RequestMethod.POST)
	public void delArticleType(ServletRequest request, ServletResponse response){
		String data = request.getParameter("data");
		response.setCharacterEncoding("utf-8");
		List<ArticleType> parseArray = JSONArray.parseArray(data, ArticleType.class);
		
		articleService.delArticleType(parseArray);
		try {
			response.getWriter().println(JSONArray.toJSON(new Message("成功","success")));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/delArticleById", method = RequestMethod.POST)
	public void delArticleById(ServletRequest request, ServletResponse response){
		String article_id = request.getParameter("article_id");
		response.setCharacterEncoding("utf-8");
		
		articleService.delArticleById(article_id);
		try {
			response.getWriter().println(JSONArray.toJSON(new Message("成功","success")));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	 @RequestMapping(value = "/articleImgUpdate")  
	    public void fileUpload(MultipartFile file,HttpServletRequest request,ServletResponse response) {  
	        // 判断文件是否为空  
	        if (!file.isEmpty()) {  
	            try {  
	                // 文件保存路径  
	                String filePath = "c:/MyBlog/images/"  
	                        + file.getOriginalFilename();  
	                File targetFile = new File(filePath);
	                if(!targetFile.exists()){
	                	targetFile.mkdir();
	                }
	                // 转存文件  
	                file.transferTo(targetFile);  
	            	response.getWriter().println(JSONArray.toJSON(new Message("成功","../pic/"+file.getOriginalFilename())));
	            } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        }  
	        // 重定向  
	    }  
}
