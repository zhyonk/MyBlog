package com.zhyonk.service;

import java.util.List;

import com.zhyonk.entity.Article;
import com.zhyonk.entity.Carousel;

public interface ArticleService {
	/**
	 * 获取所有的文章列表
	 * @return
	 */
	public List<Article> getAllArticle();
	/**
	 * 通过id获取文章的内容
	 * @param article_id
	 * @return
	 */
	public Article getArticleById(String article_id);
	/**
	 * 获取所有轮播内容
	 * @return
	 */
	public List<Carousel> getCarousel();
	
}
