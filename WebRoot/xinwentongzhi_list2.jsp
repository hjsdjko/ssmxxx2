<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>新闻通知查询</TITLE>
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
           function xinwentongzhiDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="xinwentongzhiDel.action?id="+id;
               }
           }
           
           function xinwentongzhiPre(id)
           {
                   window.location.href="xinwentongzhiPre.action?id="+id;
           }
           function yonghuzhuceIssh(id)
           {
                   window.location.href="xinwentongzhiIssh.action?id="+id;
           }
           function xinwentongzhiAdd()
           {
                 var url="xinwentongzhiAdd.jsp";
				 window.location.href=url;
           }
           
           
           function go(index,lb)
           {
               document.form123.index.value=index;
               document.form123.action="xinwentongzhiList2.action?lb="+lb
               document.form123.submit();
           }  
		    function check()
           {
               document.formAdd.submit();
           }
       </script>
	   
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<%
String lb=request.getParameter("lb");
%>
	<body leftmargin="2" topmargin="9" background='img/allbg.gif' onload="catelogAll()">
	
	<form action="xinwentongzhiList2.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="10" colspan="8" background="img/tbg.gif">&nbsp;&nbsp;当前已有<%=lb%>列表</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    
					      <td  bgcolor="#FFFFFF" align="left">
						  搜索:  标题：<input name="biaoti" type="text" id="biaoti" style='border:solid 1px #000000; color:#666666' size="12" />  添加人：<input name="tianjiaren" type="text" id="tianjiaren" style='border:solid 1px #000000; color:#666666' size="12" />
						  <input name="lb" type="hidden" id="lb" value="<%=lb%>" />
					        <input name="button" type="button" onclick="check()" value="提交"/>
					      
                          </td>
						</tr>
					 </table>
	</form>
			
			<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
				
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="50">序号</td>
					<td >标题</td>
    <td >类别</td>
    
    <td  width='90' align='center'>首页图片</td>
    <td >点击率</td>
    <td >添加人</td>
    
					
					<td width="140">添加时间</td>
					<td width="140">操作</td>
		        </tr>
				<%
					int i=0;
				%>
				<c:forEach items="${requestScope.page.data}" var="xinwentongzhi" varStatus="sta">
				<%
					i++;
				%>
				<tr align='center' bgcolor="#FFFFFF" onMouseOver="this.style.backgroundColor='#EDDCC2'" onMouseOut="this.style.backgroundColor='#ffffff'" height="22">
					<td><%=i%></td>
					<td align="left">${xinwentongzhi.biaoti}</td>
    <td>${xinwentongzhi.leibie}</td>
    
    <td width='90' align='center'><a href='${xinwentongzhi.shouyetupian}' target='_blank'><img src='${xinwentongzhi.shouyetupian}' width=88 height=99 border=0 /></a></td>
    <td>${xinwentongzhi.dianjilv}</td>
    <td>${xinwentongzhi.tianjiaren}</td>
    
					
					<td>${xinwentongzhi.addtime}</td>
					<td  align="center">
						     <input type="button" value="删除" onclick="xinwentongzhiDel(${xinwentongzhi.id})"/>
						     <input type="button" value="编辑" onclick="xinwentongzhiPre(${xinwentongzhi.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			
			<form action="" name="form123" method="post">
                  <input type="hidden" name="index"/>
            </form>
					               
			<br/>
		    <table border='0' cellpadding='0' cellspacing='0' align="center">
		        <tr>
			        <td width='98%' align="right">
			                  共<span style='color:#FF0000'>${requestScope.page.totle}</span>条记录&nbsp;&nbsp;&nbsp;&nbsp;
			                  每页<span style='color:#FF0000'>${requestScope.page.pageSize}</span>条&nbsp;&nbsp;&nbsp;&nbsp;
			                  第<span style='color:#FF0000'>${requestScope.page.index}</span>页/共${requestScope.page.totlePage}页&nbsp;&nbsp;&nbsp;&nbsp;
			                <c:if test="${requestScope.page.index==1}">
			                       首&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;
			                </c:if>
			                <c:if test="${requestScope.page.index!=1}">
			                       <a style='color: red' href='#' onclick="go(1,'<%=lb%>')">首&nbsp;&nbsp;页</a>
			                       &nbsp;&nbsp;&nbsp;&nbsp;
			                       <a style='color: red' href='#' onclick="go(${requestScope.page.index-1},'<%=lb%>')">上一页</a>
			                       &nbsp;&nbsp;&nbsp;&nbsp;
			                </c:if>
			                <c:if test="${requestScope.page.index >= requestScope.page.totlePage}">
			                          下一页&nbsp;&nbsp;&nbsp;&nbsp;末&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;
			                </c:if>
			                <c:if test="${requestScope.page.index < requestScope.page.totlePage}">
			                       <a style='color: red' href='#' onclick="go(${requestScope.page.index+1},'<%=lb%>')">下一页</a>
			                       &nbsp;&nbsp;&nbsp;&nbsp;
			                       <a style='color: red' href='#' onclick="go(${requestScope.page.totlePage},'<%=lb%>')">末&nbsp;&nbsp;页</a>
			                </c:if>
			        </td>
		       </tr>
		    </table>  
			
			
</body>
</html>
