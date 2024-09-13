<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="shoucangjiluhsgb" scope="page" class="com.action.shoucangjiluAction" /> 



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>收藏记录查询</TITLE>
	<LINK href="css.css" type=text/css rel=stylesheet />
	
		
		<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
        <script language="javascript">
		   function catelogAll()
           {
                   document.getElementById("indicator").style.display="block";
                   loginService.catelogAll(callback);
               
           }
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("catelog_id",data,"id","name");
           }
           function shoucangjiluDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="shoucangjiluDel.action?id="+id;
               }
           }
           function shoucangjiluDetail(id)
           {
                  //tanchuangfanshi1 window.location.href="shoucangjiluDetail.action?id="+id;
				  //tanchuangfanshi2 window.open("shoucangjiluDetail.action?id="+id,"_blank");
           }
           function shoucangjiluPre(id)
           {
                   window.location.href="shoucangjiluPre.action?id="+id;
           }
           function shoucangjiluIssh(id)
           {
                   window.location.href="shoucangjiluIssh.action?id="+id;
           }
           function shoucangjiluAdd()
           {
                 var url="shoucangjiluAdd.jsp";
				 window.location.href=url;
           }
           
           
           function go(index)
           {
               document.form123.index.value=index;
               document.form123.action="shoucangjiluList2.action"
               document.form123.submit();
           }  
		    function check()
           {
               document.formAdd.submit();
           }
       </script>
	   
	</head>

	<body leftmargin="2" topmargin="9" background='img/allbg.gif' onload="catelogAll()">
	
	<form action="shoucangjiluList.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="10" colspan="8" background="img/tbg.gif">我的收藏记录</td>
						</tr>
					 </table>
	</form>
			
			<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
				
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="50">序号</td>
					<td width="916" align="left" >标题</td>
 
    
					
					<td width="140">添加时间</td>
					<td width="140">操作</td>
		        </tr>
				
				
					 <% 
if(request.getParameter("scid")!=null)
{
	int i=connDbBean.hsgexecute("delete from t_shoucangjilu where id="+request.getParameter("scid"));
	if(i==1)
	{
	out.print("<script>alert('删除成功!');location.href='shoucangjilu_list2.jsp';</script>");
	return;
	}
}
    String url = "shoucangjilu_list2.jsp?1=1"; 
    String sql =  "select * from t_shoucangjilu where username='"+request.getSession().getAttribute("username")+"' order by id desc";

	ResultSet RS_result=connDbBean.executeQuery(sql);
	int i=0;
	while(RS_result.next()){
	i++;
     %>  
	 <tr align='center' bgcolor="#FFFFFF" onMouseOver="this.style.backgroundColor='#EDDCC2'" onMouseOut="this.style.backgroundColor='#ffffff'" height="22">
		<td width="50"><%=i %></td>
		<td align="left"><%
		 out.print(connDbBean.readzd("t_"+RS_result.getString("biao"),RS_result.getString("ziduan"),"ID",RS_result.getString("xwid")));
		%></td>
		<td width="140" align="center"><%=RS_result.getString("addtime")%></td>
		<td width="140" align="center"><a href="shoucangjilu_list2.jsp?scid=<%=RS_result.getString("id")%>" onclick="return confirm('真的要删除？')" >删除</a>
		<%
		if (RS_result.getString("biao").equals("xinwentongzhi"))
		{
		%>
		 <a href="gg_detail.jsp?id=<%=RS_result.getString("xwid")%>" target="_blank">详细</a>
		 <%
		}
		else
		{
		%>
		 <a href="<%=RS_result.getString("biaoj")%>Detail.action?id=<%=RS_result.getString("xwid")%>" target="_blank">详细</a>
		 <%
		 }
		 %>		 </td>
 	 </tr>
  <%
  }
   %>
			</table>
			
			
			
		
			
			
	</body>
</html>
