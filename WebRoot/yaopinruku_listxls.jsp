<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=yaopinruku.xls");
%>
<html>
  <head>
    <title>药品入库</title>
  </head>

  <body >

<table width="100%" border="1" >  
  <tr>
    <td width="30" align="center" >序号</td>
    <td>药品编号</td>
    <td>药品名称</td>
    <td>药品类别</td>
    <td>制药公司</td>
    <td>库存</td>
    <td>入库数量</td>
    <td>入库日期</td>
    <td>入库说明</td>
    
	
    
  </tr>
   <%
			String sql="select * from t_yaopinruku order by id desc";
int i=0;
							
						
			ResultSet RS_result=connDbBean.executeQuery(sql);
while(RS_result.next()){
				i++;
						
						
					

		
			%>
  <tr>
    <td  align="center"><%=i %></td>
    <td><%=RS_result.getString("shangpinbianhao") %></td>
    <td><%=RS_result.getString("shangpinmingcheng") %></td>
    <td><%=RS_result.getString("shangpinleibie") %></td>
    <td><%=RS_result.getString("zhiyaogongsi") %></td>
    <td><%=RS_result.getString("kucun") %></td>
    <td><%=RS_result.getString("rukushuliang") %></td>
    <td><%=RS_result.getString("rukuriqi") %></td>
    <td><%=RS_result.getString("rukushuoming") %></td>
    
	

   
  </tr>
  	<%
  }
   %>
   
</table>
<br>
  </body>
</html>

