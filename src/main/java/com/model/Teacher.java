package com.model;

public class Teacher implements java.io.Serializable{

	private int id;
	private String userName;
	private String password;
	private int subjectInfo;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Teacher() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getSubjectInfo() {
		return subjectInfo;
	}

	public void setSubjectInfo(int subjectInfo) {
		this.subjectInfo = subjectInfo;
	}
}
