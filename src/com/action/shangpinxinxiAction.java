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
	
	private String shangpinbianhao;
	
	private String addtime;
	private String message;
	private String path;
	private ResultSet rs;
	private List list;
	
	private TShangpinxinxiDAO shangpinxinxiDAO;
	

	
	public String shangpinxinxiAdd()
	{
		TShangpinxinxi shangpinxinxi=new TShangpinxinxi();
		
		
		shangpinxinxi.setShangpinbianhao(shangpinbianhao);
		
		
		
		shangpinxinxiDAO.save(shangpinxinxi);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "���ӳɹ�");
		request.put("msg", "<script>javascript:alert('�����ɹ���');history.back();</script>");
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
		if(shangpinbianhao!=null){sql=sql+" and shangpinbianhao like '%"+shangpinbianhao.trim()+"%'";}
		sql=sql+" order by id desc";
		List shangpinxinxiList=shangpinxinxiDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, shangpinxinxiList.size());
		List shangpinxinxiList1 = shangpinxinxiList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//���� ��ҳ����
        p.setIndex(index);//����ҳ��
        p.setPageSize(hsgpagesize);
        p.setTotle(shangpinxinxiList.size());//�����ܹ�������
        p.setData(shangpinxinxiList1);//��������
		
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
		if(shangpinbianhao!=null){sql=sql+" and shangpinbianhao like '%"+shangpinbianhao.trim()+"%'";}
		sql=sql+" order by id desc";
		List shangpinxinxiList=shangpinxinxiDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, shangpinxinxiList.size());
		List shangpinxinxiList1 = shangpinxinxiList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//���� ��ҳ����
        p.setIndex(index);//����ҳ��
        p.setPageSize(hsgpagesize);
        p.setTotle(shangpinxinxiList.size());//�����ܹ�������
        p.setData(shangpinxinxiList1);//��������
		
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
		if(shangpinbianhao!=null){sql=sql+" and shangpinbianhao like '%"+shangpinbianhao.trim()+"%'";}
		sql=sql+" order by id desc";
		List shangpinxinxiList=shangpinxinxiDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, shangpinxinxiList.size());
		List shangpinxinxiList1 = shangpinxinxiList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//���� ��ҳ����
        p.setIndex(index);//����ҳ��
        p.setPageSize(hsgpagesize);
        p.setTotle(shangpinxinxiList.size());//�����ܹ�������
        p.setData(shangpinxinxiList1);//��������
		
		request.setAttribute("page", p);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String shangpinxinxiDel()
	{
		String sql = "delete from TShangpinxinxi where id=?";
		Object[] o={id};
		shangpinxinxiDAO.getHibernateTemplate().bulkUpdate(sql, o);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "�����ɹ�");
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
		
		shangpinxinxi.setShangpinbianhao(shangpinbianhao);
		
		shangpinxinxiDAO.attachDirty(shangpinxinxi);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "�����ɹ�");
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
	{
		return shangpinmingcheng;
	}
	public void setShangpinmingcheng(String shangpinmingcheng)
	{
		this.shangpinmingcheng = shangpinmingcheng;
	}
	{
		return shangpinleibie;
	}
	public void setShangpinleibie(String shangpinleibie)
	{
		this.shangpinleibie = shangpinleibie;
	}
	{
		return zhiyaogongsi;
	}
	public void setZhiyaogongsi(String zhiyaogongsi)
	{
		this.zhiyaogongsi = zhiyaogongsi;
	}
	{
		return jiage;
	}
	public void setJiage(String jiage)
	{
		this.jiage = jiage;
	}
	{
		return kucun;
	}
	public void setKucun(String kucun)
	{
		this.kucun = kucun;
	}
	{
		return xiaoliang;
	}
	public void setXiaoliang(String xiaoliang)
	{
		this.xiaoliang = xiaoliang;
	}
	{
		return tupian;
	}
	public void setTupian(String tupian)
	{
		this.tupian = tupian;
	}
	{
		return yaopinjianjie;
	}
	public void setYaopinjianjie(String yaopinjianjie)
	{
		this.yaopinjianjie = yaopinjianjie;
	}
	{
		return yaoxiao;
	}
	public void setYaoxiao(String yaoxiao)
	{
		this.yaoxiao = yaoxiao;
	}
	{
		return dianzan_d;
	}
	public void setDianzan_d(String dianzan_d)
	{
		this.dianzan_d = dianzan_d;
	}
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
