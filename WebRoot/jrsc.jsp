<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 



<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>


<html>
  <head>
    
    <title>加入收藏</title><link rel="stylesheet" href="css.css" type="text/css">
    

  </head>
<%
if(request.getSession().getAttribute("username")==null)
{
	out.print("<script>alert('对不起,请您先登录!');location.href='index.action';</script>");
	return;
}
if(request.getParameter("id")!=null && request.getParameter("biao")!=null && request.getParameter("ziduan")!=null ){
String sql;
String nid="1";
int nnid=1;
sql="select max(ID) as ss from t_shoucangjilu";
				 ResultSet RS_resultxwlb=connDbBean.executeQuery(sql);
				 if(RS_resultxwlb.next()){
				 nid=RS_resultxwlb.getString("ss");
				 }
				 if(nid==null)
				 {
				 	nnid=1;
				 }
				 else
				 {
				 nnid=Integer.parseInt(nid)+1;
				 }
				 String ndatetime=connDbBean.gettime();
				 
sql="insert into t_shoucangjilu(ID,username,xwid,ziduan,biao,biaoj,addtime) values("+nnid+",'"+request.getSession().getAttribute("username")+"','"+request.getParameter("id")+"','"+request.getParameter("ziduan")+"','"+request.getParameter("biao")+"','"+request.getParameter("biaoj")+"','"+ndatetime+"')";
connDbBean.hsgexecute(sql);
out.print("<script>javascript:alert('操作成功,您可以在您的个人后台查看您的收藏记录！');location.href='index.action';</script>");
}

%>


  <body >
   
  </body>
</html>


