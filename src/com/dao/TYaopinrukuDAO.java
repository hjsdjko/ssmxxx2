package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TYaopinruku;

/**
 * Data access object (DAO) for domain model class TYaopinruku.
 * 
 * @see com.model.TYaopinruku
 * @author MyEclipse Persistence Tools
 */

public class TYaopinrukuDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TYaopinrukuDAO.class);

	// property constants
	
	public static final String SHANGPINBIANHAO = "shangpinbianhao";	public static final String SHANGPINMINGCHENG = "shangpinmingcheng";	public static final String SHANGPINLEIBIE = "shangpinleibie";	public static final String ZHIYAOGONGSI = "zhiyaogongsi";	public static final String KUCUN = "kucun";	public static final String RUKUSHULIANG = "rukushuliang";	public static final String RUKURIQI = "rukuriqi";	public static final String RUKUSHUOMING = "rukushuoming";	
	

	protected void initDao()
	{
		// do nothing
	}

	public void save(TYaopinruku transientInstance)
	{
		log.debug("saving TYaopinruku instance");
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

	public void delete(TYaopinruku persistentInstance)
	{
		log.debug("deleting TYaopinruku instance");
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

	public TYaopinruku findById(java.lang.Integer id)
	{
		log.debug("getting TYaopinruku instance with id: " + id);
		try
		{
			TYaopinruku instance = (TYaopinruku) getHibernateTemplate().get(
					"com.model.TYaopinruku", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TYaopinruku instance)
	{
		log.debug("finding TYaopinruku instance by example");
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
//		log.debug("finding TYaopinruku instance with yonghuming: " + propertyYonghuming
//				+ ", value: " + value);
//		try
//		{
//			String queryString = "from TYaopinruku as model where model."
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
		log.debug("finding all TYaopinruku instances");
		try
		{
			String queryString = "from TYaopinruku";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TYaopinruku merge(TYaopinruku detachedInstance)
	{
		log.debug("merging TYaopinruku instance");
		try
		{
			TYaopinruku result = (TYaopinruku) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}


	public void attachDirty(TYaopinruku instance)
	{
		log.debug("attaching dirty TYaopinruku instance");
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

	public void attachClean(TYaopinruku instance)
	{
		log.debug("attaching clean TYaopinruku instance");
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

	public static TYaopinrukuDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TYaopinrukuDAO) ctx.getBean("TYaopinrukuDAO");
	}
}
