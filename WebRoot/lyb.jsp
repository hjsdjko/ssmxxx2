<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>在线留言</title>
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

<body>
<%@ include file="qttop.jsp"%>
<%@ include file="sidebufen1.jsp"%>


<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			<em>你的梦想我很在意 更支持</em>
			<div class="line">
				<h3>在线留言<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  
				   <div class="content-form">
				<form  action="liuyanbanAdd.action"  method="post" name="f1"  onsubmit="return checkform();">
						<table width="1120" height="517" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#78BAEF" style="border-collapse:collapse">
						 
                            <tr>
                              <td width="12%" align="center">昵称：
                              <input name="addtime" type="hidden" id="addtime" value="<%=connDbBean.gettime()%>" /></td>
                              <td width="88%" align="left"><input name='cheng' type='text' id='cheng' value='' onblur='checkform()' class="user" /> <label id='clabelcheng' />
                              *</td>
                            </tr>
                            <tr>
                              <td align="center">头像：</td>
                              <td align="left"><input name="xingbie" type="radio" value="1" checked>
                                  <img src="img/1.gif" width="64" height="71">
                                  <input type="radio" name="xingbie" value="2">
                                  <img src="img/2.gif" width="64" height="71">
                                  <input type="radio" name="xingbie" value="3">
                                  <img src="img/3.gif" width="64" height="71">
                                  <input type="radio" name="xingbie" value="4">
                                  <img src="img/4.gif" width="64" height="71">
                                  <input type="radio" name="xingbie" value="5">
                              <img src="img/5.gif" width="64" height="71"></td>
                            </tr>
                            <tr>
                              <td align="center">QQ：</td>
                              <td align="left"><input name='QQ' type='text' id='QQ' value='' class="user" /></td>
                            </tr>
                            <tr>
                              <td align="center">邮箱：</td>
                              <td align="left"><input name='youxiang' type='text' id='youxiang' value='' class="user" /></td>
                            </tr>
                            <tr>
                              <td align="center">电话：</td>
                              <td align="left"><input name='dianhua' type='text' id='dianhua' value='' class="user" /></td>
                            </tr>
                            <tr>
                              <td align="center">内容：</td>
                              <td align="left"><textarea name="neirong" cols="50" rows="10" id="neirong" onblur='checkform()' style="width:500px; height:100px;" class="user"></textarea>
                              * <label id='clabelneirong' /> </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td align="left"><input type="submit" name="Submit42" value="提交" onClick="return checkform();" class="content-form-signup" />
                              <input type="reset" name="Submit22" value="重置"  class="content-form-signup" /></td>
                            </tr>
                         
                  </table>
		        </form>  
					</div>
					
							</ul>
		</div>
		
	</div>
</div>
<%@ include file="qtdown.jsp"%>

</body></html>
<script language=javascript >  
 function checkform(){  
var chengobj = document.getElementById("cheng");  
if(chengobj.value==""){  
document.getElementById("clabelcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入昵称</font>";  
return false;  
}else{
document.getElementById("clabelcheng").innerHTML="  ";  
}  
  
var neirongobj = document.getElementById("neirong");  
if(neirongobj.value==""){  
document.getElementById("clabelneirong").innerHTML="&nbsp;&nbsp;<font color=red>请输入留言内容</font>";  
return false;  
}else{
document.getElementById("clabelneirong").innerHTML="  ";  
}  
return true;   
}   
</script>