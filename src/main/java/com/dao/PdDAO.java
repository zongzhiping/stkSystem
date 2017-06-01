package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.model.Pd;

public class PdDAO  extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(PdDAO.class);
	
	public void save(Pd transientInstance) {
		log.debug("saving Pd instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void delete(Pd persistentInstance) {
		log.debug("deleting Pd instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public Pd findById(Integer id) {
		log.debug("getting Pd instance with id: " + id);
		try {
			Pd instance = (Pd) getHibernateTemplate().get(
					"com.model.Pd", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List findAll() {
		log.debug("finding all Pd instances");
		try {
			String queryString = " from Pd";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAll(Integer tid) {
		log.debug("finding all Bc instances");
		try {
			String queryString = " from Pd as model where model.subjectInfo="+tid;
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public Pd merge(Pd detachedInstance) {
		log.debug("merging Pd instance");
		try {
			Pd result = (Pd) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Pd instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Pd as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public static PdDAO getFromApplicationContext(ApplicationContext ctx) {
		return (PdDAO) ctx.getBean("PdDAO");
	}
	
}
