<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="yonghuhsgb" scope="page" class="com.action.yonghuAction" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>�û���ѯ</TITLE>
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
          
		   function yonghuDetail(id)
           {
                  // window.location.href="yonghuDetail.action?id="+id;
				   window.open("yhDetail.action?id="+id,"_blank");
           }
           
           function yonghuAdd()
           {
                 var url="yonghuAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>
	<body leftmargin="2" topmargin="9"  onload="catelogAll()">
	<form action="" name="formAdd" method="post">
				     <table width="98%" align="center" border="1" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="10" colspan="8" background="img/tbg.gif">�����û��б�</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    
					      <td  bgcolor="#FFFFFF" align="left">
						  ����:  �˺ţ�<input name="zhanghao" type="text" id="zhanghao" class="form-control2" /> �Ա�<select name='xingbie' id='xingbie' class="form-control2"><option value="">����</option><option value="��">��</option><option value="Ů">Ů</option></select>
					        <input name="submit" type="submit"  value="��ѯ" class="btn btn-info btn-small" /> 
                          </td>
						</tr>
					 </table>
	</form>
			
			<table width="98%" border="1" align="center" cellpadding="4" cellspacing="1" bordercolor="#F3F3F3" bgcolor="#CBD8AC" style="margin-bottom:8px">
				
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="50" height="50">���</td>
					<td >�˺�</td>    <td >����</td>    <td >����</td>    <td  width='40' align='center'>�Ա�</td>    <td >�ֻ�</td>    <td >���֤</td>    <td  width='90' align='center'>��Ƭ</td>        
					
					<td width="140" height="50">���ʱ��</td>
					<td width="140" height="50">����</td>
		        </tr>
				 <%
			String sql="select * from t_yonghu where 1=1 ";
			if(request.getParameter("zhanghao")=="" ||request.getParameter("zhanghao")==null ){}else{String nzhanghao=new String(request.getParameter("zhanghao").getBytes("8859_1"));if(nzhanghao.contains("?")){nzhanghao=request.getParameter("zhanghao");}sql=sql+" and zhanghao like '%"+nzhanghao+"%'";}if(request.getParameter("xingbie")=="" ||request.getParameter("xingbie")==null ){}else{sql=sql+" and xingbie like '%"+request.getParameter("xingbie")+"%'";}
			sql=sql+" order by id desc";
int i=0;
			ResultSet RS_result=connDbBean.executeQuery(sql);
while(RS_result.next()){
						i++;
			%>
				<tr align="center" >
					<td height="50"><%=i%></td>
					<td><%=RS_result.getString("zhanghao")%></td>    <td><%=RS_result.getString("mima")%></td>    <td><%=RS_result.getString("xingming")%></td>    <td><%=RS_result.getString("xingbie")%></td>    <td><%=RS_result.getString("shouji")%></td>    <td><%=RS_result.getString("shenfenzheng")%></td>    <td width='90' align='center' bgcolor='#ebf0f7'><a href='<%=RS_result.getString("zhaopian")%>' target='_blank'><img src='<%=RS_result.getString("zhaopian")%>' width=88 height=99 border=0 /></a></td>    
					<td height="50"><%=RS_result.getString("addtime")%></td>
					<td width="200px" height="50"  align="center"><!--lianjie1--> <input type="button" value="��ϸ" onclick="yonghuDetail(${yonghu.id})" class="btn btn-info btn-small" /></td>
				</tr>
				<%} %>
	</table>
	</body>
</html>
