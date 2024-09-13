<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>
<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<TITLE>回复留言板</TITLE>
	    
      
        <LINK href="css.css" type=text/css rel=stylesheet>
       
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

	<body>
			<form action="liuyanbanUpdtlb.action" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" >回复留言板</td>
						</tr>
						<tr ><td width="200">昵称：</td><td><input name='cheng' type='text' id='cheng' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelcheng' /></td></tr>
		<tr style='display:none'><td width="200">头像：</td><td><input name='touxiang' type='text' id='touxiang' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabeltouxiang' /></td></tr>
		<tr style='display:none'><td width="200">QQ：</td><td><input name='QQ' type='text' id='QQ' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr style='display:none'><td width="200">邮箱：</td><td><input name='youxiang' type='text' id='youxiang' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr style='display:none'><td width="200">电话：</td><td><input name='dianhua' type='text' id='dianhua' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabeldianhua' />必需手机格式</td></tr>
		<tr style='display:none'><td width="200">内容：</td><td><textarea name='neirong' cols='50' rows='5' id='neirong' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		<tr ><td width="200">回复内容：</td><td><textarea name='huifuneirong' cols='50' rows='5' id='huifuneirong' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		
		
						<tr align='center'   height="22">
						    <td width="25%"  align="right">&nbsp;
						        
						    </td>
						    <td width="75%"  align="left">
						     <input type="submit" name="Submit5" value="提交" onClick="return checkform();"/>
						       <input type="reset" value="重置"/>&nbsp;<input type="hidden" name="id" value="${requestScope.liuyanban.id}"/>
						    </td>
						</tr>
						<script language="javascript">document.form1.cheng.value='${liuyanban.cheng}';</script>
	<script language="javascript">document.form1.touxiang.value='${liuyanban.touxiang}';</script>
	<script language="javascript">document.form1.QQ.value='${liuyanban.QQ}';</script>
	<script language="javascript">document.form1.youxiang.value='${liuyanban.youxiang}';</script>
	<script language="javascript">document.form1.dianhua.value='${liuyanban.dianhua}';</script>
	<script language="javascript">document.form1.neirong.value='${liuyanban.neirong}';</script>
	<script language="javascript">document.form1.huifuneirong.value='${liuyanban.huifuneirong}';</script>
	
					 </table>
			</form>
   </body>
</html>



<script language=javascript src='js/ajax.js'></script>
<script language=javascript >  
 
 function checkform(){  
 
	var chengobj = document.getElementById("cheng"); if(chengobj.value==""){document.getElementById("clabelcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入昵称</font>";return false;}else{document.getElementById("clabelcheng").innerHTML="  "; } 
	var touxiangobj = document.getElementById("touxiang"); if(touxiangobj.value==""){document.getElementById("clabeltouxiang").innerHTML="&nbsp;&nbsp;<font color=red>请输入头像</font>";return false;}else{document.getElementById("clabeltouxiang").innerHTML="  "; } 
	//var dianhuaobj = document.getElementById("dianhua"); if(dianhuaobj.value!=""){ if(/^1[3|4|5|8][0-9]\d{4,8}$/.test(dianhuaobj.value)){document.getElementById("clabeldianhua").innerHTML=""; }else{document.getElementById("clabeldianhua").innerHTML="&nbsp;&nbsp;<font color=red>必需手机格式</font>"; return false;}}  
    


return true;   
}   
popheight=450;
</script>  
