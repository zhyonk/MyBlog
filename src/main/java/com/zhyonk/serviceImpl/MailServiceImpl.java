package com.zhyonk.serviceImpl;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhyonk.dao.MailDao;
import com.zhyonk.entity.FeedBack;
import com.zhyonk.service.MailService;
import com.zhyonk.util.MailUtils;

@Service("mailService")
public class MailServiceImpl implements MailService {
	
	@Resource
	private MailDao mailDao;
	
	@Override
	public void sendVisitorEmail(String account) {
		mailDao.addMailAccount(account,new Timestamp(Calendar.getInstance().getTime().getTime()));
		MailUtils.sendMail(account,"哦了,朕知道你的邮箱了","恩，目前也就这样了，等朕的消息吧");
		mailDao.addMailLog(account,"哦了,朕知道你的邮箱了","恩，目前也就这样了，等朕的消息吧",new Timestamp(Calendar.getInstance().getTime().getTime()));
	}

	@Override
	public void sendFeedBackEmail(String account) {
		//将反馈者信息添加到数据库
		MailUtils.sendMail(account,"谢谢您的反馈","对我有意见就说出来，不要憋坏了，反正我也不会听的");
		mailDao.addMailLog(account,"谢谢您的反馈","对我有意见就说出来，不要憋坏了，反正我也不会听的",new Timestamp(Calendar.getInstance().getTime().getTime()));
	}

	@Override
	public void addFeedBackInfo(String name, String email, String type, String suggestion) {
		mailDao.addFeedBack(name, email,type,suggestion,new Timestamp(Calendar.getInstance().getTime().getTime()));
	}

	@Override
	public List<FeedBack> getAllFeedBack() {
		List<FeedBack> list = mailDao.getAllFeedBack();
		return list;
	}

}