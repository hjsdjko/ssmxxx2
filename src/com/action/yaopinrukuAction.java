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
	
	private String shangpinbianhao;
	
	private String addtime;
	private String message;
	private String path;
	private ResultSet rs;
	private List list;
	
	private TYaopinrukuDAO yaopinrukuDAO;
	

	
	public String yaopinrukuAdd()
	{
		TYaopinruku yaopinruku=new TYaopinruku();
		
		
		yaopinruku.setShangpinbianhao(shangpinbianhao);
		
		
		
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
		//request.put("msg", "���ӳɹ�");
		request.put("msg", "<script>javascript:alert('�����ɹ���');history.back();</script>");
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
		if(shangpinbianhao!=null){sql=sql+" and shangpinbianhao like '%"+shangpinbianhao.trim()+"%'";}
		sql=sql+" order by id desc";
		List yaopinrukuList=yaopinrukuDAO.getHibernateTemplate().find(sql);
		
		int fromIndex = (index - 1) * hsgpagesize;
		int toIndex = Math.min(fromIndex + hsgpagesize, yaopinrukuList.size());
		List yaopinrukuList1 = yaopinrukuList.subList(fromIndex, toIndex);
		Pagination p = new Pagination();//���� ��ҳ����
        p.setIndex(index);//����ҳ��
        p.setPageSize(hsgpagesize);
        p.setTotle(yaopinrukuList.size());//�����ܹ�������
        p.setData(yaopinrukuList1);//��������
		
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
		request.put("msg", "�����ɹ�");
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
		
		yaopinruku.setShangpinbianhao(shangpinbianhao);
		
		yaopinrukuDAO.attachDirty(yaopinruku);
		
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
		return kucun;
	}
	public void setKucun(String kucun)
	{
		this.kucun = kucun;
	}
	{
		return rukushuliang;
	}
	public void setRukushuliang(String rukushuliang)
	{
		this.rukushuliang = rukushuliang;
	}
	{
		return rukuriqi;
	}
	public void setRukuriqi(String rukuriqi)
	{
		this.rukuriqi = rukuriqi;
	}
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
