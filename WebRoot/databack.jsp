<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据备份</title>
</head>

<body>
<%
if (request.getSession().getAttribute("cx").equals("超级管理员"))
{

String sql="";
  sql="backup database s2shyyypglxthx1312ANCD to disk='D:/s2shyyypglxthx1312ANCD.dat'";
	  	
connDbBean.hsgexecute(sql);
out.print("<script>alert('操作成功!!，您的数据库已成功备份于D:/s2shyyypglxthx1312ANCD.dat');location.href='sy.jsp';</script>");
  	  
}
else
{
out.print("<script>alert('对不起,您没有该权限');location.href='sy.jsp';</script>");
}
%>
</body>
</html>