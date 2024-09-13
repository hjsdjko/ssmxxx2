<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dingdanxinxihsgb" scope="page" class="com.action.dingdanxinxiAction" /> 



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>订单信息查询</TITLE>
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
           function dingdanxinxiDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="dingdanxinxiDel.action?id="+id;
               }
           }
           function dingdanxinxiDetail(id)
           {
                  // window.location.href="dingdanxinxiDetail.action?id="+id;
				   window.open("dingdanxinxiDetail.action?id="+id,"_blank");
           }
           function dingdanxinxiPre(id)
           {
                   window.location.href="dingdanxinxiPre.action?id="+id;
           }
           function dingdanxinxiIssh(id)
           {
                   window.location.href="dingdanxinxiIssh.action?id="+id;
           }
		   function zhifu(id,biao)
           {
                   window.location.href="zhifu/index.jsp?id="+id+"&biao="+biao;
           }
           function dingdanxinxiAdd()
           {
                 var url="dingdanxinxiAdd.jsp";
				 window.location.href=url;
           }
           
           
           function go(index)
           {
               document.form123.index.value=index;
               document.form123.action="dingdanxinxiList2.action"
               document.form123.submit();
           }  
		    function check()
           {
               document.formAdd.submit();
           }
       </script>
	   
	</head>

	<body leftmargin="2" topmargin="9" background='img/allbg.gif' onload="catelogAll()">
	
	<form action="dingdanxinxiList2.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="1" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="10" colspan="8" background="img/tbg.gif">&nbsp;&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    
					      <td  bgcolor="#FFFFFF" align="left">
						  搜索:  订单号：<input name="dingdanhao" type="text" id="dingdanhao" class="form-control2" />  订单内容：<input name="dingdanneirong" type="text" id="dingdanneirong" class="form-control2" />
					        <input name="button" type="button" onclick="check()" value="提交" class="btn btn-info btn-small" />
					      
                          </td>
						</tr>
					 </table>
	</form>
			
			<table width="98%" align="center" border="1" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
				
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="50" height="30">序号</td>
					<td >订单号</td>        <td >订单金额</td>    <td >购买人</td>    <td >电话</td>    <td >地址</td>        <td  width='80' align='center'>是否支付</td>    
					
					<td width="140" height="30">添加时间</td>
					<td width="140" height="30">操作</td>
		        </tr>
				<%
					int i=0;
				%>
				<c:forEach items="${requestScope.page.data}" var="dingdanxinxi" varStatus="sta">
				<%
					i++;
				%>
				<tr align='center' bgcolor="#FFFFFF" onMouseOver="this.style.backgroundColor='#EDDCC2'" onMouseOut="this.style.backgroundColor='#ffffff'" height="22">
					<td height="45"><%=i%></td>
					<td>${dingdanxinxi.dingdanhao}</td>        <td>${dingdanxinxi.dingdanjine}</td>    <td>${dingdanxinxi.goumairen}</td>    <td>${dingdanxinxi.dianhua}</td>    <td>${dingdanxinxi.dizhi}</td>        <td align='center'>${dingdanxinxi.iszf} <c:if test="${dingdanxinxi.iszf=='否'}"><input type="button" value="支付" onclick="zhifu(${dingdanxinxi.id},'t_dingdanxinxi')" class="btn btn-info btn-small" /></c:if> </td>    
					
					<td height="45">${dingdanxinxi.addtime}</td>
					<td height="45"  align="center">
						 
						 	<input type="button" value="删除" onclick="dingdanxinxiDel(${dingdanxinxi.id})" class="btn btn-info btn-small"/>
						     
						     
						 
						 	 <input type="button" value="详细" onclick="dingdanxinxiDetail(${dingdanxinxi.id})" class="btn btn-info btn-small"/>
				  </td>
				</tr>
				</c:forEach>
	</table>
			
			
			
			<%@ include file="hsgfenye.jsp"%> 
			
			
	</body>
</html>
