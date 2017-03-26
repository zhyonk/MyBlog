package com.zhyonk.serviceImpl;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mysql.jdbc.MysqlDataTruncation;
import com.zhyonk.dao.ArticleDao;
import com.zhyonk.dao.MailDao;
import com.zhyonk.dao.VisitorDao;
import com.zhyonk.entity.Article;
import com.zhyonk.entity.ArticleType;
import com.zhyonk.entity.Carousel;
import com.zhyonk.entity.MailAccount;
import com.zhyonk.service.ArticleService;
import com.zhyonk.service.VisitorService;
import com.zhyonk.util.MailUtils;


@Service("articleServiceImpl")
public class ArticleServiceImpl implements ArticleService {
	@Resource
	private ArticleDao articleDao;
	
	@Resource
	private MailDao mailDao;
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
	public void postArticle(String title, String smalltitle, String text1, String text2,String img_src,Timestamp date,String type_id,String flag) throws MysqlDataTruncation {
		boolean b = Boolean.parseBoolean(flag);
		//如果通知
		if(b){
			noticeAll(title);
		//不通知
		}
		articleDao.postArticle(title, smalltitle, text1, text2, img_src, date, Integer.parseInt(type_id));
	}
	/**
	 * 通知所有订阅的用户
	 * @param title 文章标题啊
	 */
	private void noticeAll(String title) {
		List<MailAccount> allEmailAccount = mailDao.getAllEmailAccount();
		for (MailAccount mailAccount : allEmailAccount) {
			MailUtils.sendMail(mailAccount.getAccount(),"震惊！我又新的文章发布。。","额，我发布了一篇《"+title+"》" );
		}
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
	@Override 
	public void delArticleById(String article_id) {
		articleDao.delArticleById(article_id);
	}
	@Override
	public void editArticle(String id, String title, String smalltitle, String text1, String img_src, Timestamp date,
			String type_id) {
		articleDao.editArticle(Integer.parseInt(id),title,smalltitle,text1,img_src,date,Integer.parseInt(type_id));
	}

}
