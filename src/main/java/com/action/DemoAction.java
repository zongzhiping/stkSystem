package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.DemoDAO;
import com.model.Demo;
import com.opensymphony.xwork2.ActionSupport;

public class DemoAction extends ActionSupport {

	private int id;
	private String name;
	private String message;
	private String path;
	private DemoDAO dao;

	public String add() {
		Demo demo = new Demo();
		demo.setName(this.getName());
		dao.save(demo);
		this.setMessage("操作成功");
		this.setPath("newsMana.action");
		return "succeed";
	}

	public String delete() {
		Demo demo = dao.findById(id);
		dao.delete(demo);
		this.setMessage("操作成功");
		this.setPath("newsMana.action");
		return "succeed";
	}

	public String modifybefore() {
		Demo demo = dao.findById(id);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("demo", demo);
		return ActionSupport.SUCCESS;
	}

	public String modify() {
		Demo demo = dao.findById(id);
		dao.merge(demo);
		this.setMessage("操作成功");
		this.setPath("newsMana.action");
		return "succeed";
	}

	public String all() {
		List list = dao.findAll();
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("list", list);
		return ActionSupport.SUCCESS;
	}

	public String search() {
		List list = dao.findByProperty("", "");
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("list", list);
		return ActionSupport.SUCCESS;
	}

	public DemoDAO getDao() {
		return dao;
	}

	public void setDao(DemoDAO dao) {
		this.dao = dao;
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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
