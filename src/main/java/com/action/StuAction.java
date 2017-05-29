package com.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.dao.StuDAO;
import com.model.Stu;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.ExcelUtil;
import com.util.Pagination;

public class StuAction extends ActionSupport {

	private int id;
	private String password;
	private String userNo;
	private String realName;
	private String cardno;
	private String tel;
	private String state;
	private String[] selectFlag;
	private String title;
	private String a;
	private String b;
	private String c;
	private String d;
	private String da;
	private String message;
	private String path;
	private StuDAO dao;
	private int index = 1;
	private File image; // 上传的文件
	private String imageFileName; // 文件名称 p
	private String imageContentType; // 文件类型

	public String upload() {
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/uploadFile");
		System.out.println("realpath: " + realpath);
		if (image != null) {
			File savefile = new File(new File(realpath), imageFileName);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			try {
				FileUtils.copyFile(image, savefile);
				// 读取excel写数据
				List list = ExcelUtil.getStuListByExcel(savefile);
				ActionContext actionContext = ActionContext.getContext();
				Map session = actionContext.getSession();
				for (int i = 0; i < list.size(); i++) {
					Stu bean = (Stu) list.get(i);
					int teaid = Integer.parseInt(session.get("id").toString());
					// bean.setTeaid(teaid);
					dao.save(bean);
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		this.setMessage("添加成功");
		this.setPath("admin/stuAdd.jsp");
		return "succeed";
	}

	public String add() {
		Stu demo = new Stu();
		demo.setCardno(cardno);
		demo.setPassword(password);
		demo.setRealName(realName);
		demo.setState(state);
		demo.setTel(tel);
		demo.setUserNo(userNo);
		dao.save(demo);
		this.setMessage("添加成功");
		this.setPath("admin/stuAdd.jsp");
		return "succeed";
	}

	public String delete() {
		Stu demo = dao.findById(id);
		dao.delete(demo);
		this.setMessage("操作成功");
		this.setPath("stuList.action");
		return "succeed";
	}

	public String modifybefore() {

		Stu demo = dao.findById(Integer.parseInt(selectFlag[0]));
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("bean", demo);
		return "mb";
	}
	
	public String myself() {

		ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		String myid = session.get("id").toString(); 
		Stu demo = dao.findById(Integer.parseInt(myid));
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("bean", demo);
		return "list";
	}
	
	
	
	public String myselfmodify() {
		Stu demo = dao.findById(id);
		demo.setCardno(cardno);
		demo.setPassword(password);
		demo.setRealName(realName);
		demo.setTel(tel);
		dao.merge(demo);
		this.setMessage("修改成功");
		this.setPath("myself.action");
		return "succeed";
	}
	

	public String modify() {
		Stu demo = dao.findById(id);
		// demo.setTitle(title);
		// demo.setA(a);
		// demo.setB(b);
		// demo.setC(c);
		// demo.setD(d);
		// demo.setDa(da);
		dao.merge(demo);
		this.setMessage("修改成功");
		this.setPath("StuList.action");
		return "succeed";
	}

	public String all() {

		List list = new ArrayList();
		list = dao.findAll();

		int pageSize = 10;
		int fromIndex = (index - 1) * pageSize;
		int toIndex = Math.min(fromIndex + pageSize, list.size());
		List adminListFenye = list.subList(fromIndex, toIndex);

		Pagination p = new Pagination();// 创建 分页对象
		p.setIndex(index);// 设置页数
		p.setPageSize(pageSize);
		p.setTotle(list.size());// 设置总共的条数
		p.setData(adminListFenye);// 设置数据
		p.setPath("stuList.action");// 跳转的路径

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("page", p);
		return "list";

	}

	public String search() {
		List list = dao.findByProperty("", "");
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("list", list);
		return ActionSupport.SUCCESS;
	}

	public StuDAO getDao() {
		return dao;
	}

	public void setDao(StuDAO dao) {
		this.dao = dao;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}

	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}

	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}

	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}

	public String getDa() {
		return da;
	}

	public void setDa(String da) {
		this.da = da;
	}

	public String[] getSelectFlag() {
		return selectFlag;
	}

	public void setSelectFlag(String[] selectFlag) {
		this.selectFlag = selectFlag;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
