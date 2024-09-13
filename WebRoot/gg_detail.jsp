<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>内容详细</title>
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
 <%
  String id=request.getParameter("id");
  connDbBean.hsgexecute("update t_xinwentongzhi set dianjilv=dianjilv+1 where id="+id);
%>
<body>
<%@ include file="qttop.jsp"%>
<%@ include file="sidebufen1.jsp"%>


<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			<em>你的梦想我很在意 更支持</em>
			<div class="line">
				<h3>内容详细<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  
				  
				  <table width="97%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#B8D8E8" class="newsline" style="border-collapse:collapse">
                            <tr>
                              <td height="33" align="center"><font style="color:#e0b508; font-size:18px;font-weight:bold" ><s:property value="#request.ggdetail.biaoti"/> (被点击<s:property value="#request.ggdetail.dianjilv"/>次)</font></td>
                            </tr>
                            <tr>
                              <td height="104"><s:property value="#request.ggdetail.neirong" escape="false"/></td>
                            </tr>
                            <tr>
                              <td align="right"><input type="button" onClick="javaScript:history.back();" value="返回" class="content-form-signup"  /></td>
                            </tr>
                          </table>
					
					
					
							</ul>
		</div>
		
	</div>
</div>
<%@ include file="qtdown.jsp"%>

</body></html>