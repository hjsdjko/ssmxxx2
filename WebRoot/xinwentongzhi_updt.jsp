<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>
<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
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
						
						document.form1.neirong.value=editor.html();
						form1.submit();
				});
			});
			
		</script>
      
        <LINK href="css.css" type=text/css rel=stylesheet>
       
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

	<body>
			<form action="xinwentongzhiUpdt.action" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" >修改新闻通知</td>
						</tr>
						<tr ><td width="200">标题：</td><td><input name='biaoti' type='text' id='biaoti' value='' onblur='checkform()' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelbiaoti' /></td></tr>
		<tr ><td width="200">类别：</td><td><input name='leibie' type='text' id='leibie' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelleibie' /></td></tr>
		<tr ><td width="200">内容：</td><td><textarea name="hsgttcontent" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${xinwentongzhi.neirong}</textarea></td></tr>
		<tr ><td width="200">首页图片：</td><td><input name='shouyetupian' type='text' id='shouyetupian' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('shouyetupian')" style='border:solid 1px #000000; color:#666666'/></td></tr>
		<tr ><td width="200">点击率：</td><td><input name='dianjilv' type='text' id='dianjilv' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr ><td width="200">添加人：</td><td><input name='tianjiaren' type='text' id='tianjiaren' onblur='checkform()' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" />&nbsp;*<label id='clabeltianjiaren' /></td></tr>
		
		
						<tr align='center'   height="22">
						    <td width="25%"  align="right">&nbsp;
						        
						    </td>
						    <td width="75%"  align="left">
						    <input type="button" name="getHtml" value="提交" onClick="return checkform();"/> <input name="neirong" type="hidden" id="neirong" value="">
						       <input type="reset" value="重置"/>&nbsp;<input type="hidden" name="id" value="${requestScope.xinwentongzhi.id}"/>
						    </td>
						</tr>
						<script language="javascript">document.form1.biaoti.value='${xinwentongzhi.biaoti}';</script>
	<script language="javascript">document.form1.leibie.value='${xinwentongzhi.leibie}';</script>
	<script language="javascript">document.form1.shouyetupian.value='${xinwentongzhi.shouyetupian}';</script>
	<script language="javascript">document.form1.dianjilv.value='${xinwentongzhi.dianjilv}';</script>
	<script language="javascript">document.form1.tianjiaren.value='${xinwentongzhi.tianjiaren}';</script>
	
					 </table>
			</form>
   </body>
</html>



<script language=javascript src='js/ajax.js'></script>
<script language=javascript >  
 
 function checkform(){  
 
	var biaotiobj = document.getElementById("biaoti"); if(biaotiobj.value==""){document.getElementById("clabelbiaoti").innerHTML="&nbsp;&nbsp;<font color=red>请输入标题</font>";return false;}else{document.getElementById("clabelbiaoti").innerHTML="  "; } 
	var leibieobj = document.getElementById("leibie"); if(leibieobj.value==""){document.getElementById("clabelleibie").innerHTML="&nbsp;&nbsp;<font color=red>请输入类别</font>";return false;}else{document.getElementById("clabelleibie").innerHTML="  "; } 
	var tianjiarenobj = document.getElementById("tianjiaren"); if(tianjiarenobj.value==""){document.getElementById("clabeltianjiaren").innerHTML="&nbsp;&nbsp;<font color=red>请输入添加人</font>";return false;}else{document.getElementById("clabeltianjiaren").innerHTML="  "; } 
	


return true;   
}   
popheight=450;
</script>  
