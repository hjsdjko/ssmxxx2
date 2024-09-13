package com.action;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;


import com.dao.TDingdanxinxiDAO;

import com.model.TDingdanxinxi;

import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import com.util.db;
import java.util.ArrayList;

public class dingdanxinxiAction extends ActionSupport
{
	private int id;
	
	private String dingdanhao;
	private String dingdanneirong;
	private String dingdanjine;
	private String goumairen;
	private String dianhua;
	private String dizhi;
	private String beizhu;
	private String iszf;
	
	
	private String addtime;
	private String message;
	private String path;
	private ResultSet rs;
	private List list;
	
	private TDingdanxinxiDAO dingdanxinxiDAO;
	

	
	public String dingdanxinxiAdd()
	{
		TDingdanxinxi dingdanxinxi=new TDingdanxinxi();
		
		
		dingdanxinxi.setDingdanhao(dingdanhao);
		dingdanxinxi.setDingdanneirong(dingdanneirong);
		dingdanxinxi.setDingdanjine(dingdanjine);
		dingdanxinxi.setGoumairen(goumairen);
		dingdanxinxi.setDianhua(dianhua);
		dingdanxinxi.setDizhi(dizhi);
		dingdanxinxi.setBeizhu(beizhu);
		dingdanxinxi.setIszf("否");
		dingdanxinxi.setAddtime(addtime);
		
		
		
		
		dingdanxinxiDAO.save(dingdanxinxi);
		HttpServletRequest request2=ServletActionContext.getRequest();
		String dd="update t_goumai set issh='是' where goumairen='"+(String)request2.getSession().getAttribute("username")+"'";
		db dbo = new db();
		dbo.hsgexecute(dd);
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "添加成功");
		request.put("msg", "<script>javascript:alert('操作成功！');history.back();</script>");
		return "msg";
	}
	public String getddnr(String nuser){
		String sql = "select shangpinmingcheng,goumaishuliang from t_goumai where goumairen = '"+nuser+"' and issh='否'  ";
		db dbo = new db();
		list = new ArrayList();
		
		String ddnr="";
		try{
			rs = dbo.executeQuery(sql);
			while(rs.next()){
                   // list.add(rs.getString(1));
					//list.add(rs.getString(2));
					ddnr=ddnr+"药品名称："+rs.getString(1)+"，购买数量："+rs.getString(2)+"；\r\n";
			}
			return ddnr;
		}catch(Exception e){
			e.printStackTrace();
			return ddnr;
		}
	}
	
	
	public String dingdanxinxiList()
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
		String sql = "from TDingdanxinxi where 1=1 ";
		if(dingdanhao!=null){sql=sql+" and dingdanhao like '%"+dingdanhao.trim()+"%'";}
		if(dingdanneirong!=null){sql=sql+" and dingdanneirong like '%"+dingdanneirong.trim()+"%'";}
		if(dingdanjine!=null){sql=sql+" and dingdanjine like '%"+dingdanjine.trim()+"%'";}
		if(goumairen!=null){sql=sql+" and goumairen like '%"+goumairen.trim()+"%'";}
		if(dianhua!=null){sql=sql+" and dianhua like '%"+dianhua.trim()+"%'";}
		if(dizhi!=null){sql=sql+" and dizhi like '%"+dizhi.trim()+"%'";}
		if(beizhu!=null){sql=sql+" and beizhu like '%"+beizhu.trim()+"%'";}
		
		sql=sql+" order by id desc";
		List dingdanxinxiList=dingdanxinxiDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, dingdanxinxiList.size());
		List dingdanxinxiList1 = dingdanxinxiList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(dingdanxinxiList.size());//设置总共的条数
        p.setData(dingdanxinxiList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	//youtplisxt
	
	public String dingdanxinxiList2()
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
		
		String sql = "from TDingdanxinxi where goumairen='"+(String)request.getSession().getAttribute("username")+"' ";
		if(dingdanhao!=null){sql=sql+" and dingdanhao like '%"+dingdanhao.trim()+"%'";}
		if(dingdanneirong!=null){sql=sql+" and dingdanneirong like '%"+dingdanneirong.trim()+"%'";}
		if(dingdanjine!=null){sql=sql+" and dingdanjine like '%"+dingdanjine.trim()+"%'";}
		if(goumairen!=null){sql=sql+" and goumairen like '%"+goumairen.trim()+"%'";}
		if(dianhua!=null){sql=sql+" and dianhua like '%"+dianhua.trim()+"%'";}
		if(dizhi!=null){sql=sql+" and dizhi like '%"+dizhi.trim()+"%'";}
		if(beizhu!=null){sql=sql+" and beizhu like '%"+beizhu.trim()+"%'";}
		
		sql=sql+" order by id desc";
		List dingdanxinxiList=dingdanxinxiDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * Pagesize.size;
		int toIndex = Math.min(fromIndex + Pagesize.size, dingdanxinxiList.size());
		List dingdanxinxiList1 = dingdanxinxiList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(Pagesize.size);
        p.setTotle(dingdanxinxiList.size());//设置总共的条数
        p.setData(dingdanxinxiList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	public String dingdanxinxiDel()
	{
		String sql = "delete from TDingdanxinxi where id=?";
		Object[] o={id};
		dingdanxinxiDAO.getHibernateTemplate().bulkUpdate(sql, o);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	
	
	public String dingdanxinxiPre()
	{
		TDingdanxinxi dingdanxinxi=dingdanxinxiDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("dingdanxinxi", dingdanxinxi);
		return ActionSupport.SUCCESS;
	}
	
	public String dingdanxinxiDetail()
	{
		TDingdanxinxi dingdanxinxi=dingdanxinxiDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("dingdanxinxi", dingdanxinxi);
		return ActionSupport.SUCCESS;
	}
	
	public String ddxxDetail()
	{
		//daxidixanzxan
		TDingdanxinxi dingdanxinxi=dingdanxinxiDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("dingdanxinxi", dingdanxinxi);
		return ActionSupport.SUCCESS;
	}
	
	
	
	//yoxulb
	
	

	public String dingdanxinxiUpdt()
	{
		TDingdanxinxi dingdanxinxi=dingdanxinxiDAO.findById(id);
		
		dingdanxinxi.setDingdanhao(dingdanhao);
		dingdanxinxi.setDingdanneirong(dingdanneirong);
		dingdanxinxi.setDingdanjine(dingdanjine);
		dingdanxinxi.setGoumairen(goumairen);
		dingdanxinxi.setDianhua(dianhua);
		dingdanxinxi.setDizhi(dizhi);
		dingdanxinxi.setBeizhu(beizhu);
		
		
		dingdanxinxiDAO.attachDirty(dingdanxinxi);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	

		public String getDingdanhao()
	{
		return dingdanhao;
	}
	public void setDingdanhao(String dingdanhao)
	{
		this.dingdanhao = dingdanhao;
	}
		public String getDingdanneirong()
	{
		return dingdanneirong;
	}
	public void setDingdanneirong(String dingdanneirong)
	{
		this.dingdanneirong = dingdanneirong;
	}
		public String getDingdanjine()
	{
		return dingdanjine;
	}
	public void setDingdanjine(String dingdanjine)
	{
		this.dingdanjine = dingdanjine;
	}
		public String getGoumairen()
	{
		return goumairen;
	}
	public void setGoumairen(String goumairen)
	{
		this.goumairen = goumairen;
	}
		public String getDianhua()
	{
		return dianhua;
	}
	public void setDianhua(String dianhua)
	{
		this.dianhua = dianhua;
	}
		public String getDizhi()
	{
		return dizhi;
	}
	public void setDizhi(String dizhi)
	{
		this.dizhi = dizhi;
	}
		public String getBeizhu()
	{
		return beizhu;
	}
	public void setBeizhu(String beizhu)
	{
		this.beizhu = beizhu;
	}
		public String getIszf()
	{
		return iszf;
	}
	public void setIszf(String iszf)
	{
		this.iszf = iszf;
	}
	
	
	
	
	
	public String getAddtime()
	{
		return addtime;
	}
	public void setAddtime(String addtime)
	{
		this.addtime = addtime;
	}
	


	public TDingdanxinxiDAO getDingdanxinxiDAO()
	{
		return dingdanxinxiDAO;
	}

	public void setDingdanxinxiDAO(TDingdanxinxiDAO dingdanxinxiDAO)
	{
		this.dingdanxinxiDAO = dingdanxinxiDAO;
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

