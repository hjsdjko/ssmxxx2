package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;


import com.dao.TXinwentongzhiDAO;
import com.model.TXinwentongzhi;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;


public class xinwentongzhiAction extends ActionSupport
{
	private int id;
	
	private String biaoti;
	private String leibie;
	private String neirong;
	private String shouyetupian;
	private String dianjilv;
	private String tianjiaren;
	
	
	private String addtime;
	private String message;
	private String path;
	
	private TXinwentongzhiDAO xinwentongzhiDAO;
	
	public String xinwentongzhiAdd()
	{
		TXinwentongzhi xinwentongzhi=new TXinwentongzhi();
		
		xinwentongzhi.setBiaoti(biaoti);
		xinwentongzhi.setLeibie(leibie);
		xinwentongzhi.setNeirong(neirong);
		xinwentongzhi.setShouyetupian(shouyetupian);
		xinwentongzhi.setDianjilv(dianjilv);
		xinwentongzhi.setTianjiaren(tianjiaren);
		xinwentongzhi.setAddtime(addtime);
		
		xinwentongzhiDAO.save(xinwentongzhi);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "添加成功");
		return "msg";
	}
	
	public String news()
	{
		
		//String leibie=request.getParameter("leibie");
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
		String lb=request.getParameter("lb");
		
		String sql = "from TXinwentongzhi where leibie='"+lb+"' ";
		
		if(biaoti!=null){sql=sql+" and biaoti like '%"+biaoti.trim()+"%'";}
		if(leibie!=null){sql=sql+" and leibie like '%"+leibie.trim()+"%'";}
		if(neirong!=null){sql=sql+" and neirong like '%"+neirong.trim()+"%'";}
		if(shouyetupian!=null){sql=sql+" and shouyetupian like '%"+shouyetupian.trim()+"%'";}
		if(dianjilv!=null){sql=sql+" and dianjilv like '%"+dianjilv.trim()+"%'";}
		if(tianjiaren!=null){sql=sql+" and tianjiaren like '%"+tianjiaren.trim()+"%'";}
		
		
		sql=sql+" order by id desc";
		List xinwentongzhiList=xinwentongzhiDAO.getHibernateTemplate().find(sql);
		
		
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, xinwentongzhiList.size());
		List xinwentongzhiList1 = xinwentongzhiList.subList(fromIndex, toIndex);
		
		
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(xinwentongzhiList.size());//设置总共的条数
        p.setData(xinwentongzhiList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}

	
	public String xinwentongzhiList()
	{
		
		//String leibie=request.getParameter("leibie");
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
		String lb=request.getParameter("lb");
		
		String sql = "from TXinwentongzhi where leibie='"+lb+"' ";
		
		if(biaoti!=null){sql=sql+" and biaoti like '%"+biaoti.trim()+"%'";}
		if(leibie!=null){sql=sql+" and leibie like '%"+leibie.trim()+"%'";}
		if(neirong!=null){sql=sql+" and neirong like '%"+neirong.trim()+"%'";}
		if(shouyetupian!=null){sql=sql+" and shouyetupian like '%"+shouyetupian.trim()+"%'";}
		if(dianjilv!=null){sql=sql+" and dianjilv like '%"+dianjilv.trim()+"%'";}
		if(tianjiaren!=null){sql=sql+" and tianjiaren like '%"+tianjiaren.trim()+"%'";}
		
		
		sql=sql+" order by id desc";
		System.out.print(sql);
		List xinwentongzhiList=xinwentongzhiDAO.getHibernateTemplate().find(sql);
		
		
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, xinwentongzhiList.size());
		List xinwentongzhiList1 = xinwentongzhiList.subList(fromIndex, toIndex);
		
		
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(xinwentongzhiList.size());//设置总共的条数
        p.setData(xinwentongzhiList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	public String xinwentongzhiDel()
	{
		String sql = "delete from TXinwentongzhi where id=?";
		Object[] o={id};
		xinwentongzhiDAO.getHibernateTemplate().bulkUpdate(sql, o);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	
	
	public String xinwentongzhiPre()
	{
		TXinwentongzhi xinwentongzhi=xinwentongzhiDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("xinwentongzhi", xinwentongzhi);
		return ActionSupport.SUCCESS;
	}
	public String ggdetail()
	{
		TXinwentongzhi xinwentongzhi=xinwentongzhiDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("ggdetail", xinwentongzhi);
		
		return ActionSupport.SUCCESS;
	}
	

	public String xinwentongzhiUpdt()
	{
		TXinwentongzhi xinwentongzhi=xinwentongzhiDAO.findById(id);
		
		xinwentongzhi.setBiaoti(biaoti);
		xinwentongzhi.setLeibie(leibie);
		xinwentongzhi.setNeirong(neirong);
		xinwentongzhi.setShouyetupian(shouyetupian);
		xinwentongzhi.setDianjilv(dianjilv);
		xinwentongzhi.setTianjiaren(tianjiaren);
		
		
		xinwentongzhiDAO.attachDirty(xinwentongzhi);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	

		public String getBiaoti()
	{
		return biaoti;
	}
	public void setBiaoti(String biaoti)
	{
		this.biaoti = biaoti;
	}
		public String getLeibie()
	{
		return leibie;
	}
	public void setLeibie(String leibie)
	{
		this.leibie = leibie;
	}
		public String getNeirong()
	{
		return neirong;
	}
	public void setNeirong(String neirong)
	{
		this.neirong = neirong;
	}
		public String getShouyetupian()
	{
		return shouyetupian;
	}
	public void setShouyetupian(String shouyetupian)
	{
		this.shouyetupian = shouyetupian;
	}
		public String getDianjilv()
	{
		return dianjilv;
	}
	public void setDianjilv(String dianjilv)
	{
		this.dianjilv = dianjilv;
	}
		public String getTianjiaren()
	{
		return tianjiaren;
	}
	public void setTianjiaren(String tianjiaren)
	{
		this.tianjiaren = tianjiaren;
	}
	
	
	//yoxushexnhe
	
	
	public String getAddtime()
	{
		return addtime;
	}
	public void setAddtime(String addtime)
	{
		this.addtime = addtime;
	}
	


	public TXinwentongzhiDAO getXinwentongzhiDAO()
	{
		return xinwentongzhiDAO;
	}

	public void setXinwentongzhiDAO(TXinwentongzhiDAO xinwentongzhiDAO)
	{
		this.xinwentongzhiDAO = xinwentongzhiDAO;
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

