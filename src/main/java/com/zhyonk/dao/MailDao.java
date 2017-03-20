package com.zhyonk.dao;


import java.sql.Timestamp;

import org.apache.ibatis.annotations.Param;


public interface MailDao {
	/**
	 * 添加需要文章推送的账号
	 * @return
	 */
	public void addMailAccount( @Param("account")String account,@Param("time")Timestamp time);
}