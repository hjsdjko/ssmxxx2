<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="pinglunhsgb" scope="page" class="com.action.pinglunAction" />

<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<TITLE>添加评论</TITLE>
	    
      
        <LINK href="css.css" type=text/css rel=stylesheet>
       
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<%
  String id="";
 
   %>
<script language="javascript">

function gows()
{
	document.location.href="pinglun_add.jsp?id=<%=id%>";
}
function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>
	<body>
			<form action="pinglunAdd.action" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" >添加评论<input name="addtime" type="hidden" id="addtime" value="<%=connDbBean.gettime()%>" /></td>
						</tr>
						<tr style="display:none">
						  <td width="200">数据ID：</td><td><input name='xinwenID' type='text' id='xinwenID' value='<%=request.getParameter("id")%>' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelxinwenID' /></td></tr>
		<tr ><td width="200">评论内容：</td><td><textarea name='pinglunneirong' cols='50' rows='5' id='pinglunneirong' onblur='checkform()' style='border:solid 1px #000000; color:#666666' ></textarea>&nbsp;*<label id='clabelpinglunneirong' /></td></tr>
		<tr ><td width="200">评论人：</td><td><input name='pinglunren' type='text' id='pinglunren' value='${sessionScope.username}' onblur='' style='border:solid 1px #000000; color:#666666' readonly="readonly" /></td></tr>
		<tr ><td width="200">评分：</td><td><select name='pingfen' id='pingfen'><option value="5">5</option><option value="4">4</option><option value="3">3</option><option value="2">2</option><option value="1">1</option></select>
		  <input name='biao' type='hidden' id='biao' value='<%=request.getParameter("biao")%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		
		
		
						<tr align='center'   height="22">
						    <td width="200"  align="right">&nbsp;						    </td>
						    <td width="75%"  align="left">
						     <input type="submit" name="Submit5" value="提交" onClick="return checkform();"/>
						       <input type="reset" value="重置"/>&nbsp;						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>



<script language=javascript src='js/ajax.js'></script>
<script language=javascript >  
 
 function checkform(){  
 
	var xinwenIDobj = document.getElementById("xinwenID"); if(xinwenIDobj.value==""){document.getElementById("clabelxinwenID").innerHTML="&nbsp;&nbsp;<font color=red>请输入新闻ID</font>";return false;}else{document.getElementById("clabelxinwenID").innerHTML="  "; } 
	var pinglunneirongobj = document.getElementById("pinglunneirong"); if(pinglunneirongobj.value==""){document.getElementById("clabelpinglunneirong").innerHTML="&nbsp;&nbsp;<font color=red>请输入评论内容</font>";return false;}else{document.getElementById("clabelpinglunneirong").innerHTML="  "; } 
	


return true;   
}   
popheight=450;
</script>  
