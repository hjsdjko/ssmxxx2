<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=pinglun.xls");
%>
<html>
  <head>
    <title>评论</title>
  </head>

  <body >

<table width="100%" border="1" >
  <tr>
    <td width="30" align="center" >序号</td>
    <td >新闻ID</td>
    <td >评论内容</td>
    <td >评论人</td>
    <td >评分</td>
    <td >表</td>
    
	
    <td width="120" align="center" >添加时间</td>
    
  </tr>
   <%
			String sql="select * from t_pinglun order by id desc";
			int i=0;
									
			ResultSet RS_result=connDbBean.executeQuery(sql);
			while(RS_result.next()){

			%>
  <tr>
    <td  align="center"><%=i+1 %></td>
    <td><%=RS_result.getString("xinwenID") %></td>
    <td><%=RS_result.getString("pinglunneirong") %></td>
    <td><%=RS_result.getString("pinglunren") %></td>
    <td><%=RS_result.getString("pingfen") %></td>
    <td><%=RS_result.getString("biao") %></td>

  </tr>
  	<%
  }
   %>
   
</table>
<br>
  </body>
</html>

