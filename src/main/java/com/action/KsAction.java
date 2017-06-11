package com.action;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import com.model.*;
import org.apache.struts2.ServletActionContext;

import com.dao.BcDAO;
import com.dao.DdxtDAO;
import com.dao.DxtDAO;
import com.dao.KsDAO;
import com.dao.KstDAO;
import com.dao.PdDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class KsAction extends ActionSupport {

	private int id;
	private String[] selectFlag;
	private String title;
	private String times;
	private String clas;
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

	private static boolean flag = false;

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
			demo.setClas(clas);
			
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
					ks.setType(1);//单选题类型为1
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
					ks.setType(2);//多选题类型为2
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
					ks.setType(3);//判断题类型为3
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
					ks.setType(4);//填空题类型为4
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

//之前的业务逻辑
//	public String modifybefore() {
//
//		//获得考试ID
//		Integer ksId = Integer.parseInt(selectFlag[0]);
//		Ks demo = dao.findById(ksId);
//
//		//通过考试ID查询kst表中的数据
//
//
//		HttpServletRequest request = ServletActionContext.getRequest();
//		request.setAttribute("bean", demo);
//		return "mb";
//	}

	//之后修改的业务逻辑
	public String modifybefore(){

		ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		int stuid = Integer.parseInt(session.get("id").toString());
		// Integer.parseInt(selectFlag[0])
		List list = kstdao.findByProperty("kid", Integer.parseInt(selectFlag[0]));
		Ks ks1 = dao.findById(Integer.parseInt(selectFlag[0]));
		int kstype = ks1.getType();
		for (int i = 0; i < list.size(); i++) {
			Tm tm = new Tm();
			Kst bean = (Kst) list.get(i);
			int tid = bean.getTid();
			int typ = bean.getType();
			tm.setFs(bean.getFs());
			tm.setKid(bean.getKid());

			tm.setStuid(stuid);
			tm.setTid(tid);
			tm.setType(typ);
			if (typ == 1) {
				Dxt t = dxtdao.findById(tid);

				if (kstype == 1) {
					Random r = new Random();
					int temp1 = r.nextInt();
					if (temp1 % 2 == 0) {
						tm.setA(t.getB());
						tm.setB(t.getD());
						tm.setC(t.getA());
						tm.setD(t.getC());
						if (t.getDa().equals("A")) {
							tm.setDa("C");
						} else if (t.getDa().equals("B")) {
							tm.setDa("A");
						} else if (t.getDa().equals("C")) {
							tm.setDa("D");
						} else if (t.getDa().equals("D")) {
							tm.setDa("B");
						}

					} else {
						tm.setA(t.getC());
						tm.setB(t.getA());
						tm.setC(t.getD());
						tm.setD(t.getB());
						if (t.getDa().equals("A")) {
							tm.setDa("B");
						} else if (t.getDa().equals("B")) {
							tm.setDa("D");
						} else if (t.getDa().equals("C")) {
							tm.setDa("A");
						} else if (t.getDa().equals("D")) {
							tm.setDa("C");
						}
					}
				} else {
					tm.setA(t.getA());
					tm.setB(t.getB());
					tm.setC(t.getC());
					tm.setD(t.getD());
					tm.setDa(t.getDa());
				}
				tm.setTitle(t.getTitle());
			} else if (typ == 2) {
				Ddxt t = ddxtdao.findById(tid);
				tm.setA(t.getA());
				tm.setB(t.getB());
				tm.setC(t.getC());
				tm.setD(t.getD());
				tm.setDa(t.getDa());
				tm.setTitle(t.getTitle());
			} else if (typ == 3) {
				Pd t = pddao.findById(tid);
				tm.setDa(t.getDa());
				tm.setTitle(t.getTitle());
			} else if (typ == 4) {
				Bc t = bcdao.findById(tid);
				tm.setTitle(t.getTitle());
				tm.setDa(t.getDa());
			}

			if(!flag){
				// 保存tm
				kstdao.saveTm(tm);
			}

		}
		flag = true;
		List listdxt = kstdao.findAllTmType(stuid, selectFlag[0], 1);
		List listddxt = kstdao.findAllTmType(stuid, selectFlag[0], 2);
		List listpd = kstdao.findAllTmType(stuid, selectFlag[0], 3);
		List listbc = kstdao.findAllTmType(stuid, selectFlag[0], 4);
		Ks ks = dao.findById(Integer.parseInt(selectFlag[0]));
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("listdxt", listdxt);
		request.setAttribute("listddxt", listddxt);
		request.setAttribute("listpd", listpd);
		request.setAttribute("listbc", listbc);
		request.setAttribute("bean", ks);
		return "success";
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

	public String getClas() {
		return clas;
	}

	public void setClas(String clas) {
		this.clas = clas;
	}
}
