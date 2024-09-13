package com.action;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;


import com.dao.TYouqinglianjieDAO;

import com.model.TYouqinglianjie;

import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import com.util.db;
import java.util.ArrayList;

public class youqinglianjieAction extends ActionSupport
{
	private int id;
	
	private String wangzhanmingcheng;	private String wangzhi;	private String logo;	
	
	private String addtime;
	private String message;
	private String path;
	private ResultSet rs;
	private List list;
	
	private TYouqinglianjieDAO youqinglianjieDAO;
	

	
	public String youqinglianjieAdd()
	{
		TYouqinglianjie youqinglianjie=new TYouqinglianjie();
		
		
		youqinglianjie.setWangzhanmingcheng(wangzhanmingcheng);		youqinglianjie.setWangzhi(wangzhi);		youqinglianjie.setLogo(logo);		youqinglianjie.setAddtime(addtime);		
		
		
		
		youqinglianjieDAO.save(youqinglianjie);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "添加成功");
		request.put("msg", "<script>javascript:alert('操作成功！');history.back();</script>");
		return "msg";
	}
	
	
	
	public String youqinglianjieList()
	{
		
		
	    HttpServletRequest request=ServletActionContext.getRequest();
		int index=0;
		if(request.getParameter("index")==null)
		{
			index=1;
		}
		else
		{
			index=Integer.parseInt(request.getParameter("index"));
		}
		int hsgpagesize=20;
		String sql = "from TYouqinglianjie where 1=1 ";
		if(wangzhanmingcheng!=null){sql=sql+" and wangzhanmingcheng like '%"+wangzhanmingcheng.trim()+"%'";}		if(wangzhi!=null){sql=sql+" and wangzhi like '%"+wangzhi.trim()+"%'";}		if(logo!=null){sql=sql+" and logo like '%"+logo.trim()+"%'";}		
		sql=sql+" order by id desc";
		List youqinglianjieList=youqinglianjieDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, youqinglianjieList.size());
		List youqinglianjieList1 = youqinglianjieList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(youqinglianjieList.size());//设置总共的条数
        p.setData(youqinglianjieList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	public String youqinglianjieList_yanben1()
	{
		
		
	    HttpServletRequest request=ServletActionContext.getRequest();
		int index=0;
		if(request.getParameter("index")==null)
		{
			index=1;
		}
		else
		{
			index=Integer.parseInt(request.getParameter("index"));
		}
		int hsgpagesize=20;
		String sql = "from TYouqinglianjie where 1=1 ";
		if(wangzhanmingcheng!=null){sql=sql+" and wangzhanmingcheng like '%"+wangzhanmingcheng.trim()+"%'";}		if(wangzhi!=null){sql=sql+" and wangzhi like '%"+wangzhi.trim()+"%'";}		if(logo!=null){sql=sql+" and logo like '%"+logo.trim()+"%'";}		
		sql=sql+" order by id desc";
		List youqinglianjieList=youqinglianjieDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, youqinglianjieList.size());
		List youqinglianjieList1 = youqinglianjieList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(youqinglianjieList.size());//设置总共的条数
        p.setData(youqinglianjieList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	public String youqinglianjieList_yanben2()
	{
		
		
	    HttpServletRequest request=ServletActionContext.getRequest();
		int index=0;
		if(request.getParameter("index")==null)
		{
			index=1;
		}
		else
		{
			index=Integer.parseInt(request.getParameter("index"));
		}
		int hsgpagesize=20;
		String sql = "from TYouqinglianjie where 1=1 ";
		if(wangzhanmingcheng!=null){sql=sql+" and wangzhanmingcheng like '%"+wangzhanmingcheng.trim()+"%'";}		if(wangzhi!=null){sql=sql+" and wangzhi like '%"+wangzhi.trim()+"%'";}		if(logo!=null){sql=sql+" and logo like '%"+logo.trim()+"%'";}		
		sql=sql+" order by id desc";
		List youqinglianjieList=youqinglianjieDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, youqinglianjieList.size());
		List youqinglianjieList1 = youqinglianjieList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(youqinglianjieList.size());//设置总共的条数
        p.setData(youqinglianjieList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	public String youqinglianjieList_yanben3()
	{
		
		
	    HttpServletRequest request=ServletActionContext.getRequest();
		int index=0;
		if(request.getParameter("index")==null)
		{
			index=1;
		}
		else
		{
			index=Integer.parseInt(request.getParameter("index"));
		}
		int hsgpagesize=20;
		String sql = "from TYouqinglianjie where 1=1 ";
		if(wangzhanmingcheng!=null){sql=sql+" and wangzhanmingcheng like '%"+wangzhanmingcheng.trim()+"%'";}		if(wangzhi!=null){sql=sql+" and wangzhi like '%"+wangzhi.trim()+"%'";}		if(logo!=null){sql=sql+" and logo like '%"+logo.trim()+"%'";}		
		sql=sql+" order by id desc";
		List youqinglianjieList=youqinglianjieDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, youqinglianjieList.size());
		List youqinglianjieList1 = youqinglianjieList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(youqinglianjieList.size());//设置总共的条数
        p.setData(youqinglianjieList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	public String youqinglianjieList_yanben4()
	{
		
		
	    HttpServletRequest request=ServletActionContext.getRequest();
		int index=0;
		if(request.getParameter("index")==null)
		{
			index=1;
		}
		else
		{
			index=Integer.parseInt(request.getParameter("index"));
		}
		int hsgpagesize=20;
		String sql = "from TYouqinglianjie where 1=1 ";
		if(wangzhanmingcheng!=null){sql=sql+" and wangzhanmingcheng like '%"+wangzhanmingcheng.trim()+"%'";}		if(wangzhi!=null){sql=sql+" and wangzhi like '%"+wangzhi.trim()+"%'";}		if(logo!=null){sql=sql+" and logo like '%"+logo.trim()+"%'";}		
		sql=sql+" order by id desc";
		List youqinglianjieList=youqinglianjieDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, youqinglianjieList.size());
		List youqinglianjieList1 = youqinglianjieList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(youqinglianjieList.size());//设置总共的条数
        p.setData(youqinglianjieList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	public String youqinglianjieList_yanben5()
	{
		
		
	    HttpServletRequest request=ServletActionContext.getRequest();
		int index=0;
		if(request.getParameter("index")==null)
		{
			index=1;
		}
		else
		{
			index=Integer.parseInt(request.getParameter("index"));
		}
		int hsgpagesize=20;
		String sql = "from TYouqinglianjie where 1=1 ";
		if(wangzhanmingcheng!=null){sql=sql+" and wangzhanmingcheng like '%"+wangzhanmingcheng.trim()+"%'";}		if(wangzhi!=null){sql=sql+" and wangzhi like '%"+wangzhi.trim()+"%'";}		if(logo!=null){sql=sql+" and logo like '%"+logo.trim()+"%'";}		
		sql=sql+" order by id desc";
		List youqinglianjieList=youqinglianjieDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, youqinglianjieList.size());
		List youqinglianjieList1 = youqinglianjieList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(youqinglianjieList.size());//设置总共的条数
        p.setData(youqinglianjieList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	
	//youtplisxt
	
	
	
	public String youqinglianjieDel()
	{
		String sql = "delete from TYouqinglianjie where id=?";
		Object[] o={id};
		youqinglianjieDAO.getHibernateTemplate().bulkUpdate(sql, o);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	
	
	public String youqinglianjiePre()
	{
		TYouqinglianjie youqinglianjie=youqinglianjieDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("youqinglianjie", youqinglianjie);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	
	
	
	

	public String youqinglianjieUpdt()
	{
		TYouqinglianjie youqinglianjie=youqinglianjieDAO.findById(id);
		
		youqinglianjie.setWangzhanmingcheng(wangzhanmingcheng);		youqinglianjie.setWangzhi(wangzhi);		youqinglianjie.setLogo(logo);		
		
		youqinglianjieDAO.attachDirty(youqinglianjie);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	

		public String getWangzhanmingcheng()
	{
		return wangzhanmingcheng;
	}
	public void setWangzhanmingcheng(String wangzhanmingcheng)
	{
		this.wangzhanmingcheng = wangzhanmingcheng;
	}		public String getWangzhi()
	{
		return wangzhi;
	}
	public void setWangzhi(String wangzhi)
	{
		this.wangzhi = wangzhi;
	}		public String getLogo()
	{
		return logo;
	}
	public void setLogo(String logo)
	{
		this.logo = logo;
	}	
	
	
	
	
	public String getAddtime()
	{
		return addtime;
	}
	public void setAddtime(String addtime)
	{
		this.addtime = addtime;
	}
	


	public TYouqinglianjieDAO getYouqinglianjieDAO()
	{
		return youqinglianjieDAO;
	}

	public void setYouqinglianjieDAO(TYouqinglianjieDAO youqinglianjieDAO)
	{
		this.youqinglianjieDAO = youqinglianjieDAO;
	}

	

	



	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
	}






	public String getPath()
	{
		return path;
	}



	public void setPath(String path)
	{
		this.path = path;
	}



	
	
}

