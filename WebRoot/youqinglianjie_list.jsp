<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("gb2312");%>
<jsp:useBean id="youqinglianjiehsgb" scope="page" class="com.action.youqinglianjieAction" /> 



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>友情连接查询</TITLE>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">   
	
		
		<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
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
           function youqinglianjieDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="youqinglianjieDel.action?id="+id;
               }
           }
           
		   function youqinglianjieDetail(id)
           {
                  //tanchuangfanshi1 window.location.href="youqinglianjieDetail.action?id="+id;
				  //tanchuangfanshi2 window.open("yqljDetail.action?id="+id,"_blank");
           }
           function youqinglianjiePre(id)
           {
                   window.location.href="youqinglianjiePre.action?id="+id;
           }
		   function youqinglianjiePrelb(id)
           {
                   window.location.href="youqinglianjiePrelb.action?id="+id;
           }
           function youqinglianjieIssh(id)
           {
                   window.location.href="youqinglianjieIssh.action?id="+id;
           }
           function youqinglianjieAdd()
           {
                 var url="youqinglianjieAdd.jsp";
				 window.location.href=url;
           }
           
           
           function go(index)
           {
               document.form123.index.value=index;
               document.form123.action="youqinglianjieList.action"
               document.form123.submit();
           }  
		    function check()
           {
               document.formAdd.submit();
           }
       </script>
	   
	</head>

	<body leftmargin="2" topmargin="9" background='img/allbg.gif' onload="catelogAll()">
	
	<form action="youqinglianjieList.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="1" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="30" colspan="8" background="img/tbg.gif">所有友情连接列表</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="45">
						    
					      <td  bgcolor="#FFFFFF" align="left">
						  搜索:  网站名称：<input name="wangzhanmingcheng" type="text" id="wangzhanmingcheng" class="form-control2" />  网址：<input name="wangzhi" type="text" id="wangzhi" class="form-control2" />
					        <input name="button" type="button" onclick="check()" value="查询" class="btn btn-info btn-small"/> <input type="button" value="导出excel" onclick="javascript:location.href='youqinglianjie_listxls.jsp';" class="btn btn-info btn-small" />
					      
                          </td>
						</tr>
					 </table>
	</form>
			
			<table width="98%" align="center" border="1" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
				
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="50">序号</td>
					<td >网站名称</td>    <td >网址</td>    <td  width='90' align='center'>logo</td>    
					
					<td width="140">添加时间</td>
					<td width="150">操作</td>
		        </tr>
				<%
					int i=0;
				%>
				<c:forEach items="${requestScope.page.data}" var="youqinglianjie" varStatus="sta">
				<%
					i++;
				%>
				<tr align='center' bgcolor="#FFFFFF" onMouseOver="this.style.backgroundColor='#EDDCC2'" onMouseOut="this.style.backgroundColor='#ffffff'" height="22">
					<td height="45"><%=i%></td>
					<td>${youqinglianjie.wangzhanmingcheng}</td>    <td>${youqinglianjie.wangzhi}</td>    <td width='90' align='center'><a href='${youqinglianjie.logo}' target='_blank'><img src='${youqinglianjie.logo}' width=88 height=99 border=0 /></a></td>    
					
					<td height="45">${youqinglianjie.addtime}</td>
					<td width="150" height="45"  align="center">
						     <input type="button" value="删除" onclick="youqinglianjieDel(${youqinglianjie.id})" class="btn btn-info btn-small"/>
						     <input type="button" value="编辑" onclick="youqinglianjiePre(${youqinglianjie.id})" class="btn btn-info btn-small"/>
							 
							 
				  </td>
				</tr>
				</c:forEach>
	</table>
			
			
			
			<%@ include file="hsgfenye.jsp"%> 
			
			
	</body>
</html>
