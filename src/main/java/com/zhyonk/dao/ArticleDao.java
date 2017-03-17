package com.zhyonk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhyonk.entity.Article;
import com.zhyonk.entity.Carousel;
public interface ArticleDao {
	/**
	 * 获取所有的文章列表信息
	 * @return
	 */
	public List<Article> getAllArticle();
	/**
	 * 根据id获取文章
	 * @param article_id 
	 * @return
	 */
	public Article getArticleById(@Param("id") String article_id);
	/**
	 * 获取轮播内容
	 * @return
	 */
	public List<Carousel> getCarousel();

}
