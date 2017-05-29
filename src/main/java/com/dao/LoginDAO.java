package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.model.Demo;
import com.model.Teacher;

public class LoginDAO  extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(LoginDAO.class);
	
	public void save(Teacher transientInstance) {
		log.debug("saving TAdmin instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void delete(Teacher persistentInstance) {
		log.debug("deleting TAdmin instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public Teacher findById(Integer id) {
		log.debug("getting TAdmin instance with id: " + id);
		try {
			Teacher instance = (Teacher) getHibernateTemplate().get(
					"com.model.Teacher", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List findAll() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from Teacher ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public Demo merge(Demo detachedInstance) {
		log.debug("merging TAdmin instance");
		try {
			Demo result = (Demo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TAdmin instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Demo as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public static LoginDAO getFromApplicationContext(ApplicationContext ctx) {
		return (LoginDAO) ctx.getBean("DemoDAO");
	}
	
}
