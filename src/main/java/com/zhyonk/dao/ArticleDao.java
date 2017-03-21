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
	/**
	 * 修改轮播数据
	 * @param id
	 * @param big_title
	 * @param small_title
	 * @param img_src
	 * @param link
	 */
	public void editCarousel(@Param("id")int id, @Param("big_title")String big_title,@Param("small_title") String small_title, @Param("img_src")String img_src, @Param("link")String link);

}
