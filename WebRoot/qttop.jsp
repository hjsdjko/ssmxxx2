<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="top"> 
	<div class="container">
		<p class="fl">欢迎访问：医院药品管理系统</p>
        
        <p class="fl" style="font-size:15px">
        &nbsp;&nbsp;&nbsp;
        
		
		 <%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
     %>
        <a href="userlog.jsp" >登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="yonghuadd.jsp" >注册</a>
		 <%}else{ %>
	 <%=request.getSession().getAttribute("username")%>,[<%=request.getSession().getAttribute("cx")%>]&nbsp; <a href="logout.jsp" onclick="return confirm('确定要退出？')" >退出</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="main.jsp" >后台</a>
	      <%} %>
		
		
        </p>
        
		<div class="fr">
			<ul>
				<li><a >加入收藏 </a></li>
				<li><a >联系我们  </a></li>
				<li>咨询电话：13186835580</li>
			</ul>
		</div>
	</div>
</div>

<div class="head">
	<div class="container">
		<div class="logo fl">
			<a href="index.action"><h1 style="float:left"><img src="qtimages/gg.jpg" height="50" width="200" ></h1></a>
         <p style="margin-top:10px; float:left; margin-left:-50px; font-size:18px; color:#900">医院药品管理系统</p>
		</div>
		<div class="head-tel fr">
			<span>咨询热线：<strong>131-8683-5580</strong></span>
		</div>
	</div>
</div>
<div class="nav">
	<div class="container c">
		<div class="nav-list fr">
    			<ul id="nav">
					<li class="on"><a href="index.action">网站首页</a></li>
					
		 		
					</li><li><a style="cursor:pointer">药品信息</a>
							 <dl class="hide" style="display: none;">
							 	<em><a href='spxxListtp.action'>药品信息</a></em> 
							</dl>
					</li><!--yoxulixuyaxn-->
					<li><a href="login.jsp">后台管理</a></li>
				</ul>
		</div>
	</div>
</div>
<script>
	jQuery("#nav li:has(dl)").hover(function(){  
	   jQuery(this).children("dl").stop(true,true).slideDown(400); 
	  },function(){  
	   jQuery(this).children("dl").stop(true,true).slideUp("fast");  
	});
</script>