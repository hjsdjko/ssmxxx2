<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=dingdanxinxi.xls");
%>
<html>
  <head>
    <title>订单信息</title>
  </head>

  <body >

<table width="100%" border="1" >  
  <tr>
    <td width="30" align="center" >序号</td>
    <td>订单号</td>    <td>订单内容</td>    <td>订单金额</td>    <td>购买人</td>    <td>电话</td>    <td>地址</td>    <td>备注</td>    
	
    
  </tr>
   <%
			String sql="select * from t_dingdanxinxi order by id desc";
int i=0;
							
						
			ResultSet RS_result=connDbBean.executeQuery(sql);
while(RS_result.next()){
				i++;
						
						
					

		
			%>
  <tr>
    <td  align="center"><%=i %></td>
    <td><%=RS_result.getString("dingdanhao") %></td>    <td><%=RS_result.getString("dingdanneirong") %></td>    <td><%=RS_result.getString("dingdanjine") %></td>    <td><%=RS_result.getString("goumairen") %></td>    <td><%=RS_result.getString("dianhua") %></td>    <td><%=RS_result.getString("dizhi") %></td>    <td><%=RS_result.getString("beizhu") %></td>    
	

   
  </tr>
  	<%
  }
   %>
   
</table>
<br>
  </body>
</html>

