<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<%
  String id="";
id = request.getParameter("id"); 
String shangpinbianhao="";
String shangpinmingcheng="";
String shangpinleibie="";
String zhiyaogongsi="";
String jiage="";
String kucun="";
String xiaoliang="";

if(id!=null){
	List goumaiListlbdq = goumaihsgb.getLbdqGoumai(Integer.parseInt(id),7);
	shangpinbianhao=(String)goumaiListlbdq.get(0);
  	shangpinmingcheng=(String)goumaiListlbdq.get(1);
  	shangpinleibie=(String)goumaiListlbdq.get(2);
  	zhiyaogongsi=(String)goumaiListlbdq.get(3);
  	jiage=(String)goumaiListlbdq.get(4);
  	kucun=(String)goumaiListlbdq.get(5);
  	xiaoliang=(String)goumaiListlbdq.get(6);
  	

} 
   %>
<script language="javascript">

function gows()
{
	document.location.href="goumai_add.jsp?id=<%=id%>";
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
			<form action="goumaiAdd.action" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
						<tr bgcolor="#E7E7E7">
							<td height="30" colspan="2" >添加购买
						  <input name="addtime" type="hidden" id="addtime" value="<%=connDbBean.gettime()%>" /></td>
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
						       <input type="reset" value="重置" class="btn btn-info btn-small" />&nbsp;
					      </td>
						</tr>
						<script language="javascript">document.form1.shangpinbianhao.value='<%=shangpinbianhao%>';document.form1.shangpinbianhao.setAttribute("readOnly",'true');</script>
		<script language="javascript">document.form1.shangpinmingcheng.value='<%=shangpinmingcheng%>';document.form1.shangpinmingcheng.setAttribute("readOnly",'true');</script>
		<script language="javascript">document.form1.shangpinleibie.value='<%=shangpinleibie%>';document.form1.shangpinleibie.setAttribute("readOnly",'true');</script>
		<script language="javascript">document.form1.zhiyaogongsi.value='<%=zhiyaogongsi%>';document.form1.zhiyaogongsi.setAttribute("readOnly",'true');</script>
		<script language="javascript">document.form1.jiage.value='<%=jiage%>';document.form1.jiage.setAttribute("readOnly",'true');</script>
		<script language="javascript">document.form1.kucun.value='<%=kucun%>';document.form1.kucun.setAttribute("readOnly",'true');</script>
		<script language="javascript">document.form1.xiaoliang.value='<%=xiaoliang%>';document.form1.xiaoliang.setAttribute("readOnly",'true');</script>
		<script language="javascript">document.form1.goumairen.value='<%=request.getSession().getAttribute("username")%>';document.form1.goumairen.setAttribute("readOnly",'true');</script>
						
			  </table>
			</form>
   </body>
</html>



<script language=javascript src='js/ajax.js'></script>
<script language=javascript >  
 
 function checkform(){  
 
	var goumaishuliangobj = document.getElementById("goumaishuliang"); if(goumaishuliangobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(goumaishuliangobj.value)){document.getElementById("clabelgoumaishuliang").innerHTML=""; }else{document.getElementById("clabelgoumaishuliang").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    if(parseInt(document.form1.kucun.value)<parseInt(document.form1.goumaishuliang.value)){bootbox.alert("对不起，库存必需大于购买数量");return false;}
	document.getElementById("goumaijine").value=document.getElementById("jiage").value*document.getElementById("goumaishuliang").value;
	


return true;   
}   
popheight=450;
</script>  
<script src="images/hsgcommon/jq.js"></script>
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>