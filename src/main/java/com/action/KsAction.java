package com.action;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.BcDAO;
import com.dao.DdxtDAO;
import com.dao.DxtDAO;
import com.dao.KsDAO;
import com.dao.KstDAO;
import com.dao.PdDAO;
import com.model.Bc;
import com.model.Ddxt;
import com.model.Dxt;
import com.model.Ks;
import com.model.Kst;
import com.model.Pd;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class KsAction extends ActionSupport {

	private int id;
	private String[] selectFlag;
	private String title;
	private String times;
	private String message;
	private String path;
	private KsDAO dao;
	private Integer subjectInfo;

	private KstDAO kstdao;
	private DxtDAO dxtdao;
	private DdxtDAO ddxtdao;
	private PdDAO pddao;
	private BcDAO bcdao;

	private int type;

	private String dxtsl;
	private String ddxtsl;
	private String pdsl;
	private String bcsl;
	private String dxtfz;
	private String ddxtfz;
	private String pdfz;
	private String bcfz;

	public String add() {
		Ks demo = new Ks();
		demo.setTitle(title);
		demo.setTimes(times);
		demo.setDx(0);
		demo.setDdx(0);
		demo.setPd(0);
		demo.setBc(0);
		demo.setType(type);
		demo.setState(0);
		demo = dao.save(demo);
		this.setMessage("添加成功,进入单选题选择阶段");
		this.setPath("szddxtList.action?id=" + demo.getId());
		return "succeed";
	}

	public String add2() {

		int totle = 0;
		if (dxtsl != null && dxtfz != null && !dxtfz.equals("")
				&& !dxtsl.equals("")) {

			totle += Integer.parseInt(dxtsl) * Integer.parseInt(dxtfz);
		}

		if (ddxtsl != null && ddxtfz != null && !ddxtsl.equals("")
				&& !ddxtfz.equals("")) {

			totle += Integer.parseInt(ddxtsl) * Integer.parseInt(ddxtfz);
		}

		if (pdfz != null && pdsl != null && !pdfz.equals("")
				&& !pdsl.equals("")) {

			totle += Integer.parseInt(pdsl) * Integer.parseInt(pdfz);
		}
		if (bcsl != null && bcfz != null && !bcsl.equals("")
				&& !bcfz.equals("")) {

			totle += Integer.parseInt(bcsl) * Integer.parseInt(bcfz);
		}

		if (totle != 100) {
			this.setMessage("总分不为100分请从新设置！");
			this.setPath("admin/ksAdd2.jsp?type=1");
		} else {
			Ks demo = new Ks();
			demo.setTitle(title);
			demo.setTimes(times);
			
			if (dxtsl != null && dxtfz != null && !dxtfz.equals("")
					&& !dxtsl.equals("")) {

				demo.setDx(Integer.parseInt(dxtsl));
			}else{
				demo.setDx(0);
			}

			if (ddxtsl != null && ddxtfz != null && !ddxtsl.equals("")
					&& !ddxtfz.equals("")) {

				demo.setDdx(Integer.parseInt(ddxtsl));
			}else{
				demo.setDdx(0);
			}

			if (pdfz != null && pdsl != null && !pdfz.equals("")
					&& !pdsl.equals("")) {

				demo.setPd(Integer.parseInt(pdsl));
			}else{
				demo.setPd(0);
			}
			if (bcsl != null && bcfz != null && !bcsl.equals("")
					&& !bcfz.equals("")) {

				demo.setBc(Integer.parseInt(bcsl));
			}else{
				demo.setBc(0);
			}
			
			demo.setType(type);
			demo.setState(0);
			demo = dao.save(demo);
			// 添加考试题
			if (dxtsl != null && dxtfz != null && !dxtfz.equals("")
					&& !dxtsl.equals("")) {
				Random random = new Random();
				List list = dxtdao.findAll(subjectInfo);
				for (int i = 0; i < Integer.parseInt(dxtsl); i++) {
					int a = Math.abs(random.nextInt()) % list.size();
					Dxt bean = (Dxt) list.get(a);
					Kst ks = new Kst();
					ks.setTid(bean.getId());
					ks.setKid(demo.getId());
					ks.setType(1);
					ks.setFs(Integer.parseInt(dxtfz));
					kstdao.save(ks);
				}

			}

			if (ddxtsl != null && ddxtfz != null && !ddxtsl.equals("")
					&& !ddxtfz.equals("")) {
				List list = ddxtdao.findAll(subjectInfo);
				Random random = new Random();
				for (int i = 0; i < Integer.parseInt(ddxtsl); i++) {

					int a = Math.abs(random.nextInt()) % list.size();
					Ddxt bean = (Ddxt) list.get(a);
					Kst ks = new Kst();
					ks.setTid(bean.getId());
					ks.setKid(demo.getId());
					ks.setType(2);
					ks.setFs(Integer.parseInt(ddxtfz));
					kstdao.save(ks);
				}

			}

			if (pdfz != null && pdsl != null && !pdfz.equals("")
					&& !pdsl.equals("")) {
				Random random = new Random();
				List list = pddao.findAll();
				for (int i = 0; i < Integer.parseInt(pdsl); i++) {
					int a = Math.abs(random.nextInt()) % list.size();
					Pd bean = (Pd) list.get(a);
					Kst ks = new Kst();
					ks.setTid(bean.getId());
					ks.setKid(demo.getId());
					ks.setType(3);
					ks.setFs(Integer.parseInt(pdfz));
					kstdao.save(ks);
				}

			}

			if (bcsl != null && bcfz != null && !bcsl.equals("")
					&& !bcfz.equals("")) {
				Random random = new Random();
				List list = bcdao.findAll();
				for (int i = 0; i < Integer.parseInt(bcsl); i++) {
					int a = Math.abs(random.nextInt()) % list.size();
					Bc bean = (Bc) list.get(a);
					Kst ks = new Kst();
					ks.setTid(bean.getId());
					ks.setKid(demo.getId());
					ks.setType(4);
					ks.setFs(Integer.parseInt(bcfz));
					kstdao.save(ks);
				}

			}

			this.setMessage("添加成功");
			this.setPath("ksList.action?type=1");
		}

		return "succeed";
	}

	public String delete() {

		System.out.println("================  " + selectFlag.length);
		for (int i = 0; i < selectFlag.length; i++) {
			System.out.println("================  " + selectFlag[i]);
			Ks demo = dao.findById(Integer.parseInt(selectFlag[i]));
			dao.delete(demo);
		}
		this.setMessage("操作成功");
		this.setPath("ksList.action?type="+type);
		return "succeed";
	}

	public String modifybefore() {

		Ks demo = dao.findById(Integer.parseInt(selectFlag[0]));
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("bean", demo);
		return "mb";
	}

	public String modify() {
		Ks demo = dao.findById(id);
		demo.setTitle(title);
		dao.merge(demo);
		this.setMessage("修改成功");
		this.setPath("ksList.action");
		return "succeed";
	}

	public String all() {
		ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		List list = dao.findAll(type);
		List list2 =  new ArrayList();
		String str="";
		if (type == 0) {// 学生的考试
			for (int i = 0; i < list.size(); i++) {
				Ks ks = (Ks) list.get(i);
				List l = dao.findByProperty2("kid", ks.getId(),
						session.get("id").toString());
				if (l.size() > 0) {// 考过
				}else{
					list2.add(ks);
				}
			}
			System.out.println("==========================="+str);
			list = list2;
			
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("list", list);
		request.setAttribute("type", type);
		if (type == 0) {
			return "stulist";
		} else if (type == 6) {
			return "zdyjlist";
		} else if (type == 7) {
			return "bzdyjlist";
		} else if (type == 8) {
			return "cjcxlist";
		} else {
			return "list";
		}
	}

	// public String szdKsList() {
	// List list = dao.findAll();
	// HttpServletRequest request = ServletActionContext.getRequest();
	// request.setAttribute("list", list);
	// return "list";
	// }

	public String search() {
		List list = dao.findByProperty("", "");
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("list", list);
		return ActionSupport.SUCCESS;
	}

	public KsDAO getDao() {
		return dao;
	}

	public void setDao(KsDAO dao) {
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

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public String[] getSelectFlag() {
		return selectFlag;
	}

	public void setSelectFlag(String[] selectFlag) {
		this.selectFlag = selectFlag;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getDxtsl() {
		return dxtsl;
	}

	public void setDxtsl(String dxtsl) {
		this.dxtsl = dxtsl;
	}

	public String getDdxtsl() {
		return ddxtsl;
	}

	public void setDdxtsl(String ddxtsl) {
		this.ddxtsl = ddxtsl;
	}

	public String getPdsl() {
		return pdsl;
	}

	public void setPdsl(String pdsl) {
		this.pdsl = pdsl;
	}

	public String getBcsl() {
		return bcsl;
	}

	public void setBcsl(String bcsl) {
		this.bcsl = bcsl;
	}

	public String getDxtfz() {
		return dxtfz;
	}

	public void setDxtfz(String dxtfz) {
		this.dxtfz = dxtfz;
	}

	public String getDdxtfz() {
		return ddxtfz;
	}

	public void setDdxtfz(String ddxtfz) {
		this.ddxtfz = ddxtfz;
	}

	public String getPdfz() {
		return pdfz;
	}

	public void setPdfz(String pdfz) {
		this.pdfz = pdfz;
	}

	public String getBcfz() {
		return bcfz;
	}

	public void setBcfz(String bcfz) {
		this.bcfz = bcfz;
	}

	public KstDAO getKstdao() {
		return kstdao;
	}

	public void setKstdao(KstDAO kstdao) {
		this.kstdao = kstdao;
	}

	public DxtDAO getDxtdao() {
		return dxtdao;
	}

	public void setDxtdao(DxtDAO dxtdao) {
		this.dxtdao = dxtdao;
	}

	public DdxtDAO getDdxtdao() {
		return ddxtdao;
	}

	public void setDdxtdao(DdxtDAO ddxtdao) {
		this.ddxtdao = ddxtdao;
	}

	public PdDAO getPddao() {
		return pddao;
	}

	public void setPddao(PdDAO pddao) {
		this.pddao = pddao;
	}

	public BcDAO getBcdao() {
		return bcdao;
	}

	public void setBcdao(BcDAO bcdao) {
		this.bcdao = bcdao;
	}

	public Integer getSubjectInfo() {
		return subjectInfo;
	}

	public void setSubjectInfo(Integer subjectInfo) {
		this.subjectInfo = subjectInfo;
	}
}
