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
			<form action="yaopinrukuUpdt.action" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
						<tr bgcolor="#E7E7E7">
							<td height="30" colspan="2" >修改药品入库</td>
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
						       <input type="reset" value="重置" class="btn btn-info btn-small"/>&nbsp;<input type="hidden" name="id" value="${requestScope.yaopinruku.id}"/>
					      </td>
						</tr>
						<script language="javascript">document.form1.shangpinbianhao.value='${yaopinruku.shangpinbianhao}';</script>
	<script language="javascript">document.form1.shangpinmingcheng.value='${yaopinruku.shangpinmingcheng}';</script>
	<script language="javascript">document.form1.shangpinleibie.value='${yaopinruku.shangpinleibie}';</script>
	<script language="javascript">document.form1.zhiyaogongsi.value='${yaopinruku.zhiyaogongsi}';</script>
	<script language="javascript">document.form1.kucun.value='${yaopinruku.kucun}';</script>
	<script language="javascript">document.form1.rukushuliang.value='${yaopinruku.rukushuliang}';</script>
	<script language="javascript">document.form1.rukuriqi.value='${yaopinruku.rukuriqi}';</script>
	<script language="javascript">document.form1.rukushuoming.value='${yaopinruku.rukushuoming}';</script>
	
			  </table>
			</form>
   </body>
</html>



<script language=javascript src='js/ajax.js'></script>
<script language=javascript >  
 
 function checkform(){  
 
	var shangpinbianhaoobj = document.getElementById("shangpinbianhao"); if(shangpinbianhaoobj.value==""){document.getElementById("clabelshangpinbianhao").innerHTML="&nbsp;&nbsp;<font color=red>请输入药品编号</font>";return false;}else{document.getElementById("clabelshangpinbianhao").innerHTML="  "; } 
	var shangpinmingchengobj = document.getElementById("shangpinmingcheng"); if(shangpinmingchengobj.value==""){document.getElementById("clabelshangpinmingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入药品名称</font>";return false;}else{document.getElementById("clabelshangpinmingcheng").innerHTML="  "; } 
	
    


return true;   
}   
popheight=450;
</script>  
