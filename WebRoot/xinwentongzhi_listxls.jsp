<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=xinwentongzhi.xls");
%>
<html>
  <head>
    <title>新闻通知</title>
  </head>

  <body >

<table width="100%" border="1" >
  <tr>
    <td width="30" align="center" >序号</td>
    <td >标题</td>
    <td >类别</td>
    <td >点击率</td>
    <td >添加人</td>
    
	
    <td width="120" align="center" >添加时间</td>
    
  </tr>
  <%
			String sql="select biaoti,leibie,dianjilv,tianjiaren,addtime from t_xinwentongzhi order by id desc";
			int i=0;
									
			ResultSet RS_result=connDbBean.executeQuery(sql);
			while(RS_result.next()){

			%>
  <tr>
    <td  align="center"><%=i+1 %></td>
    <td><%=RS_result.getString("biaoti") %></td>
    <td><%=RS_result.getString("leibie") %></td>
    <td><%=RS_result.getString("dianjilv") %></td>
    <td><%=RS_result.getString("tianjiaren")%></td>
    <td><%=RS_result.getString("addtime")%></td>
  </tr>
  	<%
  }
   %>
   
</table>
<br>
  </body>
</html>

