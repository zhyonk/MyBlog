package com.zhyonk.entity;

import java.sql.Date;
import java.sql.Timestamp;

public class Visitor {
	public String getStrTime() {
		return strTime;
	}
	public void setStrTime(String strTime) {
		this.strTime = strTime;
	}
	private int log_id;
	private String ip;
	private Timestamp time;
	private String strTime;
	private String provice;
	public String getProvice() {
		return provice;
	}
	public void setProvice(String provice) {
		this.provice = provice;
	}
	private String borwser_Type;
	private String platformType;
	private String link;
	
	
	public Visitor() {
		super();
	}
	public Visitor(int log_id, String ip, Timestamp time, String provice, String borwser_Type, String platformType,
			String link) {
		super();
		this.log_id = log_id;
		this.ip = ip;
		this.time = time;
		this.provice = provice;
		this.borwser_Type = borwser_Type;
		this.platformType = platformType;
		this.link = link;
	}
	public int getLog_id() {
		return log_id;
	}
	public void setLog_id(int log_id) {
		this.log_id = log_id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getBorwser_Type() {
		return borwser_Type;
	}
	public void setBorwser_Type(String borwser_Type) {
		this.borwser_Type = borwser_Type;
	}
	public String getPlatformType() {
		return platformType;
	}
	public void setPlatformType(String platformType) {
		this.platformType = platformType;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
}
