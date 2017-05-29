package com.model;

public class Demo implements java.io.Serializable{

	private int id;
	private String name;
	
	public Demo() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
