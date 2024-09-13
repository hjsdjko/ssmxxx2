package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TDingdanxinxi;

/**
 * Data access object (DAO) for domain model class TDingdanxinxi.
 * 
 * @see com.model.TDingdanxinxi
 * @author MyEclipse Persistence Tools
 */

public class TDingdanxinxiDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TDingdanxinxiDAO.class);

	// property constants
	
	public static final String DINGDANHAO = "dingdanhao";	public static final String DINGDANNEIRONG = "dingdanneirong";	public static final String DINGDANJINE = "dingdanjine";	public static final String GOUMAIREN = "goumairen";	public static final String DIANHUA = "dianhua";	public static final String DIZHI = "dizhi";	public static final String BEIZHU = "beizhu";	public static final String ISZF = "iszf";	
	

	protected void initDao()
	{
		// do nothing
	}

	public void save(TDingdanxinxi transientInstance)
	{
		log.debug("saving TDingdanxinxi instance");
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

	public void delete(TDingdanxinxi persistentInstance)
	{
		log.debug("deleting TDingdanxinxi instance");
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

	public TDingdanxinxi findById(java.lang.Integer id)
	{
		log.debug("getting TDingdanxinxi instance with id: " + id);
		try
		{
			TDingdanxinxi instance = (TDingdanxinxi) getHibernateTemplate().get(
					"com.model.TDingdanxinxi", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TDingdanxinxi instance)
	{
		log.debug("finding TDingdanxinxi instance by example");
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
//		log.debug("finding TDingdanxinxi instance with yonghuming: " + propertyYonghuming
//				+ ", value: " + value);
//		try
//		{
//			String queryString = "from TDingdanxinxi as model where model."
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
		log.debug("finding all TDingdanxinxi instances");
		try
		{
			String queryString = "from TDingdanxinxi";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TDingdanxinxi merge(TDingdanxinxi detachedInstance)
	{
		log.debug("merging TDingdanxinxi instance");
		try
		{
			TDingdanxinxi result = (TDingdanxinxi) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}


	public void attachDirty(TDingdanxinxi instance)
	{
		log.debug("attaching dirty TDingdanxinxi instance");
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

	public void attachClean(TDingdanxinxi instance)
	{
		log.debug("attaching clean TDingdanxinxi instance");
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

	public static TDingdanxinxiDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TDingdanxinxiDAO) ctx.getBean("TDingdanxinxiDAO");
	}
}
