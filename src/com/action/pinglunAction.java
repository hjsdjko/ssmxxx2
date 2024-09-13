package com.action;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;


import com.dao.TPinglunDAO;

import com.model.TPinglun;

import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;

import java.sql.ResultSet;

import java.util.ArrayList;

public class pinglunAction extends ActionSupport
{
	private int id;
	
	private String xinwenID;
	private String pinglunneirong;
	private String pinglunren;
	private String pingfen;
	private String biao;
	
	
	private String addtime;
	private String message;
	private String path;
	private ResultSet rs;
	private List list;
	
	private TPinglunDAO pinglunDAO;
	

	
	public String pinglunAdd()
	{
		TPinglun pinglun=new TPinglun();
		
		
		pinglun.setXinwenID(xinwenID);
		pinglun.setPinglunneirong(pinglunneirong);
		pinglun.setPinglunren(pinglunren);
		pinglun.setPingfen(pingfen);
		pinglun.setBiao(biao);
		pinglun.setAddtime(addtime);
		
		pinglunDAO.save(pinglun);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "添加成功");
		request.put("msg", "<script>javascript:alert('操作成功！'); parent.location=parent.location; </script>");
		return "msg";
	}
	
	
	
	public String pinglunList()
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
		String sql = "from TPinglun where 1=1 ";
		if(xinwenID!=null){sql=sql+" and xinwenID like '%"+xinwenID.trim()+"%'";}
		if(pinglunneirong!=null){sql=sql+" and pinglunneirong like '%"+pinglunneirong.trim()+"%'";}
		if(pinglunren!=null){sql=sql+" and pinglunren like '%"+pinglunren.trim()+"%'";}
		if(pingfen!=null){sql=sql+" and pingfen like '%"+pingfen.trim()+"%'";}
		if(biao!=null){sql=sql+" and biao like '%"+biao.trim()+"%'";}
		
		sql=sql+" order by id desc";
		List pinglunList=pinglunDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, pinglunList.size());
		List pinglunList1 = pinglunList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(pinglunList.size());//设置总共的条数
        p.setData(pinglunList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	
	public String pinglunDel()
	{
		String sql = "delete from TPinglun where id=?";
		Object[] o={id};
		pinglunDAO.getHibernateTemplate().bulkUpdate(sql, o);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	
	
	public String pinglunPre()
	{
		TPinglun pinglun=pinglunDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("pinglun", pinglun);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	
	
	
	

	public String pinglunUpdt()
	{
		TPinglun pinglun=pinglunDAO.findById(id);
		
		pinglun.setXinwenID(xinwenID);
		pinglun.setPinglunneirong(pinglunneirong);
		pinglun.setPinglunren(pinglunren);
		pinglun.setPingfen(pingfen);
		pinglun.setBiao(biao);
		
		
		pinglunDAO.attachDirty(pinglun);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	

		public String getXinwenID()
	{
		return xinwenID;
	}
	public void setXinwenID(String xinwenID)
	{
		this.xinwenID = xinwenID;
	}
		public String getPinglunneirong()
	{
		return pinglunneirong;
	}
	public void setPinglunneirong(String pinglunneirong)
	{
		this.pinglunneirong = pinglunneirong;
	}
		public String getPinglunren()
	{
		return pinglunren;
	}
	public void setPinglunren(String pinglunren)
	{
		this.pinglunren = pinglunren;
	}
		public String getPingfen()
	{
		return pingfen;
	}
	public void setPingfen(String pingfen)
	{
		this.pingfen = pingfen;
	}
		public String getBiao()
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
	


	public TPinglunDAO getPinglunDAO()
	{
		return pinglunDAO;
	}

	public void setPinglunDAO(TPinglunDAO pinglunDAO)
	{
		this.pinglunDAO = pinglunDAO;
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

