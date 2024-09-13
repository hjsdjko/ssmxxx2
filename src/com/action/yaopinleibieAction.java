package com.action;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;


import com.dao.TYaopinleibieDAO;

import com.model.TYaopinleibie;

import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import com.util.db;
import java.util.ArrayList;

public class yaopinleibieAction extends ActionSupport
{
	private int id;
	
	private String leibie;	
	
	private String addtime;
	private String message;
	private String path;
	private ResultSet rs;
	private List list;
	
	private TYaopinleibieDAO yaopinleibieDAO;
	

	
	public String yaopinleibieAdd()
	{
		TYaopinleibie yaopinleibie=new TYaopinleibie();
		
		
		yaopinleibie.setLeibie(leibie);		yaopinleibie.setAddtime(addtime);		
		
		
		
		yaopinleibieDAO.save(yaopinleibie);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "添加成功");
		request.put("msg", "<script>javascript:alert('操作成功！');history.back();</script>");
		return "msg";
	}
	
	
	
	public String yaopinleibieList()
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
		String sql = "from TYaopinleibie where 1=1 ";
		if(leibie!=null){sql=sql+" and leibie like '%"+leibie.trim()+"%'";}		
		sql=sql+" order by id desc";
		List yaopinleibieList=yaopinleibieDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, yaopinleibieList.size());
		List yaopinleibieList1 = yaopinleibieList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(yaopinleibieList.size());//设置总共的条数
        p.setData(yaopinleibieList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	//youtplisxt
	
	
	
	public String yaopinleibieDel()
	{
		String sql = "delete from TYaopinleibie where id=?";
		Object[] o={id};
		yaopinleibieDAO.getHibernateTemplate().bulkUpdate(sql, o);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	
	
	public String yaopinleibiePre()
	{
		TYaopinleibie yaopinleibie=yaopinleibieDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yaopinleibie", yaopinleibie);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	
	
	
	//yoxulb
	
	

	public String yaopinleibieUpdt()
	{
		TYaopinleibie yaopinleibie=yaopinleibieDAO.findById(id);
		
		yaopinleibie.setLeibie(leibie);		
		
		yaopinleibieDAO.attachDirty(yaopinleibie);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	

		public String getLeibie()
	{
		return leibie;
	}
	public void setLeibie(String leibie)
	{
		this.leibie = leibie;
	}	
	
	
	
	
	public String getAddtime()
	{
		return addtime;
	}
	public void setAddtime(String addtime)
	{
		this.addtime = addtime;
	}
	


	public TYaopinleibieDAO getYaopinleibieDAO()
	{
		return yaopinleibieDAO;
	}

	public void setYaopinleibieDAO(TYaopinleibieDAO yaopinleibieDAO)
	{
		this.yaopinleibieDAO = yaopinleibieDAO;
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

