<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>留言板查询</TITLE> 
	<LINK href="css.css" type=text/css rel=stylesheet />
	
		
		<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>

        <script language="javascript">
		   function catelogAll()
           {
                   document.getElementById("indicator").style.display="block";
                   loginService.catelogAll(callback);
               
           }
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("catelog_id",data,"id","name");
           }
           function liuyanbanDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="liuyanbanDel.action?id="+id;
               }
           }
           
           function liuyanbanPre(id)
           {
                   window.location.href="liuyanbanPre.action?id="+id;
           }
		   function liuyanbanHf(id)
           {
                   window.location.href="liuyanbanHf.action?id="+id;
           }
           function yonghuzhuceIssh(id)
           {
                   window.location.href="liuyanbanIssh.action?id="+id;
           }
           function liuyanbanAdd()
           {
                 var url="liuyanbanAdd.jsp";
				 window.location.href=url;
           }
           
           
           function go(index)
           {
               document.form123.index.value=index;
               document.form123.action="liuyanbanList.action"
               document.form123.submit();
           }  
		    function check()
           {
               document.formAdd.submit();
           }
       </script>
	   
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

	<body leftmargin="2" topmargin="9" background='img/allbg.gif' onload="catelogAll()">
	
	<form action="liuyanbanList.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="10" colspan="8" background="img/tbg.gif">&nbsp;&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    
					      <td  bgcolor="#FFFFFF" align="left">
						  搜索:  昵称：<input name="cheng" type="text" id="cheng" style='border:solid 1px #000000; color:#666666' size="12" />  QQ：<input name="QQ" type="text" id="QQ" style='border:solid 1px #000000; color:#666666' size="12" />  邮箱：<input name="youxiang" type="text" id="youxiang" style='border:solid 1px #000000; color:#666666' size="12" />  电话：<input name="dianhua" type="text" id="dianhua" style='border:solid 1px #000000; color:#666666' size="12" />
					        <input name="button" type="button" onclick="check()" value="提交"/>
					      
                             </td>
						</tr>
					 </table>
	</form>
			
			<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
				
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="50">序号</td>
					<td >昵称</td>
    <td >头像</td>
    <td >QQ</td>
    <td >邮箱</td>
    <td >电话</td>
    <td >内容</td>
    <td >回复内容</td>
    
					
					<td width="140">添加时间</td>
					<td width="140">操作</td>
		        </tr>
				<%
					int i=0;
				%>
				<c:forEach items="${requestScope.page.data}" var="liuyanban" varStatus="sta">
				<%
					i++;
				%>
				<tr align='center' bgcolor="#FFFFFF" onMouseOver="this.style.backgroundColor='#EDDCC2'" onMouseOut="this.style.backgroundColor='#ffffff'" height="22">
					<td><%=i%></td>
					<td>${liuyanban.cheng}</td>
    <td><img src='img/${liuyanban.xingbie}.gif' width=88 height=99 border=0 /></td>
    <td>${liuyanban.QQ}</td>
    <td>${liuyanban.youxiang}</td>
    <td>${liuyanban.dianhua}</td>
    <td>${liuyanban.neirong}</td>
    <td>${liuyanban.huifuneirong}</td>
    
					
					<td>${liuyanban.addtime}</td>
					<td  align="center">
						     <input type="button" value="删除" onclick="liuyanbanDel(${liuyanban.id})"/>
						     <input type="button" value="回复" onclick="liuyanbanHf(${liuyanban.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			
			<%@ include file="hsgfenye.jsp"%> 
			
			
	</body>
</html>
