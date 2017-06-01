package com.model;

public class Bc implements java.io.Serializable{

	private int id;
	private String title;
	private String da;
	private Integer subjectInfo;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Bc() {
	}
	public String getDa() {
		return da;
	}
	public void setDa(String da) {
		this.da = da;
	}

	public Integer getSubjectInfo() {
		return subjectInfo;
	}

	public void setSubjectInfo(Integer subjectInfo) {
		this.subjectInfo = subjectInfo;
	}
}
