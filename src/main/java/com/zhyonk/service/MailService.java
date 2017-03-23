package com.zhyonk.service;

import java.util.List;

import org.apache.shiro.authc.Account;

import com.zhyonk.entity.FeedBack;
import com.zhyonk.entity.MailAccount;

public interface MailService {
	/**
	 * 发送邮件
	 * @return
	 */

	void sendVisitorEmail(String account);
	
	/**
	 * 给反馈者发送邮件
	 * @param account
	 */
	void sendFeedBackEmail(String account);

	/**
	 * 将反馈者信息添加到数据库
	 * @param name
	 * @param email
	 * @param type
	 * @param suggestion
	 */
	void addFeedBackInfo(String name,String email,String type,String suggestion);
	/**
	 * 获取反馈列表
	 * @return	所有反馈的列表
	 */
	List<FeedBack> getAllFeedBack();
	/**
	 * 获取所有订阅的人的邮箱
	 * @return 
	 */
	List<MailAccount> getAllEmailAccount();
	
	/**
	 * 给所有订阅的人发邮件
	 * @param account	所有人邮箱账号
	 * @param subject	标题
	 * @param text		内容
	 */
	void sengMailToAll(List<MailAccount> account,String subject,String text);
}
