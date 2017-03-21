package com.zhyonk.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhyonk.dao.ArticleDao;
import com.zhyonk.entity.Article;
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

}
