<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="yaopinleibiehsgb" scope="page" class="com.action.yaopinleibieAction" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>药品类别查询</TITLE>
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
          
		   function yaopinleibieDetail(id)
           {
                  //tanchuangfanshi1 window.location.href="yaopinleibieDetail.action?id="+id;
				  //tanchuangfanshi2 window.open("yplbDetail.action?id="+id,"_blank");
           }
           
           function yaopinleibieAdd()
           {
                 var url="yaopinleibieAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>
	<body leftmargin="2" topmargin="9"  onload="catelogAll()">
	<form action="" name="formAdd" method="post">
				     <table width="98%" align="center" border="1" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="10" colspan="8" background="img/tbg.gif">所有药品类别列表</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    
					      <td  bgcolor="#FFFFFF" align="left">
						  搜索:  类别：<input name="leibie" type="text" id="leibie" class="form-control2" />
					        <input name="submit" type="submit"  value="查询" class="btn btn-info btn-small" /> 
                          </td>
						</tr>
					 </table>
	</form>
			
			<table width="98%" border="1" align="center" cellpadding="4" cellspacing="1" bordercolor="#F3F3F3" bgcolor="#CBD8AC" style="margin-bottom:8px">
				
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="50" height="50">序号</td>
					<td >类别</td>    
					
					<td width="140" height="50">添加时间</td>
					<td width="140" height="50">操作</td>
		        </tr>
				 <%
			String sql="select * from t_yaopinleibie where 1=1 ";
			if(request.getParameter("leibie")=="" ||request.getParameter("leibie")==null ){}else{String nleibie=new String(request.getParameter("leibie").getBytes("8859_1"));if(nleibie.contains("?")){nleibie=request.getParameter("leibie");}sql=sql+" and leibie like '%"+nleibie+"%'";}
			sql=sql+" order by id desc";
int i=0;
			ResultSet RS_result=connDbBean.executeQuery(sql);
while(RS_result.next()){
						i++;
			%>
				<tr align="center" >
					<td height="50"><%=i%></td>
					<td><%=RS_result.getString("leibie")%></td>    
					<td height="50"><%=RS_result.getString("addtime")%></td>
					<td width="200px" height="50"  align="center"><!--lianjie1--> </td>
				</tr>
				<%} %>
	</table>
	</body>
</html>
