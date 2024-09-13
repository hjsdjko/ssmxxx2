package com.action;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;


import com.dao.TShoucangjiluDAO;

import com.model.TShoucangjilu;

import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import com.util.db;
import java.util.ArrayList;

public class shoucangjiluAction extends ActionSupport
{
	private int id;
	
	private String username;	private String xwid;	private String ziduan;	private String biao;	
	
	private String addtime;
	private String message;
	private String path;
	private ResultSet rs;
	private List list;
	
	private TShoucangjiluDAO shoucangjiluDAO;
	

	
	public String shoucangjiluAdd()
	{
		TShoucangjilu shoucangjilu=new TShoucangjilu();
		
		
		shoucangjilu.setUsername(username);		shoucangjilu.setXwid(xwid);		shoucangjilu.setZiduan(ziduan);		shoucangjilu.setBiao(biao);		shoucangjilu.setAddtime(addtime);		
		
		
		
		shoucangjiluDAO.save(shoucangjilu);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "添加成功");
		request.put("msg", "<script>javascript:alert('操作成功！');history.back();</script>");
		return "msg";
	}
	
	
	
	public String shoucangjiluList()
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
		String sql = "from TShoucangjilu where 1=1 ";
		if(username!=null){sql=sql+" and username like '%"+username.trim()+"%'";}		if(xwid!=null){sql=sql+" and xwid like '%"+xwid.trim()+"%'";}		if(ziduan!=null){sql=sql+" and ziduan like '%"+ziduan.trim()+"%'";}		if(biao!=null){sql=sql+" and biao like '%"+biao.trim()+"%'";}		
		sql=sql+" order by id desc";
		List shoucangjiluList=shoucangjiluDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, shoucangjiluList.size());
		List shoucangjiluList1 = shoucangjiluList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(shoucangjiluList.size());//设置总共的条数
        p.setData(shoucangjiluList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String shoucangjiluList2()
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
		
		String sql = "from TShoucangjilu where username='"+(String)request.getSession().getAttribute("username")+"' ";
		if(username!=null){sql=sql+" and username like '%"+username.trim()+"%'";}		if(xwid!=null){sql=sql+" and xwid like '%"+xwid.trim()+"%'";}		if(ziduan!=null){sql=sql+" and ziduan like '%"+ziduan.trim()+"%'";}		if(biao!=null){sql=sql+" and biao like '%"+biao.trim()+"%'";}		
		sql=sql+" order by id desc";
		List shoucangjiluList=shoucangjiluDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * Pagesize.size;
		int toIndex = Math.min(fromIndex + Pagesize.size, shoucangjiluList.size());
		List shoucangjiluList1 = shoucangjiluList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(Pagesize.size);
        p.setTotle(shoucangjiluList.size());//设置总共的条数
        p.setData(shoucangjiluList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}	
	
	public String shoucangjiluDel()
	{
		String sql = "delete from TShoucangjilu where id=?";
		Object[] o={id};
		shoucangjiluDAO.getHibernateTemplate().bulkUpdate(sql, o);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	
	
	public String shoucangjiluPre()
	{
		TShoucangjilu shoucangjilu=shoucangjiluDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shoucangjilu", shoucangjilu);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	
	
	
	

	public String shoucangjiluUpdt()
	{
		TShoucangjilu shoucangjilu=shoucangjiluDAO.findById(id);
		
		shoucangjilu.setUsername(username);		shoucangjilu.setXwid(xwid);		shoucangjilu.setZiduan(ziduan);		shoucangjilu.setBiao(biao);		
		
		shoucangjiluDAO.attachDirty(shoucangjilu);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	

		public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}		public String getXwid()
	{
		return xwid;
	}
	public void setXwid(String xwid)
	{
		this.xwid = xwid;
	}		public String getZiduan()
	{
		return ziduan;
	}
	public void setZiduan(String ziduan)
	{
		this.ziduan = ziduan;
	}		public String getBiao()
	{
		return biao;
	}
	public void setBiao(String biao)
	{
		this.biao = biao;
	}	
	
	
	
	
	public String getAddtime()
	{
		return addtime;
	}
	public void setAddtime(String addtime)
	{
		this.addtime = addtime;
	}
	


	public TShoucangjiluDAO getShoucangjiluDAO()
	{
		return shoucangjiluDAO;
	}

	public void setShoucangjiluDAO(TShoucangjiluDAO shoucangjiluDAO)
	{
		this.shoucangjiluDAO = shoucangjiluDAO;
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

