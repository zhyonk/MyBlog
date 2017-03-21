package com.zhyonk.dao;


import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhyonk.entity.FeedBack;


public interface MailDao {
	/**
	 * 添加需要文章推送的账号
	 * @return
	 */
	public void addMailAccount( @Param("account")String account,@Param("time")Timestamp time);
	/**
	 * 记录发送邮件日志
	 * @param account
	 * @param string
	 * @param string2
	 */
	public void addMailLog (@Param("account")String account,@Param("subject")String subject,@Param("text")String text,@Param("time")Timestamp time);
	/**
	 * 给反馈者发邮件
	 * @param account
	 * @param suggestion 
	 * @param type 
	 * @param @Param("email") 
	 * @param time
	 */
	public void addFeedBack( @Param("name")String name, @Param("email")String email,  @Param("type")String type,  @Param("suggestion")String suggestion, @Param("time")Timestamp time);
	/**
	 * 获取反馈列表
	 * @return
	 */
	public List<FeedBack> getAllFeedBack();
}