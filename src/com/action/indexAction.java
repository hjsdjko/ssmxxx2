package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

import com.dao.TXinwentongzhiDAO;
import com.dao.TYonghuzhuceDAO;
import com.dao.TYouqinglianjieDAO;
import com.dao.TShangpinxinxiDAO;
import com.model.TXinwentongzhi;
import com.model.TYonghuzhuce;
import com.model.TYouqinglianjie;
import com.model.TShangpinxinxi;
import com.opensymphony.xwork2.ActionSupport;

public class indexAction extends ActionSupport
{
	private TXinwentongzhiDAO xinwentongzhiDAO;
	private TYonghuzhuceDAO yonghuzhuceDAO;
	private TYouqinglianjieDAO youqinglianjieDAO;
	private TShangpinxinxiDAO shangpinxinxiDAO;	
	
	public String index()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		
		String sql="from TXinwentongzhi where leibie='站内新闻1' order by id desc";
		List xinwentongzhiznxwList=xinwentongzhiDAO.getHibernateTemplate().find(sql);
		if(xinwentongzhiznxwList.size()>7)
		{
			xinwentongzhiznxwList=xinwentongzhiznxwList.subList(0, 7);
		}
		request.put("xinwentongzhiznxwList", xinwentongzhiznxwList);
		
		sql="from TXinwentongzhi where leibie='站内新闻2' order by id desc";
		List xinwentongzhitzggList=xinwentongzhiDAO.getHibernateTemplate().find(sql);
		if(xinwentongzhitzggList.size()>8)
		{
			xinwentongzhitzggList=xinwentongzhitzggList.subList(0, 8);
		}
		request.put("xinwentongzhitzggList", xinwentongzhitzggList);
		
		sql="from TXinwentongzhi where leibie='站内新闻3' order by id desc";
		List xinwentongzhirmzxList=xinwentongzhiDAO.getHibernateTemplate().find(sql);
		if(xinwentongzhirmzxList.size()>8)
		{
			xinwentongzhirmzxList=xinwentongzhirmzxList.subList(0, 8);
		}
		request.put("xinwentongzhirmzxList", xinwentongzhirmzxList);
		
		sql="from TXinwentongzhi where shouyetupian<>'' and shouyetupian like '%.jpg' order by id desc";
		List xinwentongzhisybhtList=xinwentongzhiDAO.getHibernateTemplate().find(sql);
		if(xinwentongzhisybhtList.size()>5)
		{
			xinwentongzhisybhtList=xinwentongzhisybhtList.subList(0, 5);
		}
		request.put("xinwentongzhisybhtList", xinwentongzhisybhtList);
		
		sql="from TYonghuzhuce where 1=1 order by id desc";
		List yonghuzhucehyfcList=yonghuzhuceDAO.getHibernateTemplate().find(sql);
		if(yonghuzhucehyfcList.size()>4)
		{
			yonghuzhucehyfcList=yonghuzhucehyfcList.subList(0, 4);
		}
		request.put("yonghuzhucehyfcList", yonghuzhucehyfcList);
		
		sql="from TShangpinxinxi where 1=1 order by id desc";
		List shangpinxinxiznxwList=shangpinxinxiDAO.getHibernateTemplate().find(sql);
		if(shangpinxinxiznxwList.size()>8)
		{
			shangpinxinxiznxwList=shangpinxinxiznxwList.subList(0, 8);
		}
		request.put("shangpinxinxiznxwList", shangpinxinxiznxwList);		
		
		
		return ActionSupport.SUCCESS;
	}
	


	
	public TXinwentongzhiDAO getXinwentongzhiDAO()
	{
		return xinwentongzhiDAO;
	}
	public void setXinwentongzhiDAO(TXinwentongzhiDAO xinwentongzhiDAO)
	{
		this.xinwentongzhiDAO = xinwentongzhiDAO;
	}
	
	public TYonghuzhuceDAO getYonghuzhuceDAO()
	{
		return yonghuzhuceDAO;
	}
	public void setYonghuzhuceDAO(TYonghuzhuceDAO yonghuzhuceDAO)
	{
		this.yonghuzhuceDAO = yonghuzhuceDAO;
	}
	
	public TYouqinglianjieDAO getYouqinglianjieDAO()
	{
		return youqinglianjieDAO;
	}
	public void setYouqinglianjieDAO(TYouqinglianjieDAO youqinglianjieDAO)
	{
		this.youqinglianjieDAO = youqinglianjieDAO;
	}

	public TShangpinxinxiDAO getShangpinxinxiDAO()
	{
		return shangpinxinxiDAO;
	}

	public void setShangpinxinxiDAO(TShangpinxinxiDAO shangpinxinxiDAO)
	{
		this.shangpinxinxiDAO = shangpinxinxiDAO;
	}		


	
}

