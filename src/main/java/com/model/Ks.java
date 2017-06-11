package com.model;

public class Ks implements java.io.Serializable{

	private int id;
	private String title;
	private String times;
	private int dx;
	private int ddx;
	private int pd;
	private int bc;
	private int type;
	private int state;
	private String clas;

	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
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
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public int getDx() {
		return dx;
	}
	public void setDx(int dx) {
		this.dx = dx;
	}
	public int getDdx() {
		return ddx;
	}
	public void setDdx(int ddx) {
		this.ddx = ddx;
	}
	public int getPd() {
		return pd;
	}
	public void setPd(int pd) {
		this.pd = pd;
	}
	public int getBc() {
		return bc;
	}
	public void setBc(int bc) {
		this.bc = bc;
	}

	public String getClas() {
		return clas;
	}

	public void setClas(String clas) {
		this.clas = clas;
	}

	public Ks() {
	}
}
