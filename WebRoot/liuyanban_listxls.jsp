<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=liuyanban.xls");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>留言板</TITLE> 

	
		
		
	   
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

	<body >
	
<table width="100%" border="1" >  
  <tr>
    <td width="30" align="center" >序号</td>
    <td >昵称</td>
    <td >头像</td>
    <td >QQ</td>
    <td >邮箱</td>
    <td >电话</td>
    <td >内容</td>
    <td >回复内容</td>
    
	
    <td width="120" align="center" >添加时间</td>
    
  </tr>
   <%
			String sql="select * from t_liuyanban order by id desc";
			int i=0;
									
			ResultSet RS_result=connDbBean.executeQuery(sql);
			while(RS_result.next()){

			%>
  <tr>
    <td  align="center"><%=i+1 %></td>
    <td><%=RS_result.getString("cheng") %></td>
    <td><%=RS_result.getString("xingbie") %></td>
    <td><%=RS_result.getString("QQ") %></td>
    <td><%=RS_result.getString("youxiang") %></td>
    <td><%=RS_result.getString("dianhua") %></td>
    <td><%=RS_result.getString("neirong") %></td>
    <td><%=RS_result.getString("huifuneirong") %></td>
    
	<td><%=RS_result.getString("addtime") %></td>
	
   
  </tr>
  	<%
  }
   %>
   
</table>
<br>
  </body>
</html>

	