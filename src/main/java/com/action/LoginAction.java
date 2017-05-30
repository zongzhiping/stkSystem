package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.LoginDAO;
import com.model.Admin;
import com.model.Stu;
import com.model.Teacher;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

	private int id;
	private String[] selectFlag;
	private String username;
	private String password;
	private String message;
	private String path;

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

	private LoginDAO dao;

	public String adminLogin() {
		String result = "";
		String sql = " from Admin where userName=? and password=?";
		Object[] con = { username, password };
		List list = dao.getHibernateTemplate().find(sql, con);
		if (list.size() == 0) {// 没有用户

			String sql2 = " from Stu where userNo=? and password=? ";
			Object[] con2 = { username, password };
			List list2 = dao.getHibernateTemplate().find(sql2, con2);
			if (list2.size() == 0) {// 没有用户
				
				String sql3 = "  from Teacher where userName=? and password=? ";
				Object[] con3 = { username, password };
				List list3 = dao.getHibernateTemplate().find(sql3, con3);
				if (list3.size() == 0) {// 没有用户
					
					this.setMessage("用户不存在");
					this.setPath("login.jsp");
					return "succeed";
				} else {
					result = "yes";
					ActionContext actionContext = ActionContext.getContext();
					Map session = actionContext.getSession();
					Teacher bean = (Teacher) list3.get(0);
					session.put("userName", username);
					session.put("id", bean.getId());
					//session.put("teaid", bean.getTeaid());
					session.put("type", "2");
				}
			} else {
				result = "yes";
				ActionContext actionContext = ActionContext.getContext();
				Map session = actionContext.getSession();
				Stu bean = (Stu) list2.get(0);
				session.put("userName", username);
				session.put("id", bean.getId());
				//session.put("teaid", bean.getTeaid());
				session.put("type", "3");
			}
		} else {
			result = "yes";
			ActionContext actionContext = ActionContext.getContext();
			Map session = actionContext.getSession();
			Admin bean = (Admin) list.get(0);
			session.put("userName", username);
			session.put("id", bean.getId());
			session.put("type", "1");
		}
		return result;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String[] getSelectFlag() {
		return selectFlag;
	}

	public void setSelectFlag(String[] selectFlag) {
		this.selectFlag = selectFlag;
	}

	public String teacherLogin() {
		String result = "";
		String sql = " from Teacher where userName=? and password=?";
		Object[] con = { username, password };
		List list = dao.getHibernateTemplate().find(sql, con);
		if (list.size() == 0) {// 没有用户
			this.setMessage("登入失败用户名或密码错误");
			this.setPath("adminlogin.jsp");
			return "succeed";
		} else {
			result = "yes";
			ActionContext actionContext = ActionContext.getContext();
			Map session = actionContext.getSession();
			Teacher bean = (Teacher) list.get(0);
			session.put("userName", username);
			session.put("id", bean.getId());
			session.put("type", "2");
		}
		return result;
	}

	public String stuLogin() {
		String result = "";
		String sql = " from Stu where userNo=? ";
		Object[] con = { username };
		List list = dao.getHibernateTemplate().find(sql, con);
		if (list.size() == 0) {// 没有用户
			this.setMessage("登入失败学号不存在");
			this.setPath("adminlogin.jsp");
			return "succeed";
		} else {
			result = "yes";
			ActionContext actionContext = ActionContext.getContext();
			Map session = actionContext.getSession();
			Stu bean = (Stu) list.get(0);
			session.put("userName", username);
			session.put("id", bean.getId());
			//session.put("teaid", bean.getTeaid());
			session.put("type", "3");
		}
		return result;
	}

	public String add() {
		Teacher demo = new Teacher();
		demo.setUserName(username);
		demo.setPassword(password);
		dao.save(demo);
		this.setMessage("添加成功");
		this.setPath("admin/teaAdd.jsp");
		return "succeed";
	}

	public String delete() {

		System.out.println("================  " + selectFlag.length);
		for (int i = 0; i < selectFlag.length; i++) {
			System.out.println("================  " + selectFlag[i]);
			Teacher demo = dao.findById(Integer.parseInt(selectFlag[i]));
			dao.delete(demo);
		}
		this.setMessage("操作成功");
		this.setPath("teaList.action");
		return "succeed";
	}

	//编辑教师信息之前的显示页面
	public String editBefore() {

		Teacher demo = dao.findById(Integer.parseInt(selectFlag[0]));
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("bean", demo);
		return "mb";
	}

	//编辑教师信息
	public String edit(){
		Teacher demo = dao.findById(id);
		demo.setUserName(username);
		demo.setPassword(password);
		dao.merge(demo);
		this.setMessage("更新成功");
		this.setPath("teaList.action");
		return "succeed";
	}

	public String all() {
		List list = dao.findAll();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("list", list);
		return "list";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public LoginDAO getDao() {
		return dao;
	}

	public void setDao(LoginDAO dao) {
		this.dao = dao;
	}
}
