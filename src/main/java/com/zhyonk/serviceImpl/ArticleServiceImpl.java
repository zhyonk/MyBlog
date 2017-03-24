package com.zhyonk.serviceImpl;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhyonk.dao.ArticleDao;
import com.zhyonk.entity.Article;
import com.zhyonk.entity.ArticleType;
import com.zhyonk.entity.Carousel;
import com.zhyonk.service.ArticleService;


@Service("articleServiceImpl")
public class ArticleServiceImpl implements ArticleService {
	@Resource
	private ArticleDao articleDao;
	@Override
	public List<Article> getAllArticle() {
		
		List<Article> list = articleDao.getAllArticle();
		
		return list;
	}
	@Override
	public Article getArticleById(String article_id) {
		Article article = articleDao.getArticleById(article_id);
		return article;
	}
	@Override
	public List<Carousel> getCarousel() {
		List<Carousel> list = articleDao.getCarousel();
		return list;
	}
	@Override
	public void editCarousel(Carousel car) {
		articleDao.editCarousel(car.getId(),car.getBig_title(),car.getSmall_title(),car.getImg_src(),car.getLink());
	}
	@Override
	public void postArticle(String title, String smalltitle, String text1, String text2,String img_src,Timestamp date) {
		// TODO Auto-generated method stub
		articleDao.postArticle(title,smalltitle,text1,text2,img_src,date);
	}
	@Override
	public List<ArticleType> getArticleType() {
		List<ArticleType> list = articleDao.getArticleType();
		return list;
	}
	@Override
	public void addArticleType(String name) {
		articleDao.addArticleType(name);
	}
	@Override
	public void delArticleType(List<ArticleType> list) {
		
		for (ArticleType articleType : list) {
			int id = articleType.getId();
			articleDao.delArticleType(id);
		}
		
	}

}
