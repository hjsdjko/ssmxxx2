package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;


import com.dao.TLiuyanbanDAO;
import com.model.TLiuyanban;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;

public class liuyanbanAction extends ActionSupport
{
	private int id;
	
	private String cheng;
	private String xingbie;
	private String QQ;
	private String youxiang;
	private String dianhua;
	private String neirong;
	private String huifuneirong;
	
	
	private String addtime;
	private String message;
	private String path;
	
	private TLiuyanbanDAO liuyanbanDAO;

	
	public String liuyanbanAdd()
	{
		TLiuyanban liuyanban=new TLiuyanban();
		
		liuyanban.setCheng(cheng);
		liuyanban.setXingbie(xingbie);
		liuyanban.setQQ(QQ);
		liuyanban.setYouxiang(youxiang);
		liuyanban.setDianhua(dianhua);
		liuyanban.setNeirong(neirong);
		liuyanban.setHuifuneirong(huifuneirong);
		liuyanban.setAddtime(addtime);
		
		liuyanbanDAO.save(liuyanban);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "添加成功");
		request.put("msg", "<script>javascript:alert('操作成功！');location.href='lyblist.action';</script>");
		return "msg";
	}
	
	
	
	public String liuyanbanList()
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
		
		String sql = "from TLiuyanban where 1=1 ";
		
		if(cheng!=null){sql=sql+" and cheng like '%"+cheng.trim()+"%'";}
		if(xingbie!=null){sql=sql+" and touxiang like '%"+xingbie.trim()+"%'";}
		if(QQ!=null){sql=sql+" and QQ like '%"+QQ.trim()+"%'";}
		if(youxiang!=null){sql=sql+" and youxiang like '%"+youxiang.trim()+"%'";}
		if(dianhua!=null){sql=sql+" and dianhua like '%"+dianhua.trim()+"%'";}
		if(neirong!=null){sql=sql+" and neirong like '%"+neirong.trim()+"%'";}
		if(huifuneirong!=null){sql=sql+" and huifuneirong like '%"+huifuneirong.trim()+"%'";}
		
		
		sql=sql+" order by id desc";
		List liuyanbanList=liuyanbanDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * Pagesize.size;
		int toIndex = Math.min(fromIndex + Pagesize.size, liuyanbanList.size());
		List liuyanbanList1 = liuyanbanList.subList(fromIndex, toIndex);
		
		
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(Pagesize.size);
        p.setTotle(liuyanbanList.size());//设置总共的条数
        p.setData(liuyanbanList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	public String lyblist()
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
		
		String sql = "from TLiuyanban where 1=1 ";
		
		if(cheng!=null){sql=sql+" and cheng like '%"+cheng.trim()+"%'";}
		if(xingbie!=null){sql=sql+" and touxiang like '%"+xingbie.trim()+"%'";}
		if(QQ!=null){sql=sql+" and QQ like '%"+QQ.trim()+"%'";}
		if(youxiang!=null){sql=sql+" and youxiang like '%"+youxiang.trim()+"%'";}
		if(dianhua!=null){sql=sql+" and dianhua like '%"+dianhua.trim()+"%'";}
		if(neirong!=null){sql=sql+" and neirong like '%"+neirong.trim()+"%'";}
		if(huifuneirong!=null){sql=sql+" and huifuneirong like '%"+huifuneirong.trim()+"%'";}
		
		
		sql=sql+" order by id desc";
		List liuyanbanList=liuyanbanDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * Pagesize.size;
		int toIndex = Math.min(fromIndex + Pagesize.size, liuyanbanList.size());
		List liuyanbanList1 = liuyanbanList.subList(fromIndex, toIndex);
		
		
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(Pagesize.size);
        p.setTotle(liuyanbanList.size());//设置总共的条数
        p.setData(liuyanbanList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	public String liuyanbanDel()
	{
		String sql = "delete from TLiuyanban where id=?";
		Object[] o={id};
		liuyanbanDAO.getHibernateTemplate().bulkUpdate(sql, o);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	
	
	public String liuyanbanPre()
	{
		TLiuyanban liuyanban=liuyanbanDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("liuyanban", liuyanban);
		return ActionSupport.SUCCESS;
	}
	
	public String liuyanbanHf()
	{
		TLiuyanban liuyanban=liuyanbanDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("liuyanban", liuyanban);
		return ActionSupport.SUCCESS;
	}

	public String liuyanbanUpdt()
	{
		TLiuyanban liuyanban=liuyanbanDAO.findById(id);
		
		liuyanban.setCheng(cheng);
		liuyanban.setXingbie(xingbie);
		liuyanban.setQQ(QQ);
		liuyanban.setYouxiang(youxiang);
		liuyanban.setDianhua(dianhua);
		liuyanban.setNeirong(neirong);
		liuyanban.setHuifuneirong(huifuneirong);
		
		
		liuyanbanDAO.attachDirty(liuyanban);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	

		public String getCheng()
	{
		return cheng;
	}
	public void setCheng(String cheng)
	{
		this.cheng = cheng;
	}
		public String getXingbie()
	{
		return xingbie;
	}
	public void setXingbie(String xingbie)
	{
		this.xingbie = xingbie;
	}
		public String getQQ()
	{
		return QQ;
	}
	public void setQQ(String QQ)
	{
		this.QQ = QQ;
	}
		public String getYouxiang()
	{
		return youxiang;
	}
	public void setYouxiang(String youxiang)
	{
		this.youxiang = youxiang;
	}
		public String getDianhua()
	{
		return dianhua;
	}
	public void setDianhua(String dianhua)
	{
		this.dianhua = dianhua;
	}
		public String getNeirong()
	{
		return neirong;
	}
	public void setNeirong(String neirong)
	{
		this.neirong = neirong;
	}
		public String getHuifuneirong()
	{
		return huifuneirong;
	}
	public void setHuifuneirong(String huifuneirong)
	{
		this.huifuneirong = huifuneirong;
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
	


	public TLiuyanbanDAO getLiuyanbanDAO()
	{
		return liuyanbanDAO;
	}

	public void setLiuyanbanDAO(TLiuyanbanDAO liuyanbanDAO)
	{
		this.liuyanbanDAO = liuyanbanDAO;
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

