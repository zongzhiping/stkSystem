package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.model.Bc;

public class BcDAO  extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BcDAO.class);
	
	public void save(Bc transientInstance) {
		log.debug("saving Bc instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void delete(Bc persistentInstance) {
		log.debug("deleting Bc instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public Bc findById(Integer id) {
		log.debug("getting Bc instance with id: " + id);
		try {
			Bc instance = (Bc) getHibernateTemplate().get(
					"com.model.Bc", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List findAll() {
		log.debug("finding all Bc instances");
		try {
			String queryString = " from Bc";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAll(int tid) {
		log.debug("finding all Bc instances");
		try {
			String queryString = " from Bc as model where model.teaid="+tid;
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public Bc merge(Bc detachedInstance) {
		log.debug("merging Bc instance");
		try {
			Bc result = (Bc) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Bc instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Bc as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public static BcDAO getFromApplicationContext(ApplicationContext ctx) {
		return (BcDAO) ctx.getBean("BcDAO");
	}
	
}
