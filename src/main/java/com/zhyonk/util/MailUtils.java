package com.zhyonk.util;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import com.zhyonk.dao.MailDao;
import com.zhyonk.entity.MailAccount;

public class MailUtils {
	/**
	 * 单发邮件
	 * @param account
	 * @param subject
	 * @param text
	 */
	public static void sendMail(String account,String subject,String text) {
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
		// 设定mail server
		senderImpl.setHost("smtp.163.com");

		// 建立邮件消息
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		// 设置收件人，寄件人 用数组发送多个邮件
		// String[] array = new String[] {"sun111@163.com","sun222@sohu.com"};
		// mailMessage.setTo(array);
		mailMessage.setTo(account);
		mailMessage.setFrom("zhyonkblog@163.com");
		mailMessage.setSubject(subject);
		mailMessage.setText(text);
		senderImpl.setUsername("zhyonkblog@163.com"); // 根据自己的情况,设置username
		senderImpl.setPassword("zyk331520"); // 根据自己的情况, 设置password
		Properties prop = new Properties();
		prop.put("mail.smtp.auth", "true"); // 将这个参数设为true，让服务器进行认证,认证用户名和密码是否正确
		prop.put("mail.smtp.timeout", "25000");
		senderImpl.setJavaMailProperties(prop);
		// 发送邮件
		senderImpl.send(mailMessage);
		System.out.println("向"+account+"邮件发送成功.. ");
	}
	/**
	 * 群发邮件
	 * @param account
	 * @param subject
	 * @param text
	 * @param mailDao 
	 */
	public static void sendMails(List<MailAccount> account,String subject,String text, MailDao mailDao) {
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
		// 设定mail server
		senderImpl.setHost("smtp.163.com");

		// 建立邮件消息
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		// 设置收件人，寄件人 用数组发送多个邮件
		// String[] array = new String[] {"sun111@163.com","sun222@sohu.com"};
		// mailMessage.setTo(array);
		int size = account.size();
		String accStr[] = new String[size];
		for (int i = 0; i < size ; i++) {
			String account2 = account.get(i).getAccount();
			System.out.println(account2);
			accStr[i] = account2;
			mailDao.addMailLog(account2,subject,text,new Timestamp(Calendar.getInstance().getTime().getTime()));
			System.out.println("向"+account2+"发送邮件成功.. ");
		}
		mailMessage.setTo(accStr);
		mailMessage.setFrom("zhyonkblog@163.com");
		mailMessage.setSubject(subject);
		mailMessage.setText(text);
		senderImpl.setUsername("zhyonkblog@163.com"); // 根据自己的情况,设置username
		senderImpl.setPassword("zyk331520"); // 根据自己的情况, 设置password
		Properties prop = new Properties();
		prop.put("mail.smtp.auth", "true"); // 将这个参数设为true，让服务器进行认证,认证用户名和密码是否正确
		prop.put("mail.smtp.timeout", "25000");
		senderImpl.setJavaMailProperties(prop);
		// 发送邮件
		senderImpl.send(mailMessage);
		System.out.println("群发完毕");
	}
	
}
