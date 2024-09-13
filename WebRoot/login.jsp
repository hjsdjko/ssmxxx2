<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="code" scope="page" class="com.util.CheckCode" />
<!DOCTYPE html>
<head>
<title>医院药品管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="images/css/bootstrap.min.css" >
<link href="images/css/style.css" rel='stylesheet' type='text/css' />
<link href="images/css/style-responsive.css" rel="stylesheet"/>
<link rel="stylesheet" href="images/css/font.css" type="text/css"/>
<link href="images/css/font-awesome.css" rel="stylesheet"> 
<script src="images/js/jquery2.0.3.min.js"></script>
</head>
<script type='text/javascript' src='dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='dwr/engine.js'></script>
        <script type='text/javascript' src='dwr/util.js'></script>
		<script language="javascript">
		function check1()
		{                                                                                         
		     if(document.form1.username.value=="")
			 {
			 	alert("请输入用户名");
				document.form1.username.focus();
				return false;
			 }
			 if(document.form1.pwd.value=="")
			 {
			 	alert("请输入密码");
				document.form1.pwd.focus();
				return false;
			 }
			if (document.form1.pagerandom.value != document.form1.yzm.value)
			{
				alert("验证码错误！");
				document.form1.pagerandom.focus();
				return false;
			}
			 document.getElementById("indicator").style.display="block";
			 loginService.login(document.form1.username.value,document.form1.pwd.value,document.form1.cx.value,callback);
		}
		function callback(data)
		{
		    document.getElementById("indicator").style.display="none";
		    if(data=="no")
		    {
		        alert("用户名或密码错误");
		    }
		    if(data=="yes")
		    {
		        alert("通过验证,系统登录成功");
		        window.location.href="main.jsp";
		    }
		}
	    </script> 
<body>
<div class="log-w3">
<div class="w3layouts-main">
	<h2>医院药品管理系统</h2>
	
		 <form name="form1" method="post" action="">
			<input type="text" class="ggg"     name="username"  id="username"      placeholder="账号" required="">
			<input type="password" class="ggg" name="pwd" id="pwd" placeholder="密码" required="">
			<select name="cx" id="cx" class="hsgselect">
            <option value="管理员">管理员</option>

            </select>
			<input type="text" class="ggg"    name="pagerandom" id="pagerandom"       placeholder="验证码" required="" style="width:120px;"> 
			<%
								String yzm=code.getCheckCode();
								%>  <input type="hidden" name="yzm" value="<%=yzm %>" >
								<%=yzm %>
				<div class="clearfix"></div>
				<input type="button" onClick="return check1();" value="登   录"  ><img id="indicator" src="images/loading.gif" style="display:none"/>
		</form>
</div>
</div>
</body>
</html>
