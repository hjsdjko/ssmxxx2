<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="dingdanxinxihsgb" scope="page" class="com.action.dingdanxinxiAction" />


<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<TITLE>添加订单信息</TITLE>
	    
      
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
			<form action="dingdanxinxiUpdt.action" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
						<tr bgcolor="#E7E7E7">
							<td height="30" colspan="2" >修改订单信息</td>
						</tr>
						<tr ><td width="200">订单号：</td><td><input name='dingdanhao' type='text' id='dingdanhao' value='<%=connDbBean.getID()%>' onblur='' class="form-control" /></td></tr>		<tr ><td width="200">订单内容：</td><td><textarea name='dingdanneirong' cols='50' rows='5' id='dingdanneirong' onblur='checkform()' class="form-control" style="width:600px; height:80px;" ></textarea>&nbsp;*<label id='clabeldingdanneirong' style='margin-top:16px;' /></td></tr>		<tr ><td width="200">订单金额：</td><td><input name='dingdanjine' type='text' id='dingdanjine' value='' onblur='' class="form-control" /></td></tr>		<tr ><td width="200">购买人：</td><td><input name='goumairen' type='text' id='goumairen' onblur='' class="form-control" value='' /></td></tr>		<tr ><td width="200">电话：</td><td><input name='dianhua' type='text' id='dianhua' value='' onblur='checkform()' class="form-control" />&nbsp;<label id='clabeldianhua' style='margin-top:16px;' />必需电话格式[7或8位电话，或11位手机]</td></tr>		<tr ><td width="200">地址：</td><td><input name='dizhi' type='text' id='dizhi' value='' onblur='' class="form-control" style="width:600px; " /></td></tr>		<tr ><td width="200">备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' class="form-control" style="width:600px; height:80px;" ></textarea></td></tr>		
		
						<tr align='center'   height="22">
						    <td width="25%" height="45"  align="right">&nbsp;						    </td>
						    <td width="75%" height="45"  align="left">
						     <input type="submit" name="Submit5" value="提交" onClick="return checkform();" class="btn btn-info btn-small" />
						       <input type="reset" value="重置" class="btn btn-info btn-small"/>&nbsp;<input type="hidden" name="id" value="${requestScope.dingdanxinxi.id}"/>
					      </td>
						</tr>
						<script language="javascript">document.form1.dingdanhao.value='${dingdanxinxi.dingdanhao}';</script>	<script language="javascript">document.form1.dingdanneirong.value='${dingdanxinxi.dingdanneirong}';</script>	<script language="javascript">document.form1.dingdanjine.value='${dingdanxinxi.dingdanjine}';</script>	<script language="javascript">document.form1.goumairen.value='${dingdanxinxi.goumairen}';</script>	<script language="javascript">document.form1.dianhua.value='${dingdanxinxi.dianhua}';</script>	<script language="javascript">document.form1.dizhi.value='${dingdanxinxi.dizhi}';</script>	<script language="javascript">document.form1.beizhu.value='${dingdanxinxi.beizhu}';</script>	
			  </table>
			</form>
   </body>
</html>



<script language=javascript src='js/ajax.js'></script>
<script language=javascript >  
 
 function checkform(){  
 
	var dingdanneirongobj = document.getElementById("dingdanneirong"); if(dingdanneirongobj.value==""){document.getElementById("clabeldingdanneirong").innerHTML="&nbsp;&nbsp;<font color=red>请输入订单内容</font>";return false;}else{document.getElementById("clabeldingdanneirong").innerHTML="  "; } 	var dianhuaobj = document.getElementById("dianhua"); if(dianhuaobj.value!=""){ if(/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/.test(dianhuaobj.value) || /^1[3|4|5|6|7|8|9][0-9]\d{8,8}$/.test(dianhuaobj.value)){document.getElementById("clabeldianhua").innerHTML=""; }else{document.getElementById("clabeldianhua").innerHTML="&nbsp;&nbsp;<font color=red>必需电话格式[7或8位电话，或11位手机]</font>"; return false;}}      


return true;   
}   
popheight=450;
</script>  
