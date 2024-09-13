package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TYaopinleibie;

/**
 * Data access object (DAO) for domain model class TYaopinleibie.
 * 
 * @see com.model.TYaopinleibie
 * @author MyEclipse Persistence Tools
 */

public class TYaopinleibieDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TYaopinleibieDAO.class);

	// property constants
	
	public static final String LEIBIE = "leibie";	
	

	protected void initDao()
	{
		// do nothing
	}

	public void save(TYaopinleibie transientInstance)
	{
		log.debug("saving TYaopinleibie instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TYaopinleibie persistentInstance)
	{
		log.debug("deleting TYaopinleibie instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TYaopinleibie findById(java.lang.Integer id)
	{
		log.debug("getting TYaopinleibie instance with id: " + id);
		try
		{
			TYaopinleibie instance = (TYaopinleibie) getHibernateTemplate().get(
					"com.model.TYaopinleibie", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TYaopinleibie instance)
	{
		log.debug("finding TYaopinleibie instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	//public List findByYonghuming(String propertyYonghuming, Object value)
//	{
//		log.debug("finding TYaopinleibie instance with yonghuming: " + propertyYonghuming
//				+ ", value: " + value);
//		try
//		{
//			String queryString = "from TYaopinleibie as model where model."
//					+ propertyYonghuming + "= ?";
//			return getHibernateTemplate().find(queryString, value);
//		} catch (RuntimeException re)
//		{
//			log.error("find by property yonghuming failed", re);
//			throw re;
//		}
//	}

	
	//public List findByYonghuming(Object yonghuming)
//	{
//		return findByYonghuming(YONGHUMING, yonghuming);
//	}

	//public List findByXingming(Object xingming)
//	{
//		return findByXingming(XINGMING, xingming);
//	}

	

	public List findAll()
	{
		log.debug("finding all TYaopinleibie instances");
		try
		{
			String queryString = "from TYaopinleibie";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TYaopinleibie merge(TYaopinleibie detachedInstance)
	{
		log.debug("merging TYaopinleibie instance");
		try
		{
			TYaopinleibie result = (TYaopinleibie) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}


	public void attachDirty(TYaopinleibie instance)
	{
		log.debug("attaching dirty TYaopinleibie instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TYaopinleibie instance)
	{
		log.debug("attaching clean TYaopinleibie instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TYaopinleibieDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TYaopinleibieDAO) ctx.getBean("TYaopinleibieDAO");
	}
}
