package model;

import java.util.Date;

public class Chat {
	private int num;
	private String id;
	private Date regdate;
	private String content;
	
	
	//getter,setter,toString
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Chat [num=" + num + ", id=" + id + ", regdate=" + regdate + ", content=" + content + "]";
	}
	
	
	
}
