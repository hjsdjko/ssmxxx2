<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="code" scope="page" class="com.util.CheckCode" />
<%request.setCharacterEncoding("utf-8");%>

 <script type='text/javascript' src='dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='dwr/engine.js'></script>
        <script type='text/javascript' src='dwr/util.js'></script>
<script language="javascript">
		function checklog()
		{                                                                                         
		     if(document.userlog.username.value=="")
			 {
			 	alert("请输入用户名");
				document.userlog.username.focus();
				return false;
			 }
			 if(document.userlog.pwd1.value=="")
			 {
			 	alert("请输入密码");
				document.userlog.pwd1.focus();
				return false;
			 }
			 
			if (document.userlog.pagerandom.value != document.userlog.yzm.value) {
			alert("验证码错误！");
			document.userlog.pagerandom.focus();
			return false;
	}
			 document.getElementById("indicator").style.display="block";
			 loginService.login(document.userlog.username.value,document.userlog.pwd1.value,document.userlog.cx.value,callback);
		}
		
		function callback(data)
		{
		    document.getElementById("indicator").style.display="none";
		    if(data=="noyzm")
		    {
		        alert("验证码错误");
		    }
			if(data=="no")
		    {
		        alert("用户名或密码错误");
		    }
		    if(data=="yes")
		    {
		        alert("通过验证,系统登录成功");
		        window.location.href="index.action";
		    }
		    
		}
		
		
		
	    </script>
 <c:if test="${sessionScope.username==null}">
                          <form action="" method="post" name="userlog" id="userlog" style="display: inline">
						  <table width='100%' height='302' border='0' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF' class='newsline'>
                              <tr>
                                <td height='48' colspan='4' style='padding-left:30px; font-size:20px;'><strong>用户登陆</strong></td>
                              </tr>
                              <tr>
                                <td width='60' height='28'>&nbsp;</td>
                                <td width='176' height='28' align="left">用户名:</td>
                                <td height='28' colspan='2' align="left"><input name='username' type='text' id='username' placeholder='请输入用户名' class="user"  /></td>
                              </tr>
                              <tr>
                                <td height='28'>&nbsp;</td>
                             <td height='28' align="left">密码:</td>
                                <td height='28' colspan='2' align="left"><input name='pwd1' type='password' id='pwd1' placeholder='请输入密码' class="user" /></td>
                              </tr>
                              <tr >
                                <td height='28'>&nbsp;</td>
                                <td height='28' align="left">权限:</td>
                                <td height='28' colspan='2' align="left"><select name='cx' id='cx' class="user" >
<option value='用户'>用户</option>

                                </select></td>
                              </tr>
                              <tr >
                                <td height='28'>&nbsp;</td>
                                <td height='28' align="left">验证码:</td>
                                <td width='131' height='28' align="left"><input name="pagerandom" type="text" id="pagerandom" onKeyUp="this.value=this.value.replace(/\D/gi,'')" class="user" style="width:50px;" /></td>
                                <td width='1134' align="left"><%
								String yzm=code.getCheckCode();
								%>  <input type="hidden" name="yzm" value="<%=yzm %>" >
							    <%=yzm %></td>
                              </tr>
                              <tr>
                                <td height='38' align='center'>&nbsp;</td>
                                <td height='38' align='left'>&nbsp;</td>
                                <td height='38' colspan='2' align="left"><input type='button' name='Submit' value='登陆'  onclick='return checklog();' class="content-form-signup" /><img id="indicator" src="images/loading.gif" style="display:none"/>
                                <input type='reset' name='Submit2' value='重置' class="content-form-signup" /></td>
                              </tr>
                            </table>
   </form>
 </c:if>
 <c:if test="${sessionScope.username!=null}">

<table width='100%' height='300' border='0' align='center' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'>
                            <tr>
                              <td height='28' align='left' style='padding-left:20px; font-size:20px;'>当前用户：${sessionScope.username}</td>
                            </tr>
							 <tr>
                              <td height='28' align='left' style='padding-left:20px; font-size:20px;'>您的权限： ${sessionScope.cx}</td>
                            </tr>
                            <tr>
                              <td height='28' align='left' style='padding-left:20px; font-size:20px;'>欢迎您的到来!!!</td>
                            </tr>
                            <tr>
                              <td height='28' align='center'><input type='button' name='Submit3' value='退出' onclick="javascript:location.href='logout.jsp';"  class="content-form-signup" />
                                  <input type='button' name='Submit22' value='个人后台' onclick="javascript:location.href='main.jsp';" class="content-form-signup" /></td>
                            </tr>
                          </table>
 </c:if>