package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TYonghu;

/**
 * Data access object (DAO) for domain model class TYonghu.
 * 
 * @see com.model.TYonghu
 * @author MyEclipse Persistence Tools
 */

public class TYonghuDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TYonghuDAO.class);

	// property constants
	
	public static final String ZHANGHAO = "zhanghao";	public static final String MIMA = "mima";	public static final String XINGMING = "xingming";	public static final String XINGBIE = "xingbie";	public static final String SHOUJI = "shouji";	public static final String SHENFENZHENG = "shenfenzheng";	public static final String ZHAOPIAN = "zhaopian";	public static final String BEIZHU = "beizhu";	
	

	protected void initDao()
	{
		// do nothing
	}

	public void save(TYonghu transientInstance)
	{
		log.debug("saving TYonghu instance");
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

	public void delete(TYonghu persistentInstance)
	{
		log.debug("deleting TYonghu instance");
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

	public TYonghu findById(java.lang.Integer id)
	{
		log.debug("getting TYonghu instance with id: " + id);
		try
		{
			TYonghu instance = (TYonghu) getHibernateTemplate().get(
					"com.model.TYonghu", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TYonghu instance)
	{
		log.debug("finding TYonghu instance by example");
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
//		log.debug("finding TYonghu instance with yonghuming: " + propertyYonghuming
//				+ ", value: " + value);
//		try
//		{
//			String queryString = "from TYonghu as model where model."
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
		log.debug("finding all TYonghu instances");
		try
		{
			String queryString = "from TYonghu";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TYonghu merge(TYonghu detachedInstance)
	{
		log.debug("merging TYonghu instance");
		try
		{
			TYonghu result = (TYonghu) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}


	public void attachDirty(TYonghu instance)
	{
		log.debug("attaching dirty TYonghu instance");
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

	public void attachClean(TYonghu instance)
	{
		log.debug("attaching clean TYonghu instance");
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

	public static TYonghuDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TYonghuDAO) ctx.getBean("TYonghuDAO");
	}
}
