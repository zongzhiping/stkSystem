package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.model.Dxt;

public class DxtDAO  extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(DxtDAO.class);
	
	public void save(Dxt transientInstance) {
		log.debug("saving Dxt instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void delete(Dxt persistentInstance) {
		log.debug("deleting Dxt instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public Dxt findById(Integer id) {
		log.debug("getting Dxt instance with id: " + id);
		try {
			Dxt instance = (Dxt) getHibernateTemplate().get(
					"com.model.Dxt", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List findAll() {
		log.debug("finding all Dxt instances");
		try {
			String queryString = " from Dxt";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAll(int tid) {
		log.debug("finding all Bc instances");
		try {
			String queryString = " from Dxt as model where model.teaid="+tid;
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public Dxt merge(Dxt detachedInstance) {
		log.debug("merging Dxt instance");
		try {
			Dxt result = (Dxt) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Dxt instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Dxt as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public static DxtDAO getFromApplicationContext(ApplicationContext ctx) {
		return (DxtDAO) ctx.getBean("DxtDAO");
	}
	
}
