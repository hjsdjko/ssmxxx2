package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TYouqinglianjie;

/**
 * Data access object (DAO) for domain model class TYouqinglianjie.
 * 
 * @see com.model.TYouqinglianjie
 * @author MyEclipse Persistence Tools
 */

public class TYouqinglianjieDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TYouqinglianjieDAO.class);

	// property constants
	
	public static final String WANGZHANMINGCHENG = "wangzhanmingcheng";	public static final String WANGZHI = "wangzhi";	public static final String LOGO = "logo";	
	

	protected void initDao()
	{
		// do nothing
	}

	public void save(TYouqinglianjie transientInstance)
	{
		log.debug("saving TYouqinglianjie instance");
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

	public void delete(TYouqinglianjie persistentInstance)
	{
		log.debug("deleting TYouqinglianjie instance");
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

	public TYouqinglianjie findById(java.lang.Integer id)
	{
		log.debug("getting TYouqinglianjie instance with id: " + id);
		try
		{
			TYouqinglianjie instance = (TYouqinglianjie) getHibernateTemplate().get(
					"com.model.TYouqinglianjie", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TYouqinglianjie instance)
	{
		log.debug("finding TYouqinglianjie instance by example");
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
//		log.debug("finding TYouqinglianjie instance with yonghuming: " + propertyYonghuming
//				+ ", value: " + value);
//		try
//		{
//			String queryString = "from TYouqinglianjie as model where model."
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
		log.debug("finding all TYouqinglianjie instances");
		try
		{
			String queryString = "from TYouqinglianjie";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TYouqinglianjie merge(TYouqinglianjie detachedInstance)
	{
		log.debug("merging TYouqinglianjie instance");
		try
		{
			TYouqinglianjie result = (TYouqinglianjie) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}


	public void attachDirty(TYouqinglianjie instance)
	{
		log.debug("attaching dirty TYouqinglianjie instance");
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

	public void attachClean(TYouqinglianjie instance)
	{
		log.debug("attaching clean TYouqinglianjie instance");
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

	public static TYouqinglianjieDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TYouqinglianjieDAO) ctx.getBean("TYouqinglianjieDAO");
	}
}
