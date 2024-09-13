<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<jsp:useBean id="goumaihsgb" scope="page" class="com.action.goumaiAction" />
<!--qtxlixstd-->
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>购买</title>

	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta name="author" content="">
	<meta name="format-detection" content="telephone=no">
	<link href="qtimages/Layout.css" rel="stylesheet" type="text/css">
	<script src="qtimages/getjs_bdtj"></script><script charset="utf-8" src="qtimages/insert_bdtj"></script><script src="qtimages/conv.js"></script><script src="qtimages/hm.js"></script>					<script type="text/javascript" src="qtimages/jquery1.42.min.js"></script>
	<script type="text/javascript" src="qtimages/jquery.SuperSlide.2.1.1.js"></script>
	<script src="qtimages/scrollReveal.js"></script> 
	 <link rel="stylesheet" href="./qtimages/sl_common_form.css">
</head>
<%
if(request.getSession().getAttribute("username")==null)
{
	out.print("<script>alert('对不起,请您先登陆!');location.href='index.action';</script>");
	return;
}
  String id="";

String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('操作成功');location.href='index.jsp';");
		out.println("</script>");
	}
	request.removeAttribute("message");
 
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
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	<script language=javascript src='js/ajax.js'></script>
	<script language="javascript">
function checkform()
{
	var goumaishuliangobj = document.getElementById("goumaishuliang"); if(goumaishuliangobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(goumaishuliangobj.value)){document.getElementById("clabelgoumaishuliang").innerHTML=""; }else{document.getElementById("clabelgoumaishuliang").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    if(parseInt(document.form1.kucun.value)<parseInt(document.form1.goumaishuliang.value)){bootbox.alert("对不起，库存必需大于购买数量");return false;}
	document.getElementById("goumaijine").value=document.getElementById("jiage").value*document.getElementById("goumaishuliang").value;
	
}
function gow()
{
	document.location.href="goumaiadd.jsp?id=<%=id%>";
}
</script>


<body>
<%@ include file="qttop.jsp"%>
<%@ include file="sidebufen1.jsp"%>


<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			<em>你的梦想我很在意 更支持</em>
			<div class="line">
				<h3>购买<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  
				  <div class="content-form">
				  <link rel="stylesheet" href="images/hsgcommon/divqt.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/commonqt.css" type="text/css">
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>
<% 




%>

  
  <form action="goumaiAdd.action" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse" class="newsline">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" >添加购买 <input name="addtime" type="hidden" id="addtime" value="<%=connDbBean.gettime()%>" /></td>
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
						    <td width="25%"  align="right">&nbsp;
						        
						    </td>
						    <td width="75%"  align="left">
						     <input type="submit" name="Submit5" value="提交" onClick="return checkform();"/>
						       <input type="reset" value="重置"/>&nbsp;
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
					</div>
					
					
							</ul>
		</div>
		
	</div>
</div>
<%@ include file="qtdown.jsp"%>


</body>
</html>
