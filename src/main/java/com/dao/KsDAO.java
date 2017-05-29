package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.model.Ks;

public class KsDAO  extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(KsDAO.class);
	
	public Ks save(Ks transientInstance) {
		log.debug("saving Ks instance");
		try {
			getHibernateTemplate().save(transientInstance);
			getHibernateTemplate().flush();  
			return transientInstance;
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void delete(Ks persistentInstance) {
		log.debug("deleting Ks instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public Ks findById(Integer id) {
		log.debug("getting Ks instance with id: " + id);
		try {
			Ks instance = (Ks) getHibernateTemplate().get(
					"com.model.Ks", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List findAll(int type) {
		log.debug("finding all Ks instances");
		try {
			String queryString = "";
			if(type==1){//�������
				queryString = " from Ks as model where model.type=1 and model.state=0 ";
			}else if(type==2){//��������
				queryString = " from Ks as model where model.type=2 and model.state=0 ";
			}else if(type==6){//�Զ��ľ�
				queryString = " from Ks as model where  model.state=0 ";
			}else if(type==7){//�˹��ľ�
				queryString = " from Ks as model where  model.state=1 ";
			}else if(type==8){//�ɼ���ѯ
				queryString = " from Ks as model where  1=1 ";
			}else{
				queryString = " from Ks as model where 1=1 ";
			}
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	
	public Ks merge(Ks detachedInstance) {
		log.debug("merging Ks instance");
		try {
			Ks result = (Ks) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Ks instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Ks as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findByProperty2(String propertyName, Object value, Object value2) {
		log.debug("finding Ks instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Tm as model where model.kid="+value+" and model.stuid="+value2;
				
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public static KsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (KsDAO) ctx.getBean("KsDAO");
	}
	
}
