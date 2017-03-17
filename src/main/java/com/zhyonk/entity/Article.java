package com.zhyonk.entity;

import java.sql.Timestamp;

public class Article {
	/**
	 * 文章主键
	 */
	private int article_id;
	/**
	 * 作者
	 */
	private String author;
	
	/**
	 * 文章图片存放路径
	 */
	private String img_src;

	/**
	 * 文章标题
	 */
	private String title;
	/**
	 * 文章简略信息
	 */
	private String outline;
	/**
	 * 最后操作文章时间
	 */
	private Timestamp date;

	/**
	 * 文章内容
	 */
	private String content;

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getImg_src() {
		return img_src;
	}

	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOutline() {
		return outline;
	}

	public void setOutline(String outline) {
		this.outline = outline;
	}


	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
