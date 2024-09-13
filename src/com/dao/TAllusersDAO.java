package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TAllusers;

/**
 * Data access object (DAO) for domain model class TAllusers.
 * 
 * @see com.model.TAllusers
 * @author MyEclipse Persistence Tools
 */

public class TAllusersDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(TAllusersDAO.class);

	// property constants
	public static final String USERNAME = "username";
	public static final String PWD = "pwd";
	public static final String CX = "cx";
	

	protected void initDao() {
		// do nothing
	}

	public void save(TAllusers transientInstance) {
		log.debug("saving TAllusers instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TAllusers persistentInstance) {
		log.debug("deleting TAllusers instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TAllusers findById(java.lang.Integer id) {
		log.debug("getting TAllusers instance with id: " + id);
		try {
			TAllusers instance = (TAllusers) getHibernateTemplate().get(
					"com.model.TAllusers", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TAllusers instance) {
		log.debug("finding TAllusers instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TAllusers instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TAllusers as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUsername(Object username) {
		return findByProperty(USERNAME, username);
	}

	public List findByPwd(Object pwd) {
		return findByProperty(PWD, pwd);
	}

	public List findAll() {
		log.debug("finding all TAllusers instances");
		try {
			String queryString = "from TAllusers";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TAllusers merge(TAllusers detachedInstance) {
		log.debug("merging TAllusers instance");
		try {
			TAllusers result = (TAllusers) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TAllusers instance) {
		log.debug("attaching dirty TAllusers instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TAllusers instance) {
		log.debug("attaching clean TAllusers instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TAllusersDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TAllusersDAO) ctx.getBean("TAllusersDAO");
	}
}