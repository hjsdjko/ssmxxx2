<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");%>
<%
if(request.getSession().getAttribute("username")==null )
{
	
	out.print("<script>javascript:alert('对不起，您已超时或未登录,请在IE中重新打开登录！');window.close();</script>");
	out.close();
}
else
{
	if(request.getSession().getAttribute("cx").equals("超级管理员"))
	{}
	else
	{
		
		out.print("<script>javascript:alert('对不起，您无权操作此模块！');history.back();</script>");
		out.close();
	}

}
%>
<html>
  <head>
    
    <title>管理员用户管理</title><link rel="stylesheet" href="css.css" type="text/css">
    

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>

<script type='text/javascript' src='dwr/interface/loginService.js'></script>
		<script type='text/javascript' src='dwr/engine.js'></script>
		<script type='text/javascript' src='dwr/util.js'></script>
        <script language="javascript">
		   
           function allusersDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="allusersDel.action?id="+id;
               }
           }
           
           function allusersPre(id)
           {
                   window.location.href="allusersPre.action?id="+id;
           }
           function yonghuzhuceIssh(id)
           {
                   window.location.href="allusersIssh.action?id="+id;
           }
           function allusersAdd()
           {
                 var url="allusersAdd.jsp";
				 window.location.href=url;
           }
           
           
           function go(index)
           {
               document.form123.index.value=index;
               document.form123.action="allusersList.action"
               document.form123.submit();
           }  
		    function check()
           {
               document.formAdd.submit();
           }
       </script>

  <body >
<form  action="allusersAdd.action"  method="post" name="f1"  onsubmit="return checkform();">
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    
     <tr>
      <td width="200">用户名：<input name="addtime" type="hidden" id="addtime" value="<%=connDbBean.gettime()%>" /></td>
      <td><input name="username" type="text" id="username" onblur='hsgcheck()' /> <label id='clabelusername' />
      *</td>
    </tr>
    <tr>
      <td width="200">密码：</td>
      <td><input name="pwd" type="password" id="pwd" onblur='checkform()' /> <label id='clabelpwd' />
      *</td>
    </tr>
    <tr>
      <td width="200">确认密码：</td>
      <td><input name="pwd2" type="password" id="pwd2" onblur='checkform()' /> <label id='clabelpwd2' />
      *</td>
    </tr>
    <tr>
      <td width="200">&nbsp;</td>
      <td><input type="submit" name="Submit5" id="Submit5" value="提交" onClick="return checkform();"/>
      <input name="Submit2" type="reset"  value="重置" /></td>
    </tr>
  </table>
</form>
<p>已有管理员列表：</p>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td bgcolor="A4B6D7">序号</td>
    <td bgcolor="A4B6D7">用户名</td>
    <td bgcolor="A4B6D7">密码</td>
    <td bgcolor="A4B6D7">权限</td>
    <td bgcolor="A4B6D7">添加时间</td>
    <td bgcolor="A4B6D7">操作</td>
  </tr>
 <%
					int i=0;
				%>
			
				<c:forEach items="${requestScope.allusersList}" var="allusers">
				<%
					i++;
				%>
  <tr>
    <td><%=i %></td>
    <td>${allusers.username}</td>
    <td>${allusers.pwd}</td>
    <td>${allusers.cx}</td>
    <td>${allusers.addtime}</td>
    <td> <input type="button" value="删除" onClick="allusersDel(${allusers.id})"/></td>
  </tr>
 </c:forEach>
</table>
  </body>
</html>

<script language=javascript src='js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='js/popup.js'></script>
<script language=javascript src='js/ajax.js'></script>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<script language=javascript >  
 function hsgcheck()
{
 	var usernameobj = document.getElementById("username"); if(usernameobj.value==""){document.getElementById("clabelusername").innerHTML="&nbsp;&nbsp;<font color=red>请输入用户名</font>";return false;}else{document.getElementById("clabelusername").innerHTML="  "; } 
 	loginService.allusersjiance(document.getElementById("username").value,callback);
}
 function checkform(){  

var pwdobj = document.getElementById("pwd");  
if(pwdobj.value==""){  
document.getElementById("clabelpwd").innerHTML="&nbsp;&nbsp;<font color=red>请输入密码</font>";  
return false;  
}else{
document.getElementById("clabelpwd").innerHTML="  ";  
}  

var pwd2obj = document.getElementById("pwd2");  
if(pwd2obj.value==""){  
document.getElementById("clabelpwd2").innerHTML="&nbsp;&nbsp;<font color=red>请再次输入密码</font>";  
return false;  
}else{
document.getElementById("clabelpwd2").innerHTML="  ";  
}

if(pwd2obj.value!=pwdobj.value){  
document.getElementById("clabelpwd2").innerHTML="&nbsp;&nbsp;<font color=red>两次密码输入不一致</font>";  
return false;  
}else{
document.getElementById("clabelpwd2").innerHTML="  ";  
}
 
  



return true;   
}   

function callback(data)
{
	if(data=="Y")
	{
		document.getElementById("clabelusername").innerHTML="&nbsp;&nbsp;<font color=red>用户名已存在</font>";
		document.getElementById("Submit5").disabled="disabled";
	}
	else
	{
		document.getElementById("clabelusername").innerHTML="  ";  
		document.getElementById("Submit5").disabled="";
	} 
}

popheight=450;
</script>  


