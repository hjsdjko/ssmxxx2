package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TShangpinxinxi;

/**
 * Data access object (DAO) for domain model class TShangpinxinxi.
 * 
 * @see com.model.TShangpinxinxi
 * @author MyEclipse Persistence Tools
 */

public class TShangpinxinxiDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TShangpinxinxiDAO.class);

	// property constants
	
	public static final String SHANGPINBIANHAO = "shangpinbianhao";	public static final String SHANGPINMINGCHENG = "shangpinmingcheng";	public static final String SHANGPINLEIBIE = "shangpinleibie";	public static final String ZHIYAOGONGSI = "zhiyaogongsi";	public static final String JIAGE = "jiage";	public static final String KUCUN = "kucun";	public static final String XIAOLIANG = "xiaoliang";	public static final String TUPIAN = "tupian";	public static final String YAOPINJIANJIE = "yaopinjianjie";	public static final String YAOXIAO = "yaoxiao";	public static final String DIANZAN_D = "dianzan_d";	public static final String DIANZAN_C = "dianzan_c";	
	

	protected void initDao()
	{
		// do nothing
	}

	public void save(TShangpinxinxi transientInstance)
	{
		log.debug("saving TShangpinxinxi instance");
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

	public void delete(TShangpinxinxi persistentInstance)
	{
		log.debug("deleting TShangpinxinxi instance");
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

	public TShangpinxinxi findById(java.lang.Integer id)
	{
		log.debug("getting TShangpinxinxi instance with id: " + id);
		try
		{
			TShangpinxinxi instance = (TShangpinxinxi) getHibernateTemplate().get(
					"com.model.TShangpinxinxi", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TShangpinxinxi instance)
	{
		log.debug("finding TShangpinxinxi instance by example");
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
//		log.debug("finding TShangpinxinxi instance with yonghuming: " + propertyYonghuming
//				+ ", value: " + value);
//		try
//		{
//			String queryString = "from TShangpinxinxi as model where model."
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
		log.debug("finding all TShangpinxinxi instances");
		try
		{
			String queryString = "from TShangpinxinxi";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TShangpinxinxi merge(TShangpinxinxi detachedInstance)
	{
		log.debug("merging TShangpinxinxi instance");
		try
		{
			TShangpinxinxi result = (TShangpinxinxi) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}


	public void attachDirty(TShangpinxinxi instance)
	{
		log.debug("attaching dirty TShangpinxinxi instance");
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

	public void attachClean(TShangpinxinxi instance)
	{
		log.debug("attaching clean TShangpinxinxi instance");
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

	public static TShangpinxinxiDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TShangpinxinxiDAO) ctx.getBean("TShangpinxinxiDAO");
	}
}
