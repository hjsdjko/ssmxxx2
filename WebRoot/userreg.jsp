<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%request.setCharacterEncoding("utf-8");%>
<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>用户注册</title>
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta name="author" content="">
	<meta name="format-detection" content="telephone=no">
	<link href="qtimages/Layout.css" rel="stylesheet" type="text/css">
	<script src="qtimages/getjs_bdtj"></script><script charset="utf-8" src="qtimages/insert_bdtj"></script><script src="qtimages/conv.js"></script><script src="qtimages/hm.js"></script>
	<script type="text/javascript" src="qtimages/jquery1.42.min.js"></script>
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
				<h3>用户注册<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  
				  <div class="content-form">
				   <form action="yonghuzhuceAdd.action" name="formAdd" method="post">
				     <table width="100%" height=750  align="center" cellpadding="3" cellspacing="1" class="newsline"  >
						<tr bgcolor="#E7E7E7">
							<td height="30" colspan="3" >用户注册</td>
						</tr>
						<tr ><td width="200">用户名：</td><td colspan="2"><input name='yonghuming' type='text' id='yonghuming' value='' onblur='checkform()' class="user"  />&nbsp;*<label id='clabelyonghuming' /></td></tr>
		                <tr bordercolor="#58AC22">
                          <td>密码：</td>
		                  <td><input name='mima' type='password' id='mima' value='' onblur='checkform()' class="user" style="width:150px;"  />
		                      <label id='clabelmima' />                          
		                    &nbsp;* </td>
		                  <td>确认密码：
		                    <input name='mima2' type='password' id='mima2' value='' onblur='checkform()' class="user" style="width:150px;" >
                              <label id='clabelmima2' />                          
	                      </td>
	                    </tr>
		<tr ><td width="200">姓名：</td><td colspan="2"><input name='xingming' type='text' id='xingming' value='' onblur='checkform()' class="user"  />&nbsp;*<label id='clabelxingming' /></td></tr>
		<tr ><td width="200">性别：</td><td colspan="2"><select name='xingbie' id='xingbie'><option value="男">男</option><option value="女">女</option></select></td></tr>
		<tr ><td width="200">出生年月：</td><td colspan="2"><input name='chushengnianyue' type='text' id='chushengnianyue' value='' style="width:150px;" onblur='' class="user"  readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" /></td></tr>
		<tr ><td width="200">qq：</td><td colspan="2"><input name='qq' type='text' id='qq' value='' onblur='' class="user"  /></td></tr>
		<tr ><td width="200">邮箱：</td><td colspan="2"><input name='youxiang' type='text' id='youxiang' value='' onblur='checkform()' class="user"  />&nbsp;<label id='clabelyouxiang' />必需邮箱格式</td></tr>
		<tr ><td width="200">电话：</td><td colspan="2"><input name='dianhua' type='text' id='dianhua' value='' onblur='checkform()' class="user"  />&nbsp;<label id='clabeldianhua' />必需电话格式</td></tr>
		<tr ><td width="200">身份证：</td><td colspan="2"><input name='shenfenzheng' type='text' id='shenfenzheng' value='' onblur='checkform()' class="user"  />&nbsp;<label id='clabelshenfenzheng' />必需身份证格式</td></tr>
		<tr 0><td width="200">头像：</td><td colspan="2"><input name='touxiang' type='text' id='touxiang' size='50' value='' onblur='' class="user"  />&nbsp;<input type='button' value='上传' onClick="up('touxiang')" class="content-form-signup" /></td></tr>
		<tr 1><td width="200">地址：</td><td colspan="2"><input name='dizhi' type='text' id='dizhi' value='' onblur='' size='50' class="user"  /></td></tr>
		<tr 2><td width="200">备注：</td><td colspan="2"><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' class="user" style="width:650px;" ></textarea></td></tr>
		
		
						<tr align='center'   height="22">
						    <td width="200"  align="right">&nbsp;						    </td>
						    <td width="75%" colspan="2"  align="left">
						     <input type="submit" name="Submit5" id="Submit5" value="提交" onClick="return checkform();" class="content-form-signup"/>
						       <input type="reset" value="重置" class="content-form-signup" />&nbsp;		<input name="addtime" type="hidden" id="addtime" value="<%=connDbBean.gettime()%>" />				    </td>
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
<script type="text/javascript" src="js/popup.js"></script>
<script language=javascript >  

function checkform(){  
	var yonghumingobj = document.getElementById("yonghuming"); if(yonghumingobj.value==""){document.getElementById("clabelyonghuming").innerHTML="&nbsp;&nbsp;<font color=red>请输入用户名</font>";return false;}else{document.getElementById("clabelyonghuming").innerHTML="  "; } 
	if(yonghumingobj.value!=""){  
var ajax = new AJAX();
ajax.post("factory/checkno.jsp?table=yonghuzhuce&col=yonghuming&value="+yonghumingobj.value+"&checktype=insert") 
var msg = ajax.getValue();
	if(msg.indexOf('Y')>-1){
	document.getElementById("clabelyonghuming").innerHTML="&nbsp;&nbsp;<font color=red>用户名已存在</font>";  
	return false;
	}else{document.getElementById("clabelyonghuming").innerHTML="  ";  }  
} 

	var mimaobj = document.getElementById("mima"); if(mimaobj.value==""){document.getElementById("clabelmima").innerHTML="&nbsp;&nbsp;<font color=red>请输入密码</font>";return false;}else{document.getElementById("clabelmima").innerHTML="  "; } 
	var mima2obj = document.getElementById("mima2");  
if(mima2obj.value==""){  
document.getElementById("clabelmima2").innerHTML="&nbsp;&nbsp;<font color=red>请再次输入密码</font>";  
return false;  
}else{
document.getElementById("clabelmima2").innerHTML="  ";  
}

if(mima2obj.value!=mimaobj.value){  
document.getElementById("clabelmima2").innerHTML="&nbsp;&nbsp;<font color=red>两次密码输入不一致</font>";  
return false;  
}else{
document.getElementById("clabelmima2").innerHTML="  ";  
}

	var xingmingobj = document.getElementById("xingming"); if(xingmingobj.value==""){document.getElementById("clabelxingming").innerHTML="&nbsp;&nbsp;<font color=red>请输入姓名</font>";return false;}else{document.getElementById("clabelxingming").innerHTML="  "; } 
	var youxiangobj = document.getElementById("youxiang"); if(youxiangobj.value!=""){ if(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(youxiangobj.value)){document.getElementById("clabelyouxiang").innerHTML=""; }else{document.getElementById("clabelyouxiang").innerHTML="&nbsp;&nbsp;<font color=red>必需邮箱格式</font>"; return false;}}  
	var dianhuaobj = document.getElementById("dianhua"); if(dianhuaobj.value!=""){if(/^1[3|4|5|6|7|8|9][0-9]\d{4,8}$/.test(dianhuaobj.value) ||  /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/.test(dianhuaobj.value)){document.getElementById("clabeldianhua").innerHTML=""; }else{document.getElementById("clabeldianhua").innerHTML="&nbsp;&nbsp;<font color=red>必需手机(11位)或电话(7或8位数)格式</font>"; return false;}}  
	var shenfenzhengobj = document.getElementById("shenfenzheng"); if(shenfenzhengobj.value!=""){ if(/^\d{15}$|^\d{18}$|^\d{17}[xX]$/.test(shenfenzhengobj.value)){document.getElementById("clabelshenfenzheng").innerHTML=""; }else{document.getElementById("clabelshenfenzheng").innerHTML="&nbsp;&nbsp;<font color=red>必需身份证格式</font>"; return false;}}  
	return true;  
}   

popheight=750;
</script>