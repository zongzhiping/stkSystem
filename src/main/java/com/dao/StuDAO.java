package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.model.Stu;

public class StuDAO  extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(StuDAO.class);
	
	public void save(Stu transientInstance) {
		log.debug("saving Stu instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void delete(Stu persistentInstance) {
		log.debug("deleting Stu instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public Stu findById(Integer id) {
		log.debug("getting Stu instance with id: " + id);
		try {
			Stu instance = (Stu) getHibernateTemplate().get(
					"com.model.Stu", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List findAll() {
		log.debug("finding all Stu instances");
		try {
			String queryString = " from Stu";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAllByTeaId(String teaid) {
		log.debug("finding all Stu instances");
		try {
			String queryString = " from Stu as model where model.teaid="+teaid;
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	public Stu merge(Stu detachedInstance) {
		log.debug("merging Stu instance");
		try {
			Stu result = (Stu) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Stu instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Stu as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public static StuDAO getFromApplicationContext(ApplicationContext ctx) {
		return (StuDAO) ctx.getBean("StuDAO");
	}
	
}
