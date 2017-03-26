package com.zhyonk.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.mysql.jdbc.MysqlDataTruncation;
import com.zhyonk.entity.Article;
import com.zhyonk.entity.ArticleType;
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
	/**
	 * 编辑信息
	 * @param car 
	 */
	public void editCarousel(Carousel car);
	/**
	 * 发布文章啊
	 * @param title 标题
	 * @param smalltitle 小标题 
	 * @param text1	带标签的内容
	 * @param text2   纯文字内容
	 * @param img_src 图片位置
	 * @param date  客户端的点发布的发布时间
	 * @param type_id 类别id
	 * @param flag 是否通知订阅的人
	 * @throws MysqlDataTruncation 就是文本内容有点长的时候报错
	 */
	public void postArticle(String title, String smalltitle, String text1, String text2, String img_src, Timestamp date, String type_id, String flag) throws MysqlDataTruncation;
	
	/**
	 * 获取所有的文章类型
	 * @return
	 */
	public List<ArticleType> getArticleType();
	/**
	 * 添加新的标签
	 * @param name
	 * @return
	 */
	public void addArticleType(String name);
	/**
	 * 删除的列
	 * @param parseArray
	 */
	public void delArticleType(List<ArticleType> parseArray);
	/**
	 * 根据id删除文章
	 * @param article_id
	 */
	public void delArticleById(String article_id);
	/**
	 * 编辑文章并保存
	 * @param id
	 * @param title
	 * @param smalltitle
	 * @param text1
	 * @param img_src
	 * @param date
	 * @param type_id
	 */
	public void editArticle(String id, String title, String smalltitle, String text1, String img_src, Timestamp date,
			String type_id);
	
}
