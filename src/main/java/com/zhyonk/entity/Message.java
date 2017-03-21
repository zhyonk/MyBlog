package com.zhyonk.entity;

public class Message {
	private String msg;
	private String status;
	
	public Message() {
		super();
	}
	public Message(String msg, String status) {
		super();
		this.msg = msg;
		this.status = status;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
