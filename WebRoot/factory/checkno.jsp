<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%
String table = request.getParameter("table")==null?"":request.getParameter("table");
String col = request.getParameter("col")==null?"":request.getParameter("col");
String value = request.getParameter("value")==null?"":request.getParameter("value");
String checktype = request.getParameter("checktype")==null?"":request.getParameter("checktype");
if(checktype.equals("insert"))
{
	ResultSet RS_resultxwlb=connDbBean.executeQuery("select * from t_"+table+" where "+col+"='"+value+"'");
  if(RS_resultxwlb.next()){
	out.print("Y");
	}else{
	out.print("N");
	}
}


%>