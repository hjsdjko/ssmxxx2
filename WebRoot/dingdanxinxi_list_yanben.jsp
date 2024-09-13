<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dingdanxinxihsgb" scope="page" class="com.action.dingdanxinxiAction" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>订单信息查询</TITLE>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">   
	
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
          
		   function dingdanxinxiDetail(id)
           {
                  // window.location.href="dingdanxinxiDetail.action?id="+id;
				   window.open("ddxxDetail.action?id="+id,"_blank");
           }
           
           function dingdanxinxiAdd()
           {
                 var url="dingdanxinxiAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>
	<body leftmargin="2" topmargin="9"  onload="catelogAll()">
	<form action="" name="formAdd" method="post">
				     <table width="98%" align="center" border="1" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="10" colspan="8" background="img/tbg.gif">所有订单信息列表</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    
					      <td  bgcolor="#FFFFFF" align="left">
						  搜索:  订单号：<input name="dingdanhao" type="text" id="dingdanhao" class="form-control2" />  订单内容：<input name="dingdanneirong" type="text" id="dingdanneirong" class="form-control2" />
					        <input name="submit" type="submit"  value="查询" class="btn btn-info btn-small" /> 
                          </td>
						</tr>
					 </table>
	</form>
			
			<table width="98%" border="1" align="center" cellpadding="4" cellspacing="1" bordercolor="#F3F3F3" bgcolor="#CBD8AC" style="margin-bottom:8px">
				
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="50" height="50">序号</td>
					<td >订单号</td>        <td >订单金额</td>    <td >购买人</td>    <td >电话</td>    <td >地址</td>        <td  width='80' align='center'>是否支付</td>    
					
					<td width="140" height="50">添加时间</td>
					<td width="140" height="50">操作</td>
		        </tr>
				 <%
			String sql="select * from t_dingdanxinxi where 1=1 ";
			if(request.getParameter("dingdanhao")=="" ||request.getParameter("dingdanhao")==null ){}else{String ndingdanhao=new String(request.getParameter("dingdanhao").getBytes("8859_1"));if(ndingdanhao.contains("?")){ndingdanhao=request.getParameter("dingdanhao");}sql=sql+" and dingdanhao like '%"+ndingdanhao+"%'";}if(request.getParameter("dingdanneirong")=="" ||request.getParameter("dingdanneirong")==null ){}else{String ndingdanneirong=new String(request.getParameter("dingdanneirong").getBytes("8859_1"));if(ndingdanneirong.contains("?")){ndingdanneirong=request.getParameter("dingdanneirong");}sql=sql+" and dingdanneirong like '%"+ndingdanneirong+"%'";}
			sql=sql+" order by id desc";
int i=0;
			ResultSet RS_result=connDbBean.executeQuery(sql);
while(RS_result.next()){
						i++;
			%>
				<tr align="center" >
					<td height="50"><%=i%></td>
					<td><%=RS_result.getString("dingdanhao")%></td>    <td><%=RS_result.getString("dingdanjine")%></td>    <td><%=RS_result.getString("goumairen")%></td>    <td><%=RS_result.getString("dianhua")%></td>    <td><%=RS_result.getString("dizhi")%></td>    <td><%=RS_result.getString("iszf")%></td>    
					<td height="50"><%=RS_result.getString("addtime")%></td>
					<td width="200px" height="50"  align="center"><!--lianjie1--> <input type="button" value="详细" onclick="dingdanxinxiDetail(${dingdanxinxi.id})" class="btn btn-info btn-small" /></td>
				</tr>
				<%} %>
	</table>
	</body>
</html>
