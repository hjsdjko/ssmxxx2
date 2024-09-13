package com.action;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;


import com.dao.TYaopinrukuDAO;

import com.model.TYaopinruku;

import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import com.util.db;
import java.util.ArrayList;

public class yaopinrukuAction extends ActionSupport
{
	private int id;
	
	private String shangpinbianhao;	private String shangpinmingcheng;	private String shangpinleibie;	private String zhiyaogongsi;	private String kucun;	private String rukushuliang;	private String rukuriqi;	private String rukushuoming;	
	
	private String addtime;
	private String message;
	private String path;
	private ResultSet rs;
	private List list;
	
	private TYaopinrukuDAO yaopinrukuDAO;
	

	
	public String yaopinrukuAdd()
	{
		TYaopinruku yaopinruku=new TYaopinruku();
		
		
		yaopinruku.setShangpinbianhao(shangpinbianhao);		yaopinruku.setShangpinmingcheng(shangpinmingcheng);		yaopinruku.setShangpinleibie(shangpinleibie);		yaopinruku.setZhiyaogongsi(zhiyaogongsi);		yaopinruku.setKucun(kucun);		yaopinruku.setRukushuliang(rukushuliang);		yaopinruku.setRukuriqi(rukuriqi);		yaopinruku.setRukushuoming(rukushuoming);		yaopinruku.setAddtime(addtime);		
		
		
		
		yaopinrukuDAO.save(yaopinruku);
		String sql="";
		sql="update t_shangpinxinxi set kucun=kucun + "+rukushuliang+"  where shangpinbianhao='"+shangpinbianhao+"'";
		db dbo = new db();
		try{
			int i = dbo.hsgexecute(sql);
			if(i == 1){
			
			}
			else{
				
			}
		}catch(Exception e){
			e.printStackTrace();
			
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "添加成功");
		request.put("msg", "<script>javascript:alert('操作成功！');history.back();</script>");
		return "msg";
	}
	
	
	
	public String yaopinrukuList()
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
		String sql = "from TYaopinruku where 1=1 ";
		if(shangpinbianhao!=null){sql=sql+" and shangpinbianhao like '%"+shangpinbianhao.trim()+"%'";}		if(shangpinmingcheng!=null){sql=sql+" and shangpinmingcheng like '%"+shangpinmingcheng.trim()+"%'";}		if(shangpinleibie!=null){sql=sql+" and shangpinleibie like '%"+shangpinleibie.trim()+"%'";}		if(zhiyaogongsi!=null){sql=sql+" and zhiyaogongsi like '%"+zhiyaogongsi.trim()+"%'";}		if(kucun!=null){sql=sql+" and kucun like '%"+kucun.trim()+"%'";}		if(rukushuliang!=null){sql=sql+" and rukushuliang like '%"+rukushuliang.trim()+"%'";}		if(rukuriqi!=null){sql=sql+" and rukuriqi like '%"+rukuriqi.trim()+"%'";}		if(rukushuoming!=null){sql=sql+" and rukushuoming like '%"+rukushuoming.trim()+"%'";}		
		sql=sql+" order by id desc";
		List yaopinrukuList=yaopinrukuDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, yaopinrukuList.size());
		List yaopinrukuList1 = yaopinrukuList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(hsgpagesize);
        p.setTotle(yaopinrukuList.size());//设置总共的条数
        p.setData(yaopinrukuList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	//youtplisxt
	
	
	
	public String yaopinrukuDel()
	{
		String sql = "delete from TYaopinruku where id=?";
		Object[] o={id};
		yaopinrukuDAO.getHibernateTemplate().bulkUpdate(sql, o);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	
	
	public String yaopinrukuPre()
	{
		TYaopinruku yaopinruku=yaopinrukuDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yaopinruku", yaopinruku);
		return ActionSupport.SUCCESS;
	}
	
	public String yaopinrukuDetail()
	{
		TYaopinruku yaopinruku=yaopinrukuDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yaopinruku", yaopinruku);
		return ActionSupport.SUCCESS;
	}
	
	public String yprkDetail()
	{
		//daxidixanzxan
		TYaopinruku yaopinruku=yaopinrukuDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yaopinruku", yaopinruku);
		return ActionSupport.SUCCESS;
	}
	
	
	
	//yoxulb
	
	

	public String yaopinrukuUpdt()
	{
		TYaopinruku yaopinruku=yaopinrukuDAO.findById(id);
		
		yaopinruku.setShangpinbianhao(shangpinbianhao);		yaopinruku.setShangpinmingcheng(shangpinmingcheng);		yaopinruku.setShangpinleibie(shangpinleibie);		yaopinruku.setZhiyaogongsi(zhiyaogongsi);		yaopinruku.setKucun(kucun);		yaopinruku.setRukushuliang(rukushuliang);		yaopinruku.setRukuriqi(rukuriqi);		yaopinruku.setRukushuoming(rukushuoming);		
		
		yaopinrukuDAO.attachDirty(yaopinruku);
		
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
	}		public String getKucun()
	{
		return kucun;
	}
	public void setKucun(String kucun)
	{
		this.kucun = kucun;
	}		public String getRukushuliang()
	{
		return rukushuliang;
	}
	public void setRukushuliang(String rukushuliang)
	{
		this.rukushuliang = rukushuliang;
	}		public String getRukuriqi()
	{
		return rukuriqi;
	}
	public void setRukuriqi(String rukuriqi)
	{
		this.rukuriqi = rukuriqi;
	}		public String getRukushuoming()
	{
		return rukushuoming;
	}
	public void setRukushuoming(String rukushuoming)
	{
		this.rukushuoming = rukushuoming;
	}	
	
	
	
	
	public String getAddtime()
	{
		return addtime;
	}
	public void setAddtime(String addtime)
	{
		this.addtime = addtime;
	}
	


	public TYaopinrukuDAO getYaopinrukuDAO()
	{
		return yaopinrukuDAO;
	}

	public void setYaopinrukuDAO(TYaopinrukuDAO yaopinrukuDAO)
	{
		this.yaopinrukuDAO = yaopinrukuDAO;
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

