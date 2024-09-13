<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="yonghuhsgb" scope="page" class="com.action.yonghuAction" />
<html>
  <head>
    <title>用户详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">   

  </head>

  <body >

  用户详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" style="border-collapse:collapse">  
   <tr>
     <td width='11%' height=44>账号：</td><td width='39%'>${yonghu.zhanghao}</td><td  rowspan=6 align=center><a href=${yonghu.zhaopian} target=_blank><img src=${yonghu.zhaopian} width=228 height=215 border=0></a></td></tr><tr><td width='11%' height=44>密码：</td><td width='39%'>${yonghu.mima}</td></tr><tr><td width='11%' height=44>姓名：</td><td width='39%'>${yonghu.xingming}</td></tr><tr><td width='11%' height=44>性别：</td><td width='39%'>${yonghu.xingbie}</td></tr><tr><td width='11%' height=44>手机：</td><td width='39%'>${yonghu.shouji}</td></tr><tr><td width='11%' height=44>身份证：</td><td width='39%'>${yonghu.shenfenzheng}</td></tr><tr><td width='11%' height=100  >备注：</td><td width='39%' colspan=2 height=100 >${yonghu.beizhu}</td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" class="btn btn-info btn-small" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" class="btn btn-info btn-small" /></td></tr>
    
  </table>

  </body>
</html>

