package com.zhyonk.serviceImpl;

import java.sql.Timestamp;
import java.util.Calendar;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhyonk.dao.MailDao;
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
	}

}