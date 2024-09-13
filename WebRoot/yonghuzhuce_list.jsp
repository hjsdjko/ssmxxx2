<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>用户注册查询</TITLE>
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
           function yonghuzhuceDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="yonghuzhuceDel.action?id="+id;
               }
           }
           
           function yonghuzhucePre(id)
           {
                   window.location.href="yonghuzhucePre.action?id="+id;
           }
           function yonghuzhuceIssh(id)
           {
                   window.location.href="yonghuzhuceIssh.action?id="+id;
           }
           function yonghuzhuceAdd()
           {
                 var url="yonghuzhuceAdd.jsp";
				 window.location.href=url;
           }
           
           
           function go(index)
           {
               document.form123.index.value=index;
               document.form123.action="yonghuzhuceList.action"
               document.form123.submit();
           }  
		    function check()
           {
               document.formAdd.submit();
           }
       </script>
	   
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

	<body leftmargin="2" topmargin="9" background='img/allbg.gif' onload="catelogAll()">
	
	<form action="yonghuzhuceList.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="10" colspan="8" background="img/tbg.gif">&nbsp;&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    
					      <td  bgcolor="#FFFFFF" align="left">
						  搜索:  用户名：<input name="yonghuming" type="text" id="yonghuming" style='border:solid 1px #000000; color:#666666' size="12" />  姓名：<input name="xingming" type="text" id="xingming" style='border:solid 1px #000000; color:#666666' size="12" />
					        <input name="button" type="button" onclick="check()" value="提交"/>
					      
                             </td>
						</tr>
					 </table>
	</form>
			
			<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
				
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td>序号</td>
					<td >用户名</td>
    <td >密码</td>
    <td >姓名</td>
    <td  width='40' align='center'>性别</td>
    <td  width='65' align='center'>出生年月</td>
    <td >qq</td>
    <td >邮箱</td>
    <td >电话</td>
    <td >身份证</td>
    <td  width='90' align='center'>头像</td>
    <td >地址</td>
    
    <td  width='80' align='center'>是否审核</td>
	 <td >添加时间</td>
					<td>操作</td>
		        </tr>
				<%
					int i=0;
				%>
				<c:forEach items="${requestScope.page.data}" var="yonghuzhuce" varStatus="sta">
				<%
					i++;
				%>
				<tr align='center' bgcolor="#FFFFFF" onMouseOver="this.style.backgroundColor='#EDDCC2'" onMouseOut="this.style.backgroundColor='#ffffff'" height="22">
					<td><%=i%></td>
					<td>${yonghuzhuce.yonghuming}</td>
    <td>${yonghuzhuce.mima}</td>
    <td>${yonghuzhuce.xingming}</td>
    <td align='center'>${yonghuzhuce.xingbie}</td>
    <td>${yonghuzhuce.chushengnianyue}</td>
    <td>${yonghuzhuce.qq}</td>
    <td>${yonghuzhuce.youxiang}</td>
    <td>${yonghuzhuce.dianhua}</td>
    <td>${yonghuzhuce.shenfenzheng}</td>
    <td width='90' align='center'><a href='${yonghuzhuce.touxiang}' target='_blank'><img src='${yonghuzhuce.touxiang}' width=88 height=99 border=0 /></a></td>
    <td>${yonghuzhuce.dizhi}</td>
    
    <td align='center'>${yonghuzhuce.issh} <input type="button" value="审核" onclick="yonghuzhuceIssh(${yonghuzhuce.id})"/></td>
				<td>${yonghuzhuce.addtime}</td>	
					<td  align="center">
						     <input type="button" value="删除" onclick="yonghuzhuceDel(${yonghuzhuce.id})"/>
						     <input type="button" value="编辑" onclick="yonghuzhucePre(${yonghuzhuce.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			
			<%@ include file="hsgfenye.jsp"%> 
			
			
	</body>
</html>
