<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("gb2312");%>
<jsp:useBean id="shangpinxinxihsgb" scope="page" class="com.action.shangpinxinxiAction" /> 



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>药品信息查询</TITLE>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">   
	
		
		<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
        <script language="javascript">
		   function catelogAll()
           {
                   document.getElementById("indicator").style.display="block";
                   loginService.catelogAll(callback);
               
           }
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("catelog_id",data,"id","name");
           }
           function shangpinxinxiDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="shangpinxinxiDel.action?id="+id;
               }
           }
           
		   function shangpinxinxiDetail(id)
           {
                  // window.location.href="shangpinxinxiDetail.action?id="+id;
				   window.open("spxxDetail.action?id="+id,"_blank");
           }
           function shangpinxinxiPre(id)
           {
                   window.location.href="shangpinxinxiPre.action?id="+id;
           }
		   function shangpinxinxiPrelb(id)
           {
                   window.location.href="shangpinxinxiPrelb.action?id="+id;
           }
           function shangpinxinxiIssh(id)
           {
                   window.location.href="shangpinxinxiIssh.action?id="+id;
           }
           function shangpinxinxiAdd()
           {
                 var url="shangpinxinxiAdd.jsp";
				 window.location.href=url;
           }
           
           
           function go(index)
           {
               document.form123.index.value=index;
               document.form123.action="shangpinxinxiList.action"
               document.form123.submit();
           }  
		    function check()
           {
               document.formAdd.submit();
           }
       </script>
	   
	</head>

	<body leftmargin="2" topmargin="9" background='img/allbg.gif' onload="catelogAll()">
	
	<form action="shangpinxinxiList.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="1" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="30" colspan="8" background="img/tbg.gif">所有药品信息列表</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="45">
						    
					      <td  bgcolor="#FFFFFF" align="left">
						  搜索:  药品编号：<input name="shangpinbianhao" type="text" id="shangpinbianhao" class="form-control2" />  药品名称：<input name="shangpinmingcheng" type="text" id="shangpinmingcheng" class="form-control2" />
					        <input name="button" type="button" onclick="check()" value="查询" class="btn btn-info btn-small"/> <input type="button" value="导出excel" onclick="javascript:location.href='shangpinxinxi_listxls.jsp';" class="btn btn-info btn-small" />
					      
                          </td>
						</tr>
					 </table>
	</form>
			
			<table width="98%" border="1" align="center" cellpadding="4" cellspacing="1" bordercolor="#F3F3F3" bgcolor="#CBD8AC" style="margin-bottom:8px">
				
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="50" height="50" bgcolor="#FAFAF1">序号</td>
					<td >药品编号</td>
    <td >药品名称</td>
    <td >药品类别</td>
    <td >制药公司</td>
    <td >价格</td>
    <td >库存</td>
    <td >销量</td>
    <td  width='90' align='center'>图片</td>
    
    <td >药效</td>
    
					
					<td width="140" height="50" bgcolor="#FAFAF1">添加时间</td>
					<td width="150" height="50" bgcolor="#FAFAF1">操作</td>
		        </tr>
				<%
					int i=0;
				%>
				<c:forEach items="${requestScope.page.data}" var="shangpinxinxi" varStatus="sta">
				<%
					i++;
				%>
				<tr align="center" <%
  	if((i % 2)==0)
	{
		out.print("bgcolor='#F0F0F0'");
	}
	else
	{
		out.print("bgcolor='#FFFFFF'");
	}
	
	if((i % 2)==0)
	{
		%> onmouseover="this.style.backgroundColor='#F9DFEB'" onmouseout="this.style.backgroundColor='#F0F0F0'" <%
	}
	else
	{
		%> onmouseover="this.style.backgroundColor='#F9DFEB'" onmouseout="this.style.backgroundColor='#FFFFFF'" <%
	}
	
  %> >
					<td height="50"><%=i%></td>
					<td>${shangpinxinxi.shangpinbianhao}</td>
    <td>${shangpinxinxi.shangpinmingcheng}</td>
    <td>${shangpinxinxi.shangpinleibie}</td>
    <td>${shangpinxinxi.zhiyaogongsi}</td>
    <td>${shangpinxinxi.jiage}</td>
    <td>${shangpinxinxi.kucun}</td>
    <td>${shangpinxinxi.xiaoliang}</td>
    <td width='90' align='center'><a href='${shangpinxinxi.tupian}' target='_blank'><img src='${shangpinxinxi.tupian}' width=88 height=99 border=0 /></a></td>
    
    <td>${shangpinxinxi.yaoxiao}</td>
    
					
					<td height="50">${shangpinxinxi.addtime}</td>
					<td width="150" height="50"  align="center">
						     <input type="button" value="删除" onclick="shangpinxinxiDel(${shangpinxinxi.id})" class="btn btn-info btn-small"/>
						     <input type="button" value="编辑" onclick="shangpinxinxiPre(${shangpinxinxi.id})" class="btn btn-info btn-small"/>
							 
							 <input type="button" value="详细" onclick="shangpinxinxiDetail(${shangpinxinxi.id})" class="btn btn-info btn-small"/>
				  </td>
				</tr>
				</c:forEach>
	</table>
			
			 <%
 int i2=0;
			String sql="select * from t_shangpinxinxi where 1=1 ";
				
if(request.getParameter("shangpinbianhao")=="" ||request.getParameter("shangpinbianhao")==null ){}else{String nshangpinbianhao=new String(request.getParameter("shangpinbianhao").getBytes("8859_1"));if(nshangpinbianhao.contains("?")){nshangpinbianhao=request.getParameter("shangpinbianhao");}sql=sql+" and shangpinbianhao like '%"+nshangpinbianhao+"%'";}
if(request.getParameter("shangpinmingcheng")=="" ||request.getParameter("shangpinmingcheng")==null ){}else{String nshangpinmingcheng=new String(request.getParameter("shangpinmingcheng").getBytes("8859_1"));if(nshangpinmingcheng.contains("?")){nshangpinmingcheng=request.getParameter("shangpinmingcheng");}sql=sql+" and shangpinmingcheng like '%"+nshangpinmingcheng+"%'";}
			sql+=" order by id desc";

							
							int jiagetx=0;
			ResultSet RS_result=connDbBean.executeQuery(sql);
while(RS_result.next()){
				i2++;
						
						
						if(Float.valueOf(RS_result.getString("jiage")).floatValue()<50){jiagetx=jiagetx+1;}

						
			 }
			%>
		 
			
			<%@ include file="hsgfenye.jsp"%> 
			
			
	</body>
</html>
 <%
 if(jiagetx>0)
{
%>
 <style>
#winpop { width:200px; height:0px; position:absolute; right:0; bottom:0; border:1px solid #666; margin:0; padding:1px; overflow:hidden; display:none;} 
#winpop .title { width:100%; height:22px; line-height:20px; background:#FFCC00; font-weight:bold; text-align:center; font-size:12px;} 
#winpop .con { width:100%; height:90px; line-height:20px; font-weight:bold; font-size:12px; color:#FF0000; text-align:center} 
#silu { font-size:12px; color:#666; position:absolute; right:0; text-align:right; text-decoration:underline; line-height:22px;} 
.close { position:absolute; right:4px; top:-1px; color:#FFF; cursor:pointer} 
</style> 
<script type="text/javascript"> 
function tips_pop(){ 
var MsgPop=document.getElementById("winpop"); 
var popH=parseInt(MsgPop.style.height);//将对象的高度转化为数字 
if (popH==0){ 
MsgPop.style.display="block";//显示隐藏的窗口 
show=setInterval("changeH('up')",2); 
} 
else { 
hide=setInterval("changeH('down')",2); 
} 
} 
function changeH(str) { 
var MsgPop=document.getElementById("winpop"); 
var popH=parseInt(MsgPop.style.height); 
if(str=="up"){ 
if (popH <=100){ 
MsgPop.style.height=(popH+4).toString()+"px"; 
} 
else{ 
clearInterval(show); 
} 
} 
if(str=="down"){ 
if (popH>=4){ 
MsgPop.style.height=(popH-4).toString()+"px"; 
} 
else{ 
clearInterval(hide);  
MsgPop.style.display="none"; //隐藏DIV 
} 
} 
} 
window.onload=function(){ //加载 
document.getElementById('winpop').style.height='0px'; 
setTimeout("tips_pop()",500); //3秒后调用tips_pop()这个函数 
} 
</script> <div id="silu"> 
<body>
</div> 
<div id="winpop"> 
<div class="title">系统提醒！ <span class="close" onClick="tips_pop()">X </span> </div> 
<div class="con">当前有<%=jiagetx%>条价格值记录小于50，谢谢！</div>
<%
}
%>