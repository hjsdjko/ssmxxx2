package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TShoucangjilu;

/**
 * Data access object (DAO) for domain model class TShoucangjilu.
 * 
 * @see com.model.TShoucangjilu
 * @author MyEclipse Persistence Tools
 */

public class TShoucangjiluDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TShoucangjiluDAO.class);

	// property constants
	
	public static final String USERNAME = "username";	public static final String XWID = "xwid";	public static final String ZIDUAN = "ziduan";	public static final String BIAO = "biao";	
	

	protected void initDao()
	{
		// do nothing
	}

	public void save(TShoucangjilu transientInstance)
	{
		log.debug("saving TShoucangjilu instance");
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

	public void delete(TShoucangjilu persistentInstance)
	{
		log.debug("deleting TShoucangjilu instance");
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

	public TShoucangjilu findById(java.lang.Integer id)
	{
		log.debug("getting TShoucangjilu instance with id: " + id);
		try
		{
			TShoucangjilu instance = (TShoucangjilu) getHibernateTemplate().get(
					"com.model.TShoucangjilu", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TShoucangjilu instance)
	{
		log.debug("finding TShoucangjilu instance by example");
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
//		log.debug("finding TShoucangjilu instance with yonghuming: " + propertyYonghuming
//				+ ", value: " + value);
//		try
//		{
//			String queryString = "from TShoucangjilu as model where model."
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
		log.debug("finding all TShoucangjilu instances");
		try
		{
			String queryString = "from TShoucangjilu";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TShoucangjilu merge(TShoucangjilu detachedInstance)
	{
		log.debug("merging TShoucangjilu instance");
		try
		{
			TShoucangjilu result = (TShoucangjilu) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}


	public void attachDirty(TShoucangjilu instance)
	{
		log.debug("attaching dirty TShoucangjilu instance");
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

	public void attachClean(TShoucangjilu instance)
	{
		log.debug("attaching clean TShoucangjilu instance");
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

	public static TShoucangjiluDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TShoucangjiluDAO) ctx.getBean("TShoucangjiluDAO");
	}
}
