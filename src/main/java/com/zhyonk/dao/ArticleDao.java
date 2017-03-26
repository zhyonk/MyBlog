package com.zhyonk.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhyonk.entity.Article;
import com.zhyonk.entity.ArticleType;
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
	/**
	 * 发布文章啊
	 * @param title 标题
	 * @param smalltitle 小标题 
	 * @param text1	带标签的内容
	 * @param text2   纯文字内容
	 * @param date  客户端的点发布的发布时间
	 * @param i 
	 */
	public void postArticle(@Param("title")String title, @Param("smalltitle")String smalltitle, @Param("text1")String text1, @Param("text2")String text2,@Param("img_src")String img_src, @Param("date")Timestamp date, @Param("type_id")int type_id);
	/**
	 * 获取所有的文章类型
	 * @return
	 */
	public List<ArticleType> getArticleType();
	/**
	 * 添加分类名称
	 * @param name
	 */
	public void addArticleType(@Param("name")String name);
	/**
	 * 要删除的ID
	 * @param id
	 */
	public void delArticleType(@Param("id")int id);
	/**
	 * 
	 * @param article_id
	 */
	public void delArticleById(@Param("article_id")String article_id);
	
	public void editArticle(@Param("id")int id,@Param("title")String title, @Param("smalltitle")String smalltitle, @Param("text1")String text1,@Param("img_src")String img_src, @Param("date")Timestamp date, @Param("type_id")int type_id );

}
