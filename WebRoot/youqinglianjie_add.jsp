﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="youqinglianjiehsgb" scope="page" class="com.action.youqinglianjieAction" />

<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<TITLE>添加友情连接</TITLE>
	    
      
        <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">    
       
	</head>
<%
  String id="";
 
   %>
<script language="javascript">

function gows()
{
	document.location.href="youqinglianjie_add.jsp?id=<%=id%>";
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
			<form action="youqinglianjieAdd.action" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" >添加友情连接<input name="addtime" type="hidden" id="addtime" value="<%=connDbBean.gettime()%>" /></td>
						</tr>
						<tr ><td width="200">网站名称：</td><td><input name='wangzhanmingcheng' type='text' id='wangzhanmingcheng' value='' onblur='checkform()' class="form-control" />&nbsp;*<label id='clabelwangzhanmingcheng' style='margin-top:16px;' /></td></tr>
		
						<tr align='center'   height="22">
						    <td width="25%"  align="right">&nbsp;
						        
						    </td>
						    <td width="75%"  align="left">
						     <input type="submit" name="Submit5" value="提交" onClick="return checkform();" class="btn btn-info btn-small" />
						       <input type="reset" value="重置" class="btn btn-info btn-small" />&nbsp;
						    </td>
						</tr>
						
					 </table>
			</form>
   </body>
</html>



<script language=javascript src='js/ajax.js'></script>
<script language=javascript >  
 
 function checkform(){  
 
	var wangzhanmingchengobj = document.getElementById("wangzhanmingcheng"); if(wangzhanmingchengobj.value==""){document.getElementById("clabelwangzhanmingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入网站名称</font>";return false;}else{document.getElementById("clabelwangzhanmingcheng").innerHTML="  "; } 


return true;   
}   
popheight=450;
</script>  
<script src="images/hsgcommon/jq.js"></script>
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>