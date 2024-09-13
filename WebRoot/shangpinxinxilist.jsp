<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<jsp:useBean id="shangpinxinxihsgb" scope="page" class="com.action.shangpinxinxiAction" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>药品信息</title>

	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta name="author" content="">
	<meta name="format-detection" content="telephone=no">
	<link href="qtimages/Layout.css" rel="stylesheet" type="text/css">
	<script src="qtimages/getjs_bdtj"></script><script charset="utf-8" src="qtimages/insert_bdtj"></script><script src="qtimages/conv.js"></script><script src="qtimages/hm.js"></script>					<script type="text/javascript" src="qtimages/jquery1.42.min.js"></script>
	<script type="text/javascript" src="qtimages/jquery.SuperSlide.2.1.1.js"></script>
	<script src="qtimages/scrollReveal.js"></script> 
	 <link rel="stylesheet" href="./qtimages/sl_common_form.css">
</head>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
        <script language="javascript">
		  
             function check()
           {
               document.formssearch.submit();
           }
           
         
           
           function go(index)
           {
               document.form123.index.value=index;
               document.form123.action="spxxList.action"
               document.form123.submit();
           }  
		   
       </script>
<%

%>

<body>
<%@ include file="qttop.jsp"%>
<%@ include file="sidebufen1.jsp"%>


<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			<em>你的梦想我很在意 更支持</em>
			<div class="line">
				<h3>药品信息<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  
				  <div class="content-form">
				  <link rel="stylesheet" href="images/hsgcommon/divqt.css" type="text/css">


<form action="spxxList.action" name="formssearch" method="post" style="width:100%">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="10" colspan="8" background="img/tbg.gif">&nbsp;&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    
					      <td  bgcolor="#FFFFFF" align="left">
						 搜索:  药品编号：<input name="shangpinbianhao" type="text" id="shangpinbianhao" class="form-control2" />  药品名称：<input name="shangpinmingcheng" type="text" id="shangpinmingcheng" class="form-control2" />
					        <input name="button" type="button" onClick="check()" value="提交" class='hsgqiehuanshitu' /> <input type="button" name="Submit2" value="切换视图" class='hsgqiehuanshitu' onClick="javascript:location.href='spxxListtp.action';" />
					      
                          </td>
						</tr>
					 </table>
	</form>
	
<br />
<table width="98%" border="0"  align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse" class="newsline">
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>药品编号</td>
    <td bgcolor='#CCFFFF'>药品名称</td>
    <td bgcolor='#CCFFFF'>药品类别</td>
    <td bgcolor='#CCFFFF'>制药公司</td>
    <td bgcolor='#CCFFFF'>价格</td>
    <td bgcolor='#CCFFFF'>库存</td>
    <td bgcolor='#CCFFFF'>销量</td>
    <td bgcolor='#CCFFFF' width='90' align='center'>图片</td>
    
    <td bgcolor='#CCFFFF'>药效</td>
    
   
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  
                     <%
					int i=0;
				%>
				<c:forEach items="${requestScope.page.data}" var="shangpinxinxi" varStatus="sta">
				<%
					i++;
				%>
  <tr onMouseOver="this.style.backgroundColor='#EDDCC2'" onMouseOut="this.style.backgroundColor='#ffffff'">
    <td  align="center"><%=i+1 %></td>
    <td>${shangpinxinxi.shangpinbianhao}</td>
    <td>${shangpinxinxi.shangpinmingcheng}</td>
    <td>${shangpinxinxi.shangpinleibie}</td>
    <td>${shangpinxinxi.zhiyaogongsi}</td>
    <td>${shangpinxinxi.jiage}</td>
    <td>${shangpinxinxi.kucun}</td>
    <td>${shangpinxinxi.xiaoliang}</td>
    <td width='90'><a href='${shangpinxinxi.tupian}' target='_blank'><img src='${shangpinxinxi.tupian}' width=88 height=99 border=0 /></a></td>
    
    <td>${shangpinxinxi.yaoxiao}</td>
    
	
    <td  align="center"><a href="spxxDetail.action?id=${shangpinxinxi.id}">详细</a></td>
  </tr>
  </c:forEach>
   
</table>
<br>

<%@ include file="hsgfenye.jsp"%> 




					</div>
					
					
							</ul>
		</div>
		
	</div>
</div>
<%@ include file="qtdown.jsp"%>


</body>
</html>
