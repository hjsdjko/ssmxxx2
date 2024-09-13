<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="yaopinrukuhsgb" scope="page" class="com.action.yaopinrukuAction" />

<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<TITLE>添加药品入库</TITLE>
	    
      
        <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">    
       
	</head>
<%
  String id="";
 
   %>
<script language="javascript">

function gows()
{
	document.location.href="yaopinruku_add.jsp?id=<%=id%>&shangpinbianhao="+document.form1.shangpinbianhao.value;
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
			<form action="yaopinrukuAdd.action" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
						<tr bgcolor="#E7E7E7">
							<td height="30" colspan="2" >添加药品入库
						  <input name="addtime" type="hidden" id="addtime" value="<%=connDbBean.gettime()%>" /></td>
						</tr>
						<tr ><td width="200">药品编号：</td><td><select name='shangpinbianhao' id='shangpinbianhao' class="form-control" onChange='gows();'><%=connDbBean.hsggetoption2("t_shangpinxinxi","shangpinbianhao")%></select>&nbsp;*<label id='clabelshangpinbianhao' style='margin-top:16px;' /></td></tr>
		<tr ><td width="200">药品名称：</td><td><input name='shangpinmingcheng' type='text' id='shangpinmingcheng' class="form-control" >&nbsp;*<label id='clabelshangpinmingcheng' style='margin-top:16px;' /></td></tr>
		<tr ><td width="200">药品类别：</td><td><input name='shangpinleibie' type='text' id='shangpinleibie' class="form-control" ></td></tr>
		<tr ><td width="200">制药公司：</td><td><input name='zhiyaogongsi' type='text' id='zhiyaogongsi' class="form-control" ></td></tr>
		<tr ><td width="200">库存：</td><td><input name='kucun' type='text' id='kucun' class="form-control" ></td></tr>
		<tr ><td width="200">入库数量：</td><td><input name='rukushuliang' type='text' id='rukushuliang' value='' onblur='checkform()' class="form-control" />&nbsp;<label id='clabelrukushuliang' style='margin-top:16px;' />必需数字型</td></tr>
		<tr ><td width="200">入库日期：</td><td><input name='rukuriqi' type='text' id='rukuriqi' value='' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" class="form-control"/></td></tr>
		<tr ><td width="200">入库说明：</td><td><input name='rukushuoming' type='text' id='rukushuoming' value='' onblur='' class="form-control" /></td></tr>
		
		
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

<%
if(request.getParameter("shangpinbianhao")==null || request.getParameter("shangpinbianhao").equals("")){}else{
%>
<script language="javascript">
document.form1.shangpinbianhao.value="<%=connDbBean.readzd("t_shangpinxinxi","shangpinbianhao","shangpinbianhao",request.getParameter("shangpinbianhao"))%>";
document.form1.shangpinmingcheng.value="<%=connDbBean.readzd("t_shangpinxinxi","shangpinmingcheng","shangpinbianhao",request.getParameter("shangpinbianhao"))%>";
document.form1.shangpinleibie.value="<%=connDbBean.readzd("t_shangpinxinxi","shangpinleibie","shangpinbianhao",request.getParameter("shangpinbianhao"))%>";
document.form1.zhiyaogongsi.value="<%=connDbBean.readzd("t_shangpinxinxi","zhiyaogongsi","shangpinbianhao",request.getParameter("shangpinbianhao"))%>";
document.form1.kucun.value="<%=connDbBean.readzd("t_shangpinxinxi","kucun","shangpinbianhao",request.getParameter("shangpinbianhao"))%>";


</script>
<%
}
%>


<script language=javascript src='js/ajax.js'></script>
<script language=javascript >  
 
 function checkform(){  
 
	var shangpinbianhaoobj = document.getElementById("shangpinbianhao"); if(shangpinbianhaoobj.value==""){document.getElementById("clabelshangpinbianhao").innerHTML="&nbsp;&nbsp;<font color=red>请输入药品编号</font>";return false;}else{document.getElementById("clabelshangpinbianhao").innerHTML="  "; } 
	var shangpinmingchengobj = document.getElementById("shangpinmingcheng"); if(shangpinmingchengobj.value==""){document.getElementById("clabelshangpinmingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入药品名称</font>";return false;}else{document.getElementById("clabelshangpinmingcheng").innerHTML="  "; } 
	var rukushuliangobj = document.getElementById("rukushuliang"); if(rukushuliangobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(rukushuliangobj.value)){document.getElementById("clabelrukushuliang").innerHTML=""; }else{document.getElementById("clabelrukushuliang").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    


return true;   
}   
popheight=450;
</script>  
<script src="images/hsgcommon/jq.js"></script>
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>