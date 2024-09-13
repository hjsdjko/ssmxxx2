package com.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import com.opensymphony.xwork2.ActionSupport;
import com.dao.TAllusersDAO;
import com.dao.TYonghuzhuceDAO;
import com.dao.TYonghuDAO;//jixacicxhu1
import com.model.TAllusers;
import com.model.TYonghuzhuce;
import com.model.TYonghu;//jixacicxhu2
import com.util.Pagesize;
import com.util.Pagination;

public class loginService

{
	private TAllusersDAO allusersDAO;
	private TYonghuzhuceDAO yonghuzhuceDAO;
	private TYonghuDAO yonghuDAO;	//jixacicxhu3
	
	public TAllusersDAO getAllusersDAO()
	{
		return allusersDAO;
	}
	public void setAllusersDAO(TAllusersDAO allusersDAO)
	{
		this.allusersDAO = allusersDAO;
	}
	
	
	public TYonghuzhuceDAO getYonghuzhuceDAO()
	{
		return yonghuzhuceDAO;
	}
	public void setYonghuzhuceDAO(TYonghuzhuceDAO yonghuzhuceDAO)
	{
		this.yonghuzhuceDAO = yonghuzhuceDAO;
	}
	
	public TYonghuDAO getYonghuDAO()
	{
		return yonghuDAO;
	}
	public void setYonghuDAO(TYonghuDAO yonghuDAO)
	{
		this.yonghuDAO = yonghuDAO;
	}	//jixacicxhu4
	
	public String login(String userName,String userPw,String userType)
	{
		try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			e.printStackTrace();
		}
		String result="no";
		if(userType.equals("管理员"))//系统管理员登录
		{
			String sql="from TAllusers where username=? and pwd=?";
			Object[] con={userName,userPw};
			List allusersList=allusersDAO.getHibernateTemplate().find(sql,con);
			if(allusersList.size()==0)
			{
				 result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TAllusers allusers=(TAllusers)allusersList.get(0);
				 session.setAttribute("cx", allusers.getCx());
				 session.setAttribute("userxinxi", allusers);
				 session.setAttribute("username", userName);
				 result="yes";
			}
		}
		if(userType.equals("注册用户"))
		{
			String sql = "from TYonghuzhuce where issh='是' and yonghuming=? and mima=?";
			Object[] con={userName,userPw};
			List yonghuzhuceList=yonghuzhuceDAO.getHibernateTemplate().find(sql,con);
			if(yonghuzhuceList.size()==0)
			{
				 result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TYonghuzhuce yonghuzhuce=(TYonghuzhuce)yonghuzhuceList.get(0);
				 session.setAttribute("cx", userType);
				 session.setAttribute("userxinxi", yonghuzhuce);
				 session.setAttribute("username", userName);
				 result="yes";
			}
		}
		
		if(userType.equals("用户"))
		{
			String sql = "from TYonghu where 3=3 and zhanghao=? and mima=?";
			Object[] con={userName,userPw};
			List yonghuList=yonghuDAO.getHibernateTemplate().find(sql,con);
			if(yonghuList.size()==0)
			{
				 result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TYonghu yonghu=(TYonghu)yonghuList.get(0);
				 session.setAttribute("cx", userType);
				 session.setAttribute("userxinxi", yonghu);
				 session.setAttribute("username", userName);
				 result="yes";
			}
		}	//jixacicxhu5
		
		return result;
	}


	
	
	public String yonghuzhucePwEdit(String userPwNew)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		 
		TYonghuzhuce yonghuzhuce=(TYonghuzhuce)session.getAttribute("userxinxi");
		yonghuzhuce.setMima(userPwNew);
		
		yonghuzhuceDAO.getHibernateTemplate().update(yonghuzhuce);
		session.setAttribute("yonghuzhuce", yonghuzhuce);
		
		return "yes";
    }
	
	public String allusersPwEdit(String userPwNew)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		 
		TAllusers allusers=(TAllusers)session.getAttribute("userxinxi");
		allusers.setPwd(userPwNew);
		
		allusersDAO.getHibernateTemplate().update(allusers);
		session.setAttribute("allusers", allusers);
		
		return "yes";
    }
	
	public String yonghuPwEdit(String userPwNew)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		 
		TYonghu yonghu=(TYonghu)session.getAttribute("userxinxi");
		yonghu.setMima(userPwNew);
		
		yonghuDAO.getHibernateTemplate().update(yonghu);
		session.setAttribute("yonghu", yonghu);
		
		return "yes";
    }	//jixacicxhu6
  
	
    
  
	public String allusersjiance(String userName)
    {
		String sql="from TAllusers where username='"+userName+"'";
		List allusersList=allusersDAO.getHibernateTemplate().find(sql);
		if(allusersList.size()>0)
		{
			return "Y";
		}
		else
		{
			return "N";
		}
    }
	
	public String jiance(String userName)
    {
		String sql="from TYonghuzhuce where yonghuming='"+userName+"'";
		List yonghuzhuceList=yonghuzhuceDAO.getHibernateTemplate().find(sql);
		if(yonghuzhuceList.size()>0)
		{
			return "Y";
		}
		else
		{
			return "N";
		}
    }
	
	//jixacicxhu7
    
}

