﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="goumaihsgb" scope="page" class="com.action.goumaiAction" />


<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<TITLE>添加购买</TITLE>
	    
      
       <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">   
       
	</head>

<script language="javascript">
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
			<form action="goumaiUpdt.action" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
						<tr bgcolor="#E7E7E7">
							<td height="30" colspan="2" >修改购买</td>
						</tr>
						<tr ><td width="200">药品编号：</td><td><input name='shangpinbianhao' type='text' id='shangpinbianhao' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr>
		<tr ><td width="200">药品名称：</td><td><input name='shangpinmingcheng' type='text' id='shangpinmingcheng' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr>
		<tr ><td width="200">药品类别：</td><td><input name='shangpinleibie' type='text' id='shangpinleibie' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr>
		<tr ><td width="200">制药公司：</td><td><input name='zhiyaogongsi' type='text' id='zhiyaogongsi' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr>
		<tr ><td width="200">价格：</td><td><input name='jiage' type='text' id='jiage' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr>
		<tr ><td width="200">库存：</td><td><input name='kucun' type='text' id='kucun' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr>
		<tr ><td width="200">销量：</td><td><input name='xiaoliang' type='text' id='xiaoliang' value='' onblur='' class="form-control"  readonly='readonly' /></td></tr>
		<tr ><td width="200">购买数量：</td><td><input name='goumaishuliang' type='text' id='goumaishuliang' value='' onblur='checkform()' class="form-control" />&nbsp;<label id='clabelgoumaishuliang' style='margin-top:16px;' />必需数字型</td></tr>
		<tr ><td width="200">购买金额：</td><td><input name='goumaijine' type='text' id='goumaijine' value='' onblur='' class="form-control" readonly='readonly' /> 此项不必填写，系统自动计算</td></tr>
		<tr ><td width="200">购买人：</td><td><input name='goumairen' type='text' id='goumairen' onblur='' class="form-control" value='' /></td></tr>
		
		
						<tr align='center'   height="22">
						    <td width="25%" height="45"  align="right">&nbsp;						    </td>
						    <td width="75%" height="45"  align="left">
						     <input type="submit" name="Submit5" value="提交" onClick="return checkform();" class="btn btn-info btn-small" />
						       <input type="reset" value="重置" class="btn btn-info btn-small"/>&nbsp;<input type="hidden" name="id" value="${requestScope.goumai.id}"/>
					      </td>
						</tr>
						<script language="javascript">document.form1.shangpinbianhao.value='${goumai.shangpinbianhao}';</script>
	<script language="javascript">document.form1.shangpinmingcheng.value='${goumai.shangpinmingcheng}';</script>
	<script language="javascript">document.form1.shangpinleibie.value='${goumai.shangpinleibie}';</script>
	<script language="javascript">document.form1.zhiyaogongsi.value='${goumai.zhiyaogongsi}';</script>
	<script language="javascript">document.form1.jiage.value='${goumai.jiage}';</script>
	<script language="javascript">document.form1.kucun.value='${goumai.kucun}';</script>
	<script language="javascript">document.form1.xiaoliang.value='${goumai.xiaoliang}';</script>
	<script language="javascript">document.form1.goumaishuliang.value='${goumai.goumaishuliang}';</script>
	<script language="javascript">document.form1.goumaijine.value='${goumai.goumaijine}';</script>
	<script language="javascript">document.form1.goumairen.value='${goumai.goumairen}';</script>
	
			  </table>
			</form>
   </body>
</html>



<script language=javascript src='js/ajax.js'></script>
<script language=javascript >  
 
 function checkform(){  
 
	
    if(parseInt(document.form1.kucun.value)<parseInt(document.form1.goumaishuliang.value)){bootbox.alert("对不起，库存必需大于购买数量");return false;}
	document.getElementById("goumaijine").value=document.getElementById("jiage").value*document.getElementById("goumaishuliang").value;
	


return true;   
}   
popheight=450;
</script>  