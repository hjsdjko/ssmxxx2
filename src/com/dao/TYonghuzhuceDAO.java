package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TYonghuzhuce;

/**
 * Data access object (DAO) for domain model class TYonghuzhuce.
 * 
 * @see com.model.TYonghuzhuce
 * @author MyEclipse Persistence Tools
 */

public class TYonghuzhuceDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TYonghuzhuceDAO.class);

	// property constants
	public static final String YONGHUMING = "yonghuming";
	public static final String MIMA = "mima";
	public static final String XINGMING = "xingming";
	public static final String XINGBIE = "xingbie";
	public static final String CHUSHENGNIANYUE = "chushengnianyue";
	public static final String QQ = "qq";
	public static final String YOUXIANG = "youxiang";
	public static final String DIANHUA = "dianhua";
	public static final String SHENFENZHENG = "shenfenzheng";
	public static final String TOUXIANG = "touxiang";
	public static final String DIZHI = "dizhi";
	public static final String BEIZHU = "beizhu";
	public static final String ISSH = "issh";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TYonghuzhuce transientInstance)
	{
		log.debug("saving TYonghuzhuce instance");
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

	public void delete(TYonghuzhuce persistentInstance)
	{
		log.debug("deleting TYonghuzhuce instance");
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

	public TYonghuzhuce findById(java.lang.Integer id)
	{
		log.debug("getting TYonghuzhuce instance with id: " + id);
		try
		{
			TYonghuzhuce instance = (TYonghuzhuce) getHibernateTemplate().get(
					"com.model.TYonghuzhuce", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TYonghuzhuce instance)
	{
		log.debug("finding TYonghuzhuce instance by example");
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

	public List findByYonghuming(String propertyYonghuming, Object value)
	{
		log.debug("finding TYonghuzhuce instance with yonghuming: " + propertyYonghuming
				+ ", value: " + value);
		try
		{
			String queryString = "from TYonghuzhuce as model where model."
					+ propertyYonghuming + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property yonghuming failed", re);
			throw re;
		}
	}

	
	public List findByYonghuming(Object yonghuming)
	{
		return findByYonghuming(YONGHUMING, yonghuming);
	}

	//public List findByXingming(Object xingming)
//	{
//		return findByXingming(XINGMING, xingming);
//	}

	

	public List findAll()
	{
		log.debug("finding all TYonghuzhuce instances");
		try
		{
			String queryString = "from TYonghuzhuce";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TYonghuzhuce merge(TYonghuzhuce detachedInstance)
	{
		log.debug("merging TYonghuzhuce instance");
		try
		{
			TYonghuzhuce result = (TYonghuzhuce) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TYonghuzhuce instance)
	{
		log.debug("attaching dirty TYonghuzhuce instance");
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

	public void attachClean(TYonghuzhuce instance)
	{
		log.debug("attaching clean TYonghuzhuce instance");
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

	public static TYonghuzhuceDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TYonghuzhuceDAO) ctx.getBean("TYonghuzhuceDAO");
	}
}