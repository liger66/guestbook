package com.inc.vo;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class BookVo {
	private int id;
	
	@Size(min=4, max=10, message="비밀번호는 2 ~ 10 ")
	private String password;
	
	@NotEmpty(message="내용을 입력 하세")
	private String msg;
	
	@Pattern(regexp="[가-힣]{2,5}", message="한글로 2 ~5 글자로 입력 하셔.")
	private String writer;
	private String ip;
	private String writedate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	
	
}
