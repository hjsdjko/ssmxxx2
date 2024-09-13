package com.action;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;


import com.dao.TShangpinxinxiDAO;

import com.model.TShangpinxinxi;

import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import com.util.db;
import java.util.ArrayList;

public class shangpinxinxiAction extends ActionSupport
{
	private int id;
	
	private String shangpinbianhao;	private String shangpinmingcheng;	private String shangpinleibie;	private String zhiyaogongsi;	private String jiage;	private String kucun;	private String xiaoliang;	private String tupian;	private String yaopinjianjie;	private String yaoxiao;	private String dianzan_d;	private String dianzan_c;	
	
	private String addtime;
	private String message;
	private String path;
	private ResultSet rs;
	private List list;
	
	private TShangpinxinxiDAO shangpinxinxiDAO;
	

	
	public String shangpinxinxiAdd()
	{
		TShangpinxinxi shangpinxinxi=new TShangpinxinxi();
		
		
		shangpinxinxi.setShangpinbianhao(shangpinbianhao);		shangpinxinxi.setShangpinmingcheng(shangpinmingcheng);		shangpinxinxi.setShangpinleibie(shangpinleibie);		shangpinxinxi.setZhiyaogongsi(zhiyaogongsi);		shangpinxinxi.setJiage(jiage);		shangpinxinxi.setKucun(kucun);		shangpinxinxi.setXiaoliang(xiaoliang);		shangpinxinxi.setTupian(tupian);		shangpinxinxi.setYaopinjianjie(yaopinjianjie);		shangpinxinxi.setYaoxiao(yaoxiao);		shangpinxinxi.setDianzan_d("0");		shangpinxinxi.setDianzan_c("0");		shangpinxinxi.setAddtime(addtime);		
		
		
		
		shangpinxinxiDAO.save(shangpinxinxi);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "添加成功");
		request.put("msg", "<script>javascript:alert('操作成功！');history.back();</script>");
		return "msg";
	}
	
	
	
	public String shangpinxinxiList()
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
		String sql = "from TShangpinxinxi where 1=1 ";
		if(shangpinbianhao!=null){sql=sql+" and shangpinbianhao like '%"+shangpinbianhao.trim()+"%'";}		if(shangpinmingcheng!=null){sql=sql+" and shangpinmingcheng like '%"+shangpinmingcheng.trim()+"%'";}		if(shangpinleibie!=null){sql=sql+" and shangpinleibie like '%"+shangpinleibie.trim()+"%'";}		if(zhiyaogongsi!=null){sql=sql+" and zhiyaogongsi like '%"+zhiyaogongsi.trim()+"%'";}		if(jiage!=null){sql=sql+" and jiage like '%"+jiage.trim()+"%'";}		if(kucun!=null){sql=sql+" and kucun like '%"+kucun.trim()+"%'";}		if(xiaoliang!=null){sql=sql+" and xiaoliang like '%"+xiaoliang.trim()+"%'";}		if(tupian!=null){sql=sql+" and tupian like '%"+tupian.trim()+"%'";}		if(yaopinjianjie!=null){sql=sql+" and yaopinjianjie like '%"+yaopinjianjie.trim()+"%'";}		if(yaoxiao!=null){sql=sql+" and yaoxiao like '%"+yaoxiao.trim()+"%'";}		
		sql=sql+" order by id desc";
		List shangpinxinxiList=shangpinxinxiDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, shangpinxinxiList.size());
		List shangpinxinxiList1 = shangpinxinxiList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(shangpinxinxiList.size());//设置总共的条数
        p.setData(shangpinxinxiList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	public String spxxList()
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
		String sql = "from TShangpinxinxi where 1=1 ";
		if(shangpinbianhao!=null){sql=sql+" and shangpinbianhao like '%"+shangpinbianhao.trim()+"%'";}		if(shangpinmingcheng!=null){sql=sql+" and shangpinmingcheng like '%"+shangpinmingcheng.trim()+"%'";}		if(shangpinleibie!=null){sql=sql+" and shangpinleibie like '%"+shangpinleibie.trim()+"%'";}		if(zhiyaogongsi!=null){sql=sql+" and zhiyaogongsi like '%"+zhiyaogongsi.trim()+"%'";}		if(jiage!=null){sql=sql+" and jiage like '%"+jiage.trim()+"%'";}		if(kucun!=null){sql=sql+" and kucun like '%"+kucun.trim()+"%'";}		if(xiaoliang!=null){sql=sql+" and xiaoliang like '%"+xiaoliang.trim()+"%'";}		if(tupian!=null){sql=sql+" and tupian like '%"+tupian.trim()+"%'";}		if(yaopinjianjie!=null){sql=sql+" and yaopinjianjie like '%"+yaopinjianjie.trim()+"%'";}		if(yaoxiao!=null){sql=sql+" and yaoxiao like '%"+yaoxiao.trim()+"%'";}		
		sql=sql+" order by id desc";
		List shangpinxinxiList=shangpinxinxiDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, shangpinxinxiList.size());
		List shangpinxinxiList1 = shangpinxinxiList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(shangpinxinxiList.size());//设置总共的条数
        p.setData(shangpinxinxiList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	public String spxxListtp()
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
		String sql = "from TShangpinxinxi where 1=1 ";
		if(shangpinbianhao!=null){sql=sql+" and shangpinbianhao like '%"+shangpinbianhao.trim()+"%'";}		if(shangpinmingcheng!=null){sql=sql+" and shangpinmingcheng like '%"+shangpinmingcheng.trim()+"%'";}		if(shangpinleibie!=null){sql=sql+" and shangpinleibie like '%"+shangpinleibie.trim()+"%'";}		if(zhiyaogongsi!=null){sql=sql+" and zhiyaogongsi like '%"+zhiyaogongsi.trim()+"%'";}		if(jiage!=null){sql=sql+" and jiage like '%"+jiage.trim()+"%'";}		if(kucun!=null){sql=sql+" and kucun like '%"+kucun.trim()+"%'";}		if(xiaoliang!=null){sql=sql+" and xiaoliang like '%"+xiaoliang.trim()+"%'";}		if(tupian!=null){sql=sql+" and tupian like '%"+tupian.trim()+"%'";}		if(yaopinjianjie!=null){sql=sql+" and yaopinjianjie like '%"+yaopinjianjie.trim()+"%'";}		if(yaoxiao!=null){sql=sql+" and yaoxiao like '%"+yaoxiao.trim()+"%'";}		
		sql=sql+" order by id desc";
		List shangpinxinxiList=shangpinxinxiDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, shangpinxinxiList.size());
		List shangpinxinxiList1 = shangpinxinxiList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(shangpinxinxiList.size());//设置总共的条数
        p.setData(shangpinxinxiList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String shangpinxinxiDel()
	{
		String sql = "delete from TShangpinxinxi where id=?";
		Object[] o={id};
		shangpinxinxiDAO.getHibernateTemplate().bulkUpdate(sql, o);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	
	
	public String shangpinxinxiPre()
	{
		TShangpinxinxi shangpinxinxi=shangpinxinxiDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shangpinxinxi", shangpinxinxi);
		return ActionSupport.SUCCESS;
	}
	
	public String shangpinxinxiDetail()
	{
		TShangpinxinxi shangpinxinxi=shangpinxinxiDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shangpinxinxi", shangpinxinxi);
		return ActionSupport.SUCCESS;
	}
	
	public String spxxDetail()
	{
		HttpServletRequest requestw=ServletActionContext.getRequest();
		  if(requestw.getParameter("dztp")!=null)
		  {
			if(requestw.getParameter("dztp").equals("d"))
			{
				String sql = "update TShangpinxinxi set dianzan_d=dianzan_d+1 where id=?";
				Object[] o={id};
				shangpinxinxiDAO.getHibernateTemplate().bulkUpdate(sql, o);
			}
			if(requestw.getParameter("dztp").equals("c"))
			{
				String sql = "update TShangpinxinxi set dianzan_c=dianzan_c+1 where id=?";
				Object[] o={id};
				shangpinxinxiDAO.getHibernateTemplate().bulkUpdate(sql, o);
			}
		  }
		TShangpinxinxi shangpinxinxi=shangpinxinxiDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shangpinxinxi", shangpinxinxi);
		return ActionSupport.SUCCESS;
	}
	
	
	
	//yoxulb
	
	

	public String shangpinxinxiUpdt()
	{
		TShangpinxinxi shangpinxinxi=shangpinxinxiDAO.findById(id);
		
		shangpinxinxi.setShangpinbianhao(shangpinbianhao);		shangpinxinxi.setShangpinmingcheng(shangpinmingcheng);		shangpinxinxi.setShangpinleibie(shangpinleibie);		shangpinxinxi.setZhiyaogongsi(zhiyaogongsi);		shangpinxinxi.setJiage(jiage);		shangpinxinxi.setKucun(kucun);		shangpinxinxi.setXiaoliang(xiaoliang);		shangpinxinxi.setTupian(tupian);		shangpinxinxi.setYaopinjianjie(yaopinjianjie);		shangpinxinxi.setYaoxiao(yaoxiao);		shangpinxinxi.setDianzan_d("0");		shangpinxinxi.setDianzan_c("0");		
		
		shangpinxinxiDAO.attachDirty(shangpinxinxi);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	

		public String getShangpinbianhao()
	{
		return shangpinbianhao;
	}
	public void setShangpinbianhao(String shangpinbianhao)
	{
		this.shangpinbianhao = shangpinbianhao;
	}		public String getShangpinmingcheng()
	{
		return shangpinmingcheng;
	}
	public void setShangpinmingcheng(String shangpinmingcheng)
	{
		this.shangpinmingcheng = shangpinmingcheng;
	}		public String getShangpinleibie()
	{
		return shangpinleibie;
	}
	public void setShangpinleibie(String shangpinleibie)
	{
		this.shangpinleibie = shangpinleibie;
	}		public String getZhiyaogongsi()
	{
		return zhiyaogongsi;
	}
	public void setZhiyaogongsi(String zhiyaogongsi)
	{
		this.zhiyaogongsi = zhiyaogongsi;
	}		public String getJiage()
	{
		return jiage;
	}
	public void setJiage(String jiage)
	{
		this.jiage = jiage;
	}		public String getKucun()
	{
		return kucun;
	}
	public void setKucun(String kucun)
	{
		this.kucun = kucun;
	}		public String getXiaoliang()
	{
		return xiaoliang;
	}
	public void setXiaoliang(String xiaoliang)
	{
		this.xiaoliang = xiaoliang;
	}		public String getTupian()
	{
		return tupian;
	}
	public void setTupian(String tupian)
	{
		this.tupian = tupian;
	}		public String getYaopinjianjie()
	{
		return yaopinjianjie;
	}
	public void setYaopinjianjie(String yaopinjianjie)
	{
		this.yaopinjianjie = yaopinjianjie;
	}		public String getYaoxiao()
	{
		return yaoxiao;
	}
	public void setYaoxiao(String yaoxiao)
	{
		this.yaoxiao = yaoxiao;
	}		public String getDianzan_d()
	{
		return dianzan_d;
	}
	public void setDianzan_d(String dianzan_d)
	{
		this.dianzan_d = dianzan_d;
	}		public String getDianzan_c()
	{
		return dianzan_c;
	}
	public void setDianzan_c(String dianzan_c)
	{
		this.dianzan_c = dianzan_c;
	}	
	
	
	
	
	public String getAddtime()
	{
		return addtime;
	}
	public void setAddtime(String addtime)
	{
		this.addtime = addtime;
	}
	


	public TShangpinxinxiDAO getShangpinxinxiDAO()
	{
		return shangpinxinxiDAO;
	}

	public void setShangpinxinxiDAO(TShangpinxinxiDAO shangpinxinxiDAO)
	{
		this.shangpinxinxiDAO = shangpinxinxiDAO;
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

