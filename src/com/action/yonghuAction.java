package com.action;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;


import com.dao.TYonghuDAO;

import com.model.TYonghu;

import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import com.util.db;
import java.util.ArrayList;
import com.opensymphony.xwork2.ActionContext;
public class yonghuAction extends ActionSupport
{
	private int id;
	
	private String zhanghao;	private String mima;	private String xingming;	private String xingbie;	private String shouji;	private String shenfenzheng;	private String zhaopian;	private String beizhu;	
	
	private String addtime;
	private String message;
	private String path;
	private ResultSet rs;
	private List list;
	
	private TYonghuDAO yonghuDAO;
	

	
	public String yonghuAdd()
	{
		TYonghu yonghu=new TYonghu();
		
		
		yonghu.setZhanghao(zhanghao);		yonghu.setMima(mima);		yonghu.setXingming(xingming);		yonghu.setXingbie(xingbie);		yonghu.setShouji(shouji);		yonghu.setShenfenzheng(shenfenzheng);		yonghu.setZhaopian(zhaopian);		yonghu.setBeizhu(beizhu);		yonghu.setAddtime(addtime);		
		
		
		
		yonghuDAO.save(yonghu);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "添加成功");
		request.put("msg", "<script>javascript:alert('操作成功！');history.back();</script>");
		return "msg";
	}
	
	
	
	public String yonghuList()
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
		String sql = "from TYonghu where 1=1 ";
		if(zhanghao!=null){sql=sql+" and zhanghao like '%"+zhanghao.trim()+"%'";}		if(mima!=null){sql=sql+" and mima like '%"+mima.trim()+"%'";}		if(xingming!=null){sql=sql+" and xingming like '%"+xingming.trim()+"%'";}		if(xingbie!=null){sql=sql+" and xingbie like '%"+xingbie.trim()+"%'";}		if(shouji!=null){sql=sql+" and shouji like '%"+shouji.trim()+"%'";}		if(shenfenzheng!=null){sql=sql+" and shenfenzheng like '%"+shenfenzheng.trim()+"%'";}		if(zhaopian!=null){sql=sql+" and zhaopian like '%"+zhaopian.trim()+"%'";}		if(beizhu!=null){sql=sql+" and beizhu like '%"+beizhu.trim()+"%'";}		
		sql=sql+" order by id desc";
		List yonghuList=yonghuDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, yonghuList.size());
		List yonghuList1 = yonghuList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(yonghuList.size());//设置总共的条数
        p.setData(yonghuList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	//youtplisxt
	
	
	
	public String yonghuDel()
	{
		String sql = "delete from TYonghu where id=?";
		Object[] o={id};
		yonghuDAO.getHibernateTemplate().bulkUpdate(sql, o);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	
	
	public String yonghuPre()
	{
		TYonghu yonghu=yonghuDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yonghu", yonghu);
		return ActionSupport.SUCCESS;
	}
	
	public String yonghuDetail()
	{
		TYonghu yonghu=yonghuDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yonghu", yonghu);
		return ActionSupport.SUCCESS;
	}
	
	public String yhDetail()
	{
		//daxidixanzxan
		TYonghu yonghu=yonghuDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yonghu", yonghu);
		return ActionSupport.SUCCESS;
	}
	
	public String yonghuPre2()
	{
		int nid=0;

		Map session=ActionContext.getContext().getSession();
		
		if(session.get("userxinxi")!=null)
		{
			TYonghu user=(TYonghu)session.get("userxinxi");
			nid=user.getId();
		}
		
		TYonghu yonghu=yonghuDAO.findById(nid);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yonghu", yonghu);
		return ActionSupport.SUCCESS;
	}
	
	public String yonghuUpdt2()
	{
		TYonghu yonghu=yonghuDAO.findById(id);
		
		yonghu.setZhanghao(zhanghao);		yonghu.setMima(mima);		yonghu.setXingming(xingming);		yonghu.setXingbie(xingbie);		yonghu.setShouji(shouji);		yonghu.setShenfenzheng(shenfenzheng);		yonghu.setZhaopian(zhaopian);		yonghu.setBeizhu(beizhu);		
		
		yonghuDAO.attachDirty(yonghu);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "操作成功");
		request.put("msg", "<script>javascript:alert('操作成功！');history.back();</script>");
		return "msg";
	}
	
	//yoxulb
	
	

	public String yonghuUpdt()
	{
		TYonghu yonghu=yonghuDAO.findById(id);
		
		yonghu.setZhanghao(zhanghao);		yonghu.setMima(mima);		yonghu.setXingming(xingming);		yonghu.setXingbie(xingbie);		yonghu.setShouji(shouji);		yonghu.setShenfenzheng(shenfenzheng);		yonghu.setZhaopian(zhaopian);		yonghu.setBeizhu(beizhu);		
		
		yonghuDAO.attachDirty(yonghu);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	

		public String getZhanghao()
	{
		return zhanghao;
	}
	public void setZhanghao(String zhanghao)
	{
		this.zhanghao = zhanghao;
	}		public String getMima()
	{
		return mima;
	}
	public void setMima(String mima)
	{
		this.mima = mima;
	}		public String getXingming()
	{
		return xingming;
	}
	public void setXingming(String xingming)
	{
		this.xingming = xingming;
	}		public String getXingbie()
	{
		return xingbie;
	}
	public void setXingbie(String xingbie)
	{
		this.xingbie = xingbie;
	}		public String getShouji()
	{
		return shouji;
	}
	public void setShouji(String shouji)
	{
		this.shouji = shouji;
	}		public String getShenfenzheng()
	{
		return shenfenzheng;
	}
	public void setShenfenzheng(String shenfenzheng)
	{
		this.shenfenzheng = shenfenzheng;
	}		public String getZhaopian()
	{
		return zhaopian;
	}
	public void setZhaopian(String zhaopian)
	{
		this.zhaopian = zhaopian;
	}		public String getBeizhu()
	{
		return beizhu;
	}
	public void setBeizhu(String beizhu)
	{
		this.beizhu = beizhu;
	}	
	
	
	
	
	public String getAddtime()
	{
		return addtime;
	}
	public void setAddtime(String addtime)
	{
		this.addtime = addtime;
	}
	


	public TYonghuDAO getYonghuDAO()
	{
		return yonghuDAO;
	}

	public void setYonghuDAO(TYonghuDAO yonghuDAO)
	{
		this.yonghuDAO = yonghuDAO;
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

