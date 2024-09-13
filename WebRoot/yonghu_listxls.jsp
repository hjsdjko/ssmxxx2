<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=yonghu.xls");
%>
<html>
  <head>
    <title>用户</title>
  </head>

  <body >

<table width="100%" border="1" >  
  <tr>
    <td width="30" align="center" >序号</td>
    <td>账号</td>    <td>密码</td>    <td>姓名</td>    <td>性别</td>    <td>手机</td>    <td>身份证</td>    <td>照片</td>    <td>备注</td>    
	
    
  </tr>
   <%
			String sql="select * from t_yonghu order by id desc";
int i=0;
							
						
			ResultSet RS_result=connDbBean.executeQuery(sql);
while(RS_result.next()){
				i++;
						
						
					

		
			%>
  <tr>
    <td  align="center"><%=i %></td>
    <td><%=RS_result.getString("zhanghao") %></td>    <td><%=RS_result.getString("mima") %></td>    <td><%=RS_result.getString("xingming") %></td>    <td><%=RS_result.getString("xingbie") %></td>    <td><%=RS_result.getString("shouji") %></td>    <td><%=RS_result.getString("shenfenzheng") %></td>    <td><%=RS_result.getString("zhaopian") %></td>    <td><%=RS_result.getString("beizhu") %></td>    
	

   
  </tr>
  	<%
  }
   %>
   
</table>
<br>
  </body>
</html>

