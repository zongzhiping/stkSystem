package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SQLQuery;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.model.Kst;
import com.model.StuKs;
import com.model.Tm;
import com.util.DBUtil;

public class KstDAO  extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(KstDAO.class);
	
	public void save(Kst transientInstance) {
		log.debug("saving Kst instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void saveTm(Tm transientInstance) {
		log.debug("saving Tm instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}


	public void deleteTm(Tm transientInstance) {
		log.debug("deleteing Tm instance");
		try {
			getHibernateTemplate().delete(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void saveStuKs(StuKs transientInstance) {
		log.debug("saving Tm instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	
	public StuKs mergeStuKs(StuKs detachedInstance) {
		log.debug("merging Kst instance");
		try {
			StuKs result = (StuKs) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public void delete(Kst persistentInstance) {
		log.debug("deleting Kst instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public Kst findById(Integer id) {
		log.debug("getting Kst instance with id: " + id);
		try {
			Kst instance = (Kst) getHibernateTemplate().get(
					"com.model.Kst", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public Tm findTmById(Integer id) {
		log.debug("getting Kst instance with id: " + id);
		try {
			Tm instance = (Tm) getHibernateTemplate().get(
					"com.model.Tm", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List findAll() {
		log.debug("finding all Kst instances");
		try {
			String queryString = " from Kst as model order by model.type asc ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	public List findAllTm(int stuid,String kid) {
		log.debug("finding all Kst instances");
		try {
			String queryString = " from Tm as model where model.kid="+kid+" and model.stuid="+stuid+" order by model.type asc ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAllTm(String kid) {
		log.debug("finding all Kst instances");
		try {
			String queryString = " from Tm as model where model.kid="+kid+" order by model.type asc ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List findFsGroupByStu(String kid) {
		log.debug("finding all Kst instances");
		try {
			List list = new ArrayList();
			String queryString = " select sum(t.stufs) as fs,t.stuid as stuid from tm t where t.kid="+kid+" group by t.stuid ";
			
			DBUtil util= new DBUtil();
			Connection conn = util.openConnection();
			ResultSet rs = null;
			PreparedStatement pstmt;
			try {
				pstmt = conn.prepareStatement(queryString);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					StuKs sk = new StuKs();
					sk.setFs(rs.getInt("fs"));
					sk.setKid(rs.getInt("stuid"));
					list.add(sk);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return list;
			//return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	public List findFsByStu(String kid,String stuid) {
		log.debug("finding all Kst instances");
		
		
		try {
			String queryString = " from Tm as model where model.kid="+kid+" and model.stuid="+stuid+" order by model.type asc ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
		
	}
	
	
	public int wcks(int kid) {
		log.debug("finding all Kst instances");
		try {
			String queryString = " select sum(fs) as fs from kst where kid="+kid;
			int fs=0;
			DBUtil util= new DBUtil();
			Connection conn = util.openConnection();
			ResultSet rs = null;
			PreparedStatement pstmt;
			try {
				pstmt = conn.prepareStatement(queryString);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					fs=rs.getInt("fs");
					break;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return fs;
			//return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	
	public List findAllStuKs(String kid) {
		try {
			String queryString = " from StuKs as model where model.kid="+kid;
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findStuKs(String kid) {
		try {
			String queryString = " from StuKs as model where model.kid="+kid;
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List findStuKsByStuid(String stuid) {
		try {
			String queryString = " from StuKs as model where model.stuid="+stuid;
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findOneStuKs(int kid,int stuid) {
		try {
			String queryString = " from StuKs as model where model.kid="+kid+" and model.stuid="+stuid;
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	
	public List findAllTmType(int stuid,String kid,int type) {
		log.debug("finding all Kst instances");
		try {
			String queryString = " from Tm as model where model.kid="+kid+" and model.stuid="+stuid+" and model.type="+type+" order by model.id asc ";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	public Kst merge(Kst detachedInstance) {
		log.debug("merging Kst instance");
		try {
			Kst result = (Kst) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public Tm mergeTm(Tm detachedInstance) {
		log.debug("merging Kst instance");
		try {
			Tm result = (Tm) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Kst instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Kst as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public static KstDAO getFromApplicationContext(ApplicationContext ctx) {
		return (KstDAO) ctx.getBean("KstDAO");
	}
	
	public List findAllType(int id, int i) {
		try {
			String queryString = "from Kst as model where model.kid="+id+" and model.type="+i;
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
}
