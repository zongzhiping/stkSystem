package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.model.Ddxt;

public class DdxtDAO  extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(DdxtDAO.class);
	
	public void save(Ddxt transientInstance) {
		log.debug("saving Ddxt instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void delete(Ddxt persistentInstance) {
		log.debug("deleting Ddxt instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public Ddxt findById(Integer id) {
		log.debug("getting Ddxt instance with id: " + id);
		try {
			Ddxt instance = (Ddxt) getHibernateTemplate().get(
					"com.model.Ddxt", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List findAll() {
		log.debug("finding all Ddxt instances");
		try {
			String queryString = " from Ddxt";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAll(int tid) {
		log.debug("finding all Bc instances");
		try {
			String queryString = " from Ddxt as model where model.teaid="+tid;
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public Ddxt merge(Ddxt detachedInstance) {
		log.debug("merging Ddxt instance");
		try {
			Ddxt result = (Ddxt) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Ddxt instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Ddxt as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public static DdxtDAO getFromApplicationContext(ApplicationContext ctx) {
		return (DdxtDAO) ctx.getBean("DdxtDAO");
	}
	
}
