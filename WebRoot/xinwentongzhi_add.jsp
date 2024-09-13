<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 


<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<TITLE>添加新闻通知</TITLE>
	    	<link rel="stylesheet" href="kindeditor_a5/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor_a5/plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor_a5/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor_a5/lang/zh_CN.js"></script>
	<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="hsgttcontent"]', {
				cssPath : 'kindeditor_a5/plugins/code/prettify.css',
				uploadJson : 'kindeditor_a5/jsp/upload_json.jsp',
				fileManagerJson : 'kindeditor_a5/jsp/file_manager_json.jsp',
					allowFileManager : true
				});
				K('input[name=getHtml]').click(function(e) {
						
						document.formAdd.neirong.value=editor.html();
						formAdd.submit();
				});
			});
			
		</script>
      
        <LINK href="css.css" type=text/css rel=stylesheet>
       
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<%
String lb=request.getParameter("lb");
%>
	<body>
			<form action="xinwentongzhiAdd.action" name="formAdd" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" >添加新闻通知
						    <input name="addtime" type="hidden" id="addtime" value="<%=connDbBean.gettime()%>" /></td>
						</tr>
						<tr ><td width="200">标题：</td><td><input name='biaoti' type='text' id='biaoti' value='' onblur='checkform()' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelbiaoti' /></td></tr>
		<tr ><td width="200">类别：</td><td><input name='leibie' type='text' id='leibie' value='<%=lb%>' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelleibie' /></td></tr>
		<tr ><td width="200">内容：</td><td><textarea name="hsgttcontent" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea></td></tr>
		<tr ><td width="200">首页图片：</td><td><input name='shouyetupian' type='text' id='shouyetupian' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('shouyetupian')" style='border:solid 1px #000000; color:#666666'/></td></tr>
		<tr ><td width="200">点击率：</td><td><input name='dianjilv' type='text' id='dianjilv' value='1' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr ><td width="200">添加人：</td><td><input name='tianjiaren' type='text' id='tianjiaren' onblur='checkform()' style='border:solid 1px #000000; color:#666666' value='${sessionScope.username}' readonly="readonly" />&nbsp;*<label id='clabeltianjiaren' /></td></tr>
		
		
						<tr align='center'   height="22">
						    <td width="25%"  align="right">&nbsp;
						        
						    </td>
						    <td width="75%"  align="left">
						     <input type="button" name="getHtml" value="提交" onClick="return checkform();" id="Submit5"/> <input name="neirong" type="hidden" id="neirong" value="">
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>



<script language=javascript src='js/ajax.js'></script>
<script language=javascript >  
 
 function checkform(){  
 
	var biaotiobj = document.getElementById("biaoti"); if(biaotiobj.value==""){document.getElementById("clabelbiaoti").innerHTML="&nbsp;&nbsp;<font color=red>请输入标题</font>";document.getElementById("Submit5").disabled="disabled";}else{document.getElementById("clabelbiaoti").innerHTML="  "; document.getElementById("Submit5").disabled="";} 
	var leibieobj = document.getElementById("leibie"); if(leibieobj.value==""){document.getElementById("clabelleibie").innerHTML="&nbsp;&nbsp;<font color=red>请输入类别</font>";document.getElementById("Submit5").disabled="disabled";}else{document.getElementById("clabelleibie").innerHTML="  "; } 
	var tianjiarenobj = document.getElementById("tianjiaren"); if(tianjiarenobj.value==""){document.getElementById("clabeltianjiaren").innerHTML="&nbsp;&nbsp;<font color=red>请输入添加人</font>";document.getElementById("Submit5").disabled="disabled";}else{document.getElementById("clabeltianjiaren").innerHTML="  "; } 
	


return true;   
}   
popheight=450;
</script>  
