package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;


import com.dao.TYonghuzhuceDAO;
import com.model.TYonghuzhuce;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;
import com.opensymphony.xwork2.ActionContext;


import javax.servlet.http.HttpSession;
;


public class yonghuzhuceAction extends ActionSupport
{
	private int id;
	
	private String yonghuming;
	private String mima;
	private String xingming;
	private String xingbie;
	private String chushengnianyue;
	private String qq;
	private String youxiang;
	private String dianhua;
	private String shenfenzheng;
	private String touxiang;
	private String dizhi;
	private String beizhu;
	private String issh;
	
	
	private String addtime;
	private String message;
	private String path;
	
	private TYonghuzhuceDAO yonghuzhuceDAO;

	
	public String yonghuzhuceAdd()
	{
		TYonghuzhuce yonghuzhuce=new TYonghuzhuce();
		
		yonghuzhuce.setYonghuming(yonghuming);
		yonghuzhuce.setMima(mima);
		yonghuzhuce.setXingming(xingming);
		yonghuzhuce.setXingbie(xingbie);
		yonghuzhuce.setChushengnianyue(chushengnianyue);
		yonghuzhuce.setQq(qq);
		yonghuzhuce.setYouxiang(youxiang);
		yonghuzhuce.setDianhua(dianhua);
		yonghuzhuce.setShenfenzheng(shenfenzheng);
		yonghuzhuce.setTouxiang(touxiang);
		yonghuzhuce.setDizhi(dizhi);
		yonghuzhuce.setBeizhu(beizhu);
		yonghuzhuce.setIssh("否");
		yonghuzhuce.setAddtime(addtime);
		
		yonghuzhuceDAO.save(yonghuzhuce);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "添加成功");
		request.put("msg", "<script>javascript:alert('操作成功，请待管理员审核后方可登录！');location.href='index.action';</script>");

		return "msg";
		
	}
	
	
	
	public String yonghuzhuceList()
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
		
		
		
		
		String sql = "from TYonghuzhuce where 1=1 ";
		
		if(yonghuming!=null){sql=sql+" and yonghuming like '%"+yonghuming.trim()+"%'";}
		if(mima!=null){sql=sql+" and mima like '%"+mima.trim()+"%'";}
		if(xingming!=null){sql=sql+" and xingming like '%"+xingming.trim()+"%'";}
		if(xingbie!=null){sql=sql+" and xingbie like '%"+xingbie.trim()+"%'";}
		if(chushengnianyue!=null){sql=sql+" and chushengnianyue like '%"+chushengnianyue.trim()+"%'";}
		if(qq!=null){sql=sql+" and qq like '%"+qq.trim()+"%'";}
		if(youxiang!=null){sql=sql+" and youxiang like '%"+youxiang.trim()+"%'";}
		if(dianhua!=null){sql=sql+" and dianhua like '%"+dianhua.trim()+"%'";}
		if(shenfenzheng!=null){sql=sql+" and shenfenzheng like '%"+shenfenzheng.trim()+"%'";}
		if(touxiang!=null){sql=sql+" and touxiang like '%"+touxiang.trim()+"%'";}
		if(dizhi!=null){sql=sql+" and dizhi like '%"+dizhi.trim()+"%'";}
		if(beizhu!=null){sql=sql+" and beizhu like '%"+beizhu.trim()+"%'";}
		
		
		sql=sql+" order by id desc";
		List yonghuzhuceList=yonghuzhuceDAO.getHibernateTemplate().find(sql);
		
		
		
		int fromIndex = (index - 1) * Pagesize.size;
		int toIndex = Math.min(fromIndex + Pagesize.size, yonghuzhuceList.size());
		List yonghuzhuceList1 = yonghuzhuceList.subList(fromIndex, toIndex);
		
		
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(Pagesize.size);
        p.setTotle(yonghuzhuceList.size());//设置总共的条数
        p.setData(yonghuzhuceList1);//设置数据
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	public String yonghuzhuceDel()
	{
		String sql = "delete from TYonghuzhuce where id=?";
		Object[] o={id};
		yonghuzhuceDAO.getHibernateTemplate().bulkUpdate(sql, o);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	public String yonghuzhuceIssh()
	{
		String sql="";
		String tt="否";
		 sql="from TYonghuzhuce where id=?";
			Object[] o={id};
			List yonghuzhuceList=yonghuzhuceDAO.getHibernateTemplate().find(sql,o);
			if(yonghuzhuceList.size()==0)
			{
				  System.out.println("sssss");
			}
			else
			{
				 TYonghuzhuce yonghuzhuce=(TYonghuzhuce)yonghuzhuceList.get(0);
				 if(yonghuzhuceDAO.findById(yonghuzhuce.getId()).getIssh().equals("否"))
				 {
				 	tt="是";
				 }
				 else
				 {
				 	tt="否";
				 }

				 System.out.println(tt);
				 sql="update TYonghuzhuce set issh=? where id=?";
				Object[] con={tt,id};
				yonghuzhuceDAO.getHibernateTemplate().bulkUpdate(sql,con);
	           
			}
			Map request=(Map)ServletActionContext.getContext().get("request");
			request.put("msg", "<script>javascript:alert('操作成功');location.href='yonghuzhuceList.action';</script>");
			return "msg";

	}
	
	public String yonghuzhucePre()
	{
		TYonghuzhuce yonghuzhuce=yonghuzhuceDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yonghuzhuce", yonghuzhuce);
		return ActionSupport.SUCCESS;
	}
	public String yonghuzhucePre2()
	{
		int nid=0;

		Map session=ActionContext.getContext().getSession();
		
		if(session.get("userxinxi")!=null)
		{
			TYonghuzhuce user=(TYonghuzhuce)session.get("userxinxi");
			nid=user.getId();
		}
		
	    
		TYonghuzhuce yonghuzhuce=yonghuzhuceDAO.findById(nid);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yonghuzhuce", yonghuzhuce);
		return ActionSupport.SUCCESS;
	}
	

	public String yonghuzhuceUpdt()
	{
		TYonghuzhuce yonghuzhuce=yonghuzhuceDAO.findById(id);
		
		yonghuzhuce.setYonghuming(yonghuming);
		yonghuzhuce.setMima(mima);
		yonghuzhuce.setXingming(xingming);
		yonghuzhuce.setXingbie(xingbie);
		yonghuzhuce.setChushengnianyue(chushengnianyue);
		yonghuzhuce.setQq(qq);
		yonghuzhuce.setYouxiang(youxiang);
		yonghuzhuce.setDianhua(dianhua);
		yonghuzhuce.setShenfenzheng(shenfenzheng);
		yonghuzhuce.setTouxiang(touxiang);
		yonghuzhuce.setDizhi(dizhi);
		yonghuzhuce.setBeizhu(beizhu);
		//yonghuzhuce.setIssh(issh);
		
		
		yonghuzhuceDAO.attachDirty(yonghuzhuce);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	public String yonghuzhuceUpdt2()
	{
		TYonghuzhuce yonghuzhuce=yonghuzhuceDAO.findById(id);
		
		yonghuzhuce.setYonghuming(yonghuming);
		yonghuzhuce.setMima(mima);
		yonghuzhuce.setXingming(xingming);
		yonghuzhuce.setXingbie(xingbie);
		yonghuzhuce.setChushengnianyue(chushengnianyue);
		yonghuzhuce.setQq(qq);
		yonghuzhuce.setYouxiang(youxiang);
		yonghuzhuce.setDianhua(dianhua);
		yonghuzhuce.setShenfenzheng(shenfenzheng);
		yonghuzhuce.setTouxiang(touxiang);
		yonghuzhuce.setDizhi(dizhi);
		yonghuzhuce.setBeizhu(beizhu);
		//yonghuzhuce.setIssh("否");
		
		
		yonghuzhuceDAO.attachDirty(yonghuzhuce);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}

		public String getYonghuming()
	{
		return yonghuming;
	}
	public void setYonghuming(String yonghuming)
	{
		this.yonghuming = yonghuming;
	}
		public String getMima()
	{
		return mima;
	}
	public void setMima(String mima)
	{
		this.mima = mima;
	}
		public String getXingming()
	{
		return xingming;
	}
	public void setXingming(String xingming)
	{
		this.xingming = xingming;
	}
		public String getXingbie()
	{
		return xingbie;
	}
	public void setXingbie(String xingbie)
	{
		this.xingbie = xingbie;
	}
		public String getChushengnianyue()
	{
		return chushengnianyue;
	}
	public void setChushengnianyue(String chushengnianyue)
	{
		this.chushengnianyue = chushengnianyue;
	}
		public String getQq()
	{
		return qq;
	}
	public void setQq(String qq)
	{
		this.qq = qq;
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
		public String getShenfenzheng()
	{
		return shenfenzheng;
	}
	public void setShenfenzheng(String shenfenzheng)
	{
		this.shenfenzheng = shenfenzheng;
	}
		public String getTouxiang()
	{
		return touxiang;
	}
	public void setTouxiang(String touxiang)
	{
		this.touxiang = touxiang;
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
	


	public TYonghuzhuceDAO getYonghuzhuceDAO()
	{
		return yonghuzhuceDAO;
	}

	public void setYonghuzhuceDAO(TYonghuzhuceDAO yonghuzhuceDAO)
	{
		this.yonghuzhuceDAO = yonghuzhuceDAO;
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

