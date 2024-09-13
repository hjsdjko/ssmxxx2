<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="shangpinxinxihsgb" scope="page" class="com.action.shangpinxinxiAction" />

<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<TITLE>添加药品信息</TITLE>
	    
      
        <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">    
       
	</head>
<%
  String id="";
 
   %>
<script language="javascript">

function gows()
{
	document.location.href="shangpinxinxi_add.jsp?id=<%=id%>";
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
			<form action="shangpinxinxiAdd.action" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
						<tr bgcolor="#E7E7E7">
							<td height="30" colspan="2" >添加药品信息
						  <input name="addtime" type="hidden" id="addtime" value="<%=connDbBean.gettime()%>" /></td>
						</tr>
						<tr ><td width="200">药品编号：</td><td><input name='shangpinbianhao' type='text' id='shangpinbianhao' value='<%=connDbBean.getID()%>' onblur='' class="form-control" /></td></tr>
		<tr ><td width="200">药品名称：</td><td><input name='shangpinmingcheng' type='text' id='shangpinmingcheng' value='' onblur='checkform()' class="form-control" />&nbsp;*<label id='clabelshangpinmingcheng' style='margin-top:16px;' /></td></tr>
		<tr ><td width="200">药品类别：</td><td><select name='shangpinleibie' id='shangpinleibie' style=' height:19px; border:solid 1px #000000; color:#666666'><%=connDbBean.hsggetoption("t_yaopinleibie","leibie")%></select></td></tr>
		<tr ><td width="200">制药公司：</td><td><input name='zhiyaogongsi' type='text' id='zhiyaogongsi' value='' onblur='checkform()' class="form-control" />&nbsp;*<label id='clabelzhiyaogongsi' style='margin-top:16px;' /></td></tr>
		<tr ><td width="200">价格：</td><td><input name='jiage' type='text' id='jiage' value='' onblur='checkform()' class="form-control" />&nbsp;*<label id='clabeljiage' style='margin-top:16px;' /></td></tr>
		<tr ><td width="200">库存：</td><td><input name='kucun' type='text' id='kucun' value='' onblur='checkform()' class="form-control" />&nbsp;<label id='clabelkucun' style='margin-top:16px;' />必需数字型</td></tr>
		<tr ><td width="200">销量：</td><td><input name='xiaoliang' type='text' id='xiaoliang' value='' onblur='checkform()' class="form-control" />&nbsp;<label id='clabelxiaoliang' style='margin-top:16px;' />必需数字型</td></tr>
		<tr ><td width="200">图片：</td><td><input name='tupian' type='text' id='tupian'  value='' onblur='' class="form-control" /><div style="margin-top:16px;">&nbsp;<input type='button' value='上传' onClick="up('tupian')" /></div></td></tr>
		<tr ><td width="200">药品简介：</td><td><textarea name='yaopinjianjie' cols='50' rows='5' id='yaopinjianjie' onblur='' class="form-control" style="width:600px; height:80px;" ></textarea></td></tr>
		<tr ><td width="200">药效：</td><td><input name='yaoxiao' type='text' id='yaoxiao' value='' onblur='' class="form-control" style="width:600px; " /></td></tr>
		
		
						<tr align='center'   height="22">
						    <td width="25%" height="45"  align="right">&nbsp;						    </td>
						    <td width="75%" height="45"  align="left">
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
 
	var shangpinmingchengobj = document.getElementById("shangpinmingcheng"); if(shangpinmingchengobj.value==""){document.getElementById("clabelshangpinmingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入药品名称</font>";return false;}else{document.getElementById("clabelshangpinmingcheng").innerHTML="  "; } 
	var zhiyaogongsiobj = document.getElementById("zhiyaogongsi"); if(zhiyaogongsiobj.value==""){document.getElementById("clabelzhiyaogongsi").innerHTML="&nbsp;&nbsp;<font color=red>请输入制药公司</font>";return false;}else{document.getElementById("clabelzhiyaogongsi").innerHTML="  "; } 
	var jiageobj = document.getElementById("jiage"); if(jiageobj.value==""){document.getElementById("clabeljiage").innerHTML="&nbsp;&nbsp;<font color=red>请输入价格</font>";return false;}else{document.getElementById("clabeljiage").innerHTML="  "; } 
	var jiageobj = document.getElementById("jiage"); if(jiageobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(jiageobj.value)){document.getElementById("clabeljiage").innerHTML=""; }else{document.getElementById("clabeljiage").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    var kucunobj = document.getElementById("kucun"); if(kucunobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(kucunobj.value)){document.getElementById("clabelkucun").innerHTML=""; }else{document.getElementById("clabelkucun").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    var xiaoliangobj = document.getElementById("xiaoliang"); if(xiaoliangobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(xiaoliangobj.value)){document.getElementById("clabelxiaoliang").innerHTML=""; }else{document.getElementById("clabelxiaoliang").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    


return true;   
}   
popheight=450;
</script>  
<script src="images/hsgcommon/jq.js"></script>
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>