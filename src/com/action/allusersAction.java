package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TAllusersDAO;
import com.model.TAllusers;
import com.opensymphony.xwork2.ActionSupport;

public class allusersAction extends ActionSupport
{
	private int id;
	private String username;
	private String pwd;
	private String cx;
	private String message;
	private String path;
	private String addtime;
	
	private int index=1;

	private TAllusersDAO allusersDAO;
	
	
	public String allusersAdd()
	{
		TAllusers allusers=new TAllusers();
		allusers.setUsername(username);
		allusers.setPwd(pwd);
		allusers.setCx("普通管理员");
		allusers.setAddtime(addtime);
		allusersDAO.save(allusers);
		this.setMessage("操作成功");
		this.setPath("allusersList.action");
		return "succeed";
	}
	
	
	
	public String allusersList()
	{
		List allusersList=allusersDAO.findAll();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("allusersList", allusersList);
		return ActionSupport.SUCCESS;
	}
	
	public String allusersDel()
	{
		allusersDAO.delete(allusersDAO.findById(id));
		this.setMessage("删除成功");
		this.setPath("allusersList.action");
		return "succeed";
	}
	
	

	public TAllusersDAO getAllusersDAO()
	{
		return allusersDAO;
	}

	public void setAllusersDAO(TAllusersDAO allusersDAO)
	{
		this.allusersDAO = allusersDAO;
	}

	public String getMessage()
	{
		return message;
	}

	public int getIndex()
	{
		return index;
	}



	public void setIndex(int index)
	{
		this.index = index;
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

	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getPwd()
	{
		return pwd;
	}

	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}
	 
	 
	public String getAddtime()
	{
		return addtime;
	}
	public void setAddtime(String addtime)
	{
		this.addtime = addtime;
	}
}
