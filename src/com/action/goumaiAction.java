package com.action;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;


import com.dao.TGoumaiDAO;
import com.dao.TShangpinxinxiDAO;
import com.model.TGoumai;
import com.model.TShangpinxinxi;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import com.util.db;
import java.util.ArrayList;

public class goumaiAction extends ActionSupport
{
	private int id;
	
	private String shangpinbianhao;
	private String shangpinmingcheng;
	private String shangpinleibie;
	private String zhiyaogongsi;
	private String jiage;
	private String kucun;
	private String xiaoliang;
	private String goumaishuliang;
	private String goumaijine;
	private String goumairen;
	private String issh;
	
	
	private String addtime;
	private String message;
	private String path;
	private ResultSet rs;
	private List list;
	
	private TGoumaiDAO goumaiDAO;
	private TShangpinxinxiDAO shangpinxinxiDAO;

	
	public String goumaiAdd()
	{
		TGoumai goumai=new TGoumai();
		
		
		goumai.setShangpinbianhao(shangpinbianhao);
		goumai.setShangpinmingcheng(shangpinmingcheng);
		goumai.setShangpinleibie(shangpinleibie);
		goumai.setZhiyaogongsi(zhiyaogongsi);
		goumai.setJiage(jiage);
		goumai.setKucun(kucun);
		goumai.setXiaoliang(xiaoliang);
		goumai.setGoumaishuliang(goumaishuliang);
		goumai.setGoumaijine(goumaijine);
		goumai.setGoumairen(goumairen);
		goumai.setIssh("否");
		goumai.setAddtime(addtime);
		
		
		
		
		goumaiDAO.save(goumai);
		
		
		
		String dd="update t_shangpinxinxi set kucun=kucun-"+goumai.getGoumaishuliang()+" where shangpinbianhao='"+goumai.getShangpinbianhao()+"'";
		System.out.print(dd);
		db dbo = new db();
		dbo.hsgexecute(dd);
		String cc="update t_shangpinxinxi set xiaoliang=xiaoliang+"+goumai.getGoumaishuliang()+" where shangpinbianhao='"+goumai.getShangpinbianhao()+"'";
		System.out.print(cc);
		dbo.hsgexecute(cc);
		
		
		
		
		
		
		
		
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "添加成功");
		request.put("msg", "<script>javascript:alert('操作成功！');history.back();</script>");
		return "msg";
	}
	
	
	
	public String goumaiList()
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
		String sql = "from TGoumai where 1=1 ";
		if(shangpinbianhao!=null){sql=sql+" and shangpinbianhao like '%"+shangpinbianhao.trim()+"%'";}
		if(shangpinmingcheng!=null){sql=sql+" and shangpinmingcheng like '%"+shangpinmingcheng.trim()+"%'";}
		if(shangpinleibie!=null){sql=sql+" and shangpinleibie like '%"+shangpinleibie.trim()+"%'";}
		if(zhiyaogongsi!=null){sql=sql+" and zhiyaogongsi like '%"+zhiyaogongsi.trim()+"%'";}
		if(jiage!=null){sql=sql+" and jiage like '%"+jiage.trim()+"%'";}
		if(kucun!=null){sql=sql+" and kucun like '%"+kucun.trim()+"%'";}
		if(xiaoliang!=null){sql=sql+" and xiaoliang like '%"+xiaoliang.trim()+"%'";}
		if(goumaishuliang!=null){sql=sql+" and goumaishuliang like '%"+goumaishuliang.trim()+"%'";}
		if(goumaijine!=null){sql=sql+" and goumaijine like '%"+goumaijine.trim()+"%'";}
		if(goumairen!=null){sql=sql+" and goumairen like '%"+goumairen.trim()+"%'";}
		
		sql=sql+" order by id desc";
		List goumaiList=goumaiDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, goumaiList.size());
		List goumaiList1 = goumaiList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(goumaiList.size());//设置总共的条数
        p.setData(goumaiList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	//youtplisxt
	
	public String goumaiList2()
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
		String sql = "from TGoumai where goumairen='"+(String)request.getSession().getAttribute("username")+"' and issh='否' ";
		
		if(shangpinbianhao!=null){sql=sql+" and shangpinbianhao like '%"+shangpinbianhao.trim()+"%'";}
		if(shangpinmingcheng!=null){sql=sql+" and shangpinmingcheng like '%"+shangpinmingcheng.trim()+"%'";}
		if(shangpinleibie!=null){sql=sql+" and shangpinleibie like '%"+shangpinleibie.trim()+"%'";}
		if(zhiyaogongsi!=null){sql=sql+" and zhiyaogongsi like '%"+zhiyaogongsi.trim()+"%'";}
		if(jiage!=null){sql=sql+" and jiage like '%"+jiage.trim()+"%'";}
		if(kucun!=null){sql=sql+" and kucun like '%"+kucun.trim()+"%'";}
		if(xiaoliang!=null){sql=sql+" and xiaoliang like '%"+xiaoliang.trim()+"%'";}
		if(goumaishuliang!=null){sql=sql+" and goumaishuliang like '%"+goumaishuliang.trim()+"%'";}
		if(goumaijine!=null){sql=sql+" and goumaijine like '%"+goumaijine.trim()+"%'";}
		if(goumairen!=null){sql=sql+" and goumairen like '%"+goumairen.trim()+"%'";}
		
		sql=sql+" order by id desc";
		List goumaiList=goumaiDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * Pagesize.size;
		int toIndex = Math.min(fromIndex + Pagesize.size, goumaiList.size());
		List goumaiList1 = goumaiList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(Pagesize.size);
        p.setTotle(goumaiList.size());//设置总共的条数
        p.setData(goumaiList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	public String goumaiDel()
	{
		String sql = "delete from TGoumai where id=?";
		Object[] o={id};
		goumaiDAO.getHibernateTemplate().bulkUpdate(sql, o);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	public String goumaiIssh()
	{
		String sql="";
		String tt="否";
		 sql="from TGoumai where id=?";
			Object[] o={id};
			List goumaiList=goumaiDAO.getHibernateTemplate().find(sql,o);
			if(goumaiList.size()==0)
			{
				  
			}
			else
			{
				 TGoumai goumai=(TGoumai)goumaiList.get(0);
				 if(goumaiDAO.findById(goumai.getId()).getIssh().equals("否"))
				 {
				 	tt="是";
				 }
				 else
				 {
				 	tt="否";
				 }

				 
				 sql="update TGoumai set issh=? where id=?";
				Object[] con={tt,id};
				goumaiDAO.getHibernateTemplate().bulkUpdate(sql,con);
	           
			}
			Map request=(Map)ServletActionContext.getContext().get("request");
			request.put("msg", "<script>javascript:alert('操作成功');location.href='goumaiList.action';</script>");
			return "msg";

	}
	
	public String goumaiPre()
	{
		TGoumai goumai=goumaiDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goumai", goumai);
		return ActionSupport.SUCCESS;
	}
	
	public String goumaiDetail()
	{
		TGoumai goumai=goumaiDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goumai", goumai);
		return ActionSupport.SUCCESS;
	}
	
	public String gmDetail()
	{
		//daxidixanzxan
		TGoumai goumai=goumaiDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goumai", goumai);
		return ActionSupport.SUCCESS;
	}
	
	
	
	//yoxulb
	
	public List getLbdqGoumai(int id,int hsgzds){
		String sql = "select shangpinbianhao,shangpinmingcheng,shangpinleibie,zhiyaogongsi,jiage,kucun,xiaoliang from t_shangpinxinxi where id = "+id;
		db dbo = new db();
		list = new ArrayList();
		try{
			rs = dbo.executeQuery(sql);
			while(rs.next()){
				for (int hsgt=1;hsgt<=hsgzds;hsgt++)
					{
                    list.add(rs.getString(hsgt));
					}
					
				
			}
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return list;
		}
	}

	public String goumaiUpdt()
	{
		TGoumai goumai=goumaiDAO.findById(id);
		
		goumai.setShangpinbianhao(shangpinbianhao);
		goumai.setShangpinmingcheng(shangpinmingcheng);
		goumai.setShangpinleibie(shangpinleibie);
		goumai.setZhiyaogongsi(zhiyaogongsi);
		goumai.setJiage(jiage);
		goumai.setKucun(kucun);
		goumai.setXiaoliang(xiaoliang);
		goumai.setGoumaishuliang(goumaishuliang);
		goumai.setGoumaijine(goumaijine);
		goumai.setGoumairen(goumairen);
		
		
		goumaiDAO.attachDirty(goumai);
		
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
	}
		public String getShangpinmingcheng()
	{
		return shangpinmingcheng;
	}
	public void setShangpinmingcheng(String shangpinmingcheng)
	{
		this.shangpinmingcheng = shangpinmingcheng;
	}
		public String getShangpinleibie()
	{
		return shangpinleibie;
	}
	public void setShangpinleibie(String shangpinleibie)
	{
		this.shangpinleibie = shangpinleibie;
	}
		public String getZhiyaogongsi()
	{
		return zhiyaogongsi;
	}
	public void setZhiyaogongsi(String zhiyaogongsi)
	{
		this.zhiyaogongsi = zhiyaogongsi;
	}
		public String getJiage()
	{
		return jiage;
	}
	public void setJiage(String jiage)
	{
		this.jiage = jiage;
	}
		public String getKucun()
	{
		return kucun;
	}
	public void setKucun(String kucun)
	{
		this.kucun = kucun;
	}
		public String getXiaoliang()
	{
		return xiaoliang;
	}
	public void setXiaoliang(String xiaoliang)
	{
		this.xiaoliang = xiaoliang;
	}
		public String getGoumaishuliang()
	{
		return goumaishuliang;
	}
	public void setGoumaishuliang(String goumaishuliang)
	{
		this.goumaishuliang = goumaishuliang;
	}
		public String getGoumaijine()
	{
		return goumaijine;
	}
	public void setGoumaijine(String goumaijine)
	{
		this.goumaijine = goumaijine;
	}
		public String getGoumairen()
	{
		return goumairen;
	}
	public void setGoumairen(String goumairen)
	{
		this.goumairen = goumairen;
	}
	
	
		public String getIssh()
	{
		return issh;
	}
	public void setIssh(String issh)
	{
		this.issh = issh;
	}
	
	
	
	public String getAddtime()
	{
		return addtime;
	}
	public void setAddtime(String addtime)
	{
		this.addtime = addtime;
	}
	


	public TGoumaiDAO getGoumaiDAO()
	{
		return goumaiDAO;
	}

	public void setGoumaiDAO(TGoumaiDAO goumaiDAO)
	{
		this.goumaiDAO = goumaiDAO;
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

