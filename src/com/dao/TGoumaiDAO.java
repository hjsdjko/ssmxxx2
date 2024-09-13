package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TGoumai;

/**
 * Data access object (DAO) for domain model class TGoumai.
 * 
 * @see com.model.TGoumai
 * @author MyEclipse Persistence Tools
 */

public class TGoumaiDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TGoumaiDAO.class);

	// property constants
	
	public static final String SHANGPINBIANHAO = "shangpinbianhao";	public static final String SHANGPINMINGCHENG = "shangpinmingcheng";	public static final String SHANGPINLEIBIE = "shangpinleibie";	public static final String ZHIYAOGONGSI = "zhiyaogongsi";	public static final String JIAGE = "jiage";	public static final String KUCUN = "kucun";	public static final String XIAOLIANG = "xiaoliang";	public static final String GOUMAISHULIANG = "goumaishuliang";	public static final String GOUMAIJINE = "goumaijine";	public static final String GOUMAIREN = "goumairen";	public static final String ISSH = "issh";	
	

	protected void initDao()
	{
		// do nothing
	}

	public void save(TGoumai transientInstance)
	{
		log.debug("saving TGoumai instance");
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

	public void delete(TGoumai persistentInstance)
	{
		log.debug("deleting TGoumai instance");
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

	public TGoumai findById(java.lang.Integer id)
	{
		log.debug("getting TGoumai instance with id: " + id);
		try
		{
			TGoumai instance = (TGoumai) getHibernateTemplate().get(
					"com.model.TGoumai", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TGoumai instance)
	{
		log.debug("finding TGoumai instance by example");
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
//		log.debug("finding TGoumai instance with yonghuming: " + propertyYonghuming
//				+ ", value: " + value);
//		try
//		{
//			String queryString = "from TGoumai as model where model."
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
		log.debug("finding all TGoumai instances");
		try
		{
			String queryString = "from TGoumai";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TGoumai merge(TGoumai detachedInstance)
	{
		log.debug("merging TGoumai instance");
		try
		{
			TGoumai result = (TGoumai) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}


	public void attachDirty(TGoumai instance)
	{
		log.debug("attaching dirty TGoumai instance");
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

	public void attachClean(TGoumai instance)
	{
		log.debug("attaching clean TGoumai instance");
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

	public static TGoumaiDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TGoumaiDAO) ctx.getBean("TGoumaiDAO");
	}
}
