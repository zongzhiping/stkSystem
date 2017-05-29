package com.model;

public class StuKs implements java.io.Serializable{

	private int id;
	//学号、姓名、性别、学院、专业名称、班级
	private String userNo;
	private String realName;
	private String sex;
	private String xy;
	private String zy;
	private String bj;
	private String title;
	private int kid;
	private int stuid;
	private int fs;
	private int state;//0代表没有阅卷 1 代表自动阅卷结束2 代表半自动阅卷结束
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getStuid() {
		return stuid;
	}
	public void setStuid(int stuid) {
		this.stuid = stuid;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getXy() {
		return xy;
	}
	public void setXy(String xy) {
		this.xy = xy;
	}
	public String getZy() {
		return zy;
	}
	public void setZy(String zy) {
		this.zy = zy;
	}
	public String getBj() {
		return bj;
	}
	public void setBj(String bj) {
		this.bj = bj;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getKid() {
		return kid;
	}
	public void setKid(int kid) {
		this.kid = kid;
	}
	public int getFs() {
		return fs;
	}
	public void setFs(int fs) {
		this.fs = fs;
	}
	public StuKs() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
