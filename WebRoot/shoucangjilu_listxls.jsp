<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
 

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=shoucangjilu.xls");
%>
<html>
  <head>
    <title>收藏记录</title>
  </head>

  <body >

<table width="100%" border="1" >
  <tr>
    <td width="30" align="center" >序号</td>
    <td >用户名</td>    <td >数据ID</td>    <td >字段</td>    <td >表</td>    
	
    <td width="120" align="center" >添加时间</td>
    
  </tr>
   <%
			String sql="select * from t_shoucangjilu order by id desc";
			int i=0;
									
			ResultSet RS_result=connDbBean.executeQuery(sql);
			while(RS_result.next()){

			%>
  <tr>
    <td  align="center"><%=i+1 %></td>
    <td><%=RS_result.getString("username") %></td>    <td><%=RS_result.getString("xwid") %></td>    <td><%=RS_result.getString("ziduan") %></td>    <td><%=RS_result.getString("biao") %></td>
  </tr>
  	<%
  }
   %>
   
</table>
<br>
  </body>
</html>

