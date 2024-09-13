package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TXinwentongzhi;

/**
 * Data access object (DAO) for domain model class TXinwentongzhi.
 * 
 * @see com.model.TXinwentongzhi
 * @author MyEclipse Persistence Tools
 */

public class TXinwentongzhiDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TXinwentongzhiDAO.class);

	// property constants
	
	public static final String BIAOTI = "biaoti";	public static final String LEIBIE = "leibie";	public static final String NEIRONG = "neirong";	public static final String SHOUYETUPIAN = "shouyetupian";	public static final String DIANJILV = "dianjilv";	public static final String TIANJIAREN = "tianjiaren";	
	

	protected void initDao()
	{
		// do nothing
	}

	public void save(TXinwentongzhi transientInstance)
	{
		log.debug("saving TXinwentongzhi instance");
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

	public void delete(TXinwentongzhi persistentInstance)
	{
		log.debug("deleting TXinwentongzhi instance");
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

	public TXinwentongzhi findById(java.lang.Integer id)
	{
		log.debug("getting TXinwentongzhi instance with id: " + id);
		try
		{
			TXinwentongzhi instance = (TXinwentongzhi) getHibernateTemplate().get(
					"com.model.TXinwentongzhi", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TXinwentongzhi instance)
	{
		log.debug("finding TXinwentongzhi instance by example");
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
//		log.debug("finding TXinwentongzhi instance with yonghuming: " + propertyYonghuming
//				+ ", value: " + value);
//		try
//		{
//			String queryString = "from TXinwentongzhi as model where model."
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
		log.debug("finding all TXinwentongzhi instances");
		try
		{
			String queryString = "from TXinwentongzhi";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TXinwentongzhi merge(TXinwentongzhi detachedInstance)
	{
		log.debug("merging TXinwentongzhi instance");
		try
		{
			TXinwentongzhi result = (TXinwentongzhi) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}


	public void attachDirty(TXinwentongzhi instance)
	{
		log.debug("attaching dirty TXinwentongzhi instance");
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

	public void attachClean(TXinwentongzhi instance)
	{
		log.debug("attaching clean TXinwentongzhi instance");
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

	public static TXinwentongzhiDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TXinwentongzhiDAO) ctx.getBean("TXinwentongzhiDAO");
	}
}
