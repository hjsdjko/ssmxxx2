<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<TITLE>dx</TITLE>
	    <link rel="stylesheet" href="kindeditor_a5/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor_a5/plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor_a5/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor_a5/lang/zh_CN.js"></script>
	<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="hsgttcontent"]', {
				cssPath : 'kindeditor_a5/plugins/code/prettify.css',
				uploadJson : 'kindeditor_a5/jsp/upload_json.jsp',
				fileManagerJson : 'kindeditor_a5/jsp/file_manager_json.jsp',
					allowFileManager : true
				});
				K('input[name=getHtml]').click(function(e) {
						
						document.form1.neirong.value=editor.html();
						form1.submit();
				});
			});
			
		</script>
      
        <LINK href="css.css" type=text/css rel=stylesheet>
       
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<%
String lb=request.getParameter("lb");
String sql="";
String nid="1";
int nnid=1;
List ndx=connDbBean.hsgselect("select * from t_dx where leibie='"+lb+"'",3);
			if(ndx.isEmpty()){
				sql="select max(ID) as ss from t_dx";
				ResultSet RS_resultxwlb=connDbBean.executeQuery(sql);
				 if(RS_resultxwlb.next()){
				 nid=RS_resultxwlb.getString("ss");
				 }
				 if(nid==null)
				 {
				 	nnid=1;
				 }
				 else
				 {
				 nnid=Integer.parseInt(nid)+1;
				 }
				
				sql="insert into t_dx(ID,leibie,content) values("+nnid+",'"+lb+"','"+lb+"')";
				connDbBean.hsgexecute(sql);
}


if (request.getParameter("updt")!=null)
{
	sql="update t_dx set content='"+request.getParameter("neirong")+"' where leibie='"+lb+"'";
	//out.print(sql);
	connDbBean.hsgexecute(sql);
	
}
%>
	<body>
			<form action="dx.jsp?updt=a" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" >设置<%=lb%></td>
						</tr>
						
		<tr ><td width="200">内容：</td><td><textarea name="hsgttcontent" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=connDbBean.readzd("t_dx","content","leibie",lb)%></textarea></td></tr>
		

		
						<tr align='center'   height="22">
						    <td width="200"  align="right">&nbsp;						    </td>
						    <td width="75%"  align="left">
						    <input type="button" name="getHtml" value="提交" onClick="return checkform();"/> <input name="neirong" type="hidden" id="neirong" value="">
						       <input type="reset" value="重置"/>&nbsp;<input type="hidden" name="lb" value="<%=lb%>"/>							    </td>
						</tr>

					 </table>
			</form>
   </body>
</html>




