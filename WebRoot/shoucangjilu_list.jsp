<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("gb2312");%>
<jsp:useBean id="shoucangjiluhsgb" scope="page" class="com.action.shoucangjiluAction" /> 



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>收藏记录查询</TITLE>
	<LINK href="css.css" type=text/css rel=stylesheet />
	
		
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
           function shoucangjiluDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="shoucangjiluDel.action?id="+id;
               }
           }
           
		   function shoucangjiluDetail(id)
           {
                  //tanchuangfanshi1 window.location.href="shoucangjiluDetail.action?id="+id;
				  //tanchuangfanshi2 window.open("shoucangjiluDetail.action?id="+id,"_blank");
           }
           function shoucangjiluPre(id)
           {
                   window.location.href="shoucangjiluPre.action?id="+id;
           }
		   function shoucangjiluPrelb(id)
           {
                   window.location.href="shoucangjiluPrelb.action?id="+id;
           }
           function shoucangjiluIssh(id)
           {
                   window.location.href="shoucangjiluIssh.action?id="+id;
           }
           function shoucangjiluAdd()
           {
                 var url="shoucangjiluAdd.jsp";
				 window.location.href=url;
           }
           
           
           function go(index)
           {
               document.form123.index.value=index;
               document.form123.action="shoucangjiluList.action"
               document.form123.submit();
           }  
		    function check()
           {
               document.formAdd.submit();
           }
       </script>
	   
	</head>

	<body leftmargin="2" topmargin="9" background='img/allbg.gif' onload="catelogAll()">
	
	<form action="shoucangjiluList.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="10" colspan="8" background="img/tbg.gif">所有收藏记录列表</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    
					      <td  bgcolor="#FFFFFF" align="left">
						  搜索:  username：<input name="username" type="text" id="username" style='border:solid 1px #000000; color:#666666' size="12" />  xwid：<input name="xwid" type="text" id="xwid" style='border:solid 1px #000000; color:#666666' size="12" />
					        <input name="button" type="button" onclick="check()" value="提交"/>
					      
                             </td>
						</tr>
					 </table>
	</form>
			
			<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
				
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="50">序号</td>
					<td >username</td>    <td >xwid</td>    <td >字段</td>    <td >表</td>    
					
					<td width="140">添加时间</td>
					<td width="140">操作</td>
		        </tr>
				<%
					int i=0;
				%>
				<c:forEach items="${requestScope.page.data}" var="shoucangjilu" varStatus="sta">
				<%
					i++;
				%>
				<tr align='center' bgcolor="#FFFFFF" onMouseOver="this.style.backgroundColor='#EDDCC2'" onMouseOut="this.style.backgroundColor='#ffffff'" height="22">
					<td><%=i%></td>
					<td>${shoucangjilu.username}</td>    <td>${shoucangjilu.xwid}</td>    <td>${shoucangjilu.ziduan}</td>    <td>${shoucangjilu.biao}</td>    
					
					<td>${shoucangjilu.addtime}</td>
					<td  align="center" width="200px">
						     <input type="button" value="删除" onclick="shoucangjiluDel(${shoucangjilu.id})"/>
						     <input type="button" value="编辑" onclick="shoucangjiluPre(${shoucangjilu.id})"/>
							 
							 
					</td>
				</tr>
				</c:forEach>
			</table>
			
			
			
			<%@ include file="hsgfenye.jsp"%> 
			
			
	</body>
</html>
