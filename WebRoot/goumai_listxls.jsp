<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=goumai.xls");
%>
<html>
  <head>
    <title>����</title>
  </head>

  <body >

<table width="100%" border="1" >  
  <tr>
    <td width="30" align="center" >���</td>
    <td>ҩƷ���</td>
    <td>ҩƷ����</td>
    <td>ҩƷ���</td>
    <td>��ҩ��˾</td>
    <td>�۸�</td>
    <td>���</td>
    <td>����</td>
    <td>��������</td>
    <td>������</td>
    <td>������</td>
    
	
    
  </tr>
   <%
			String sql="select * from t_goumai order by id desc";
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
    <td><%=RS_result.getString("jiage") %></td>
    <td><%=RS_result.getString("kucun") %></td>
    <td><%=RS_result.getString("xiaoliang") %></td>
    <td><%=RS_result.getString("goumaishuliang") %></td>
    <td><%=RS_result.getString("goumaijine") %></td>
    <td><%=RS_result.getString("goumairen") %></td>
    
	

   
  </tr>
  	<%
  }
   %>
   
</table>
<br>
  </body>
</html>

