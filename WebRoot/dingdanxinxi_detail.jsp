<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="dingdanxinxihsgb" scope="page" class="com.action.dingdanxinxiAction" />
<html>
  <head>
    <title>订单信息详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">   

  </head>

  <body >

  订单信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>订单号：</td><td width='39%'>${dingdanxinxi.dingdanhao}</td>     <td width='11%'>订单内容：</td><td width='39%'>${dingdanxinxi.dingdanneirong}</td></tr><tr>     <td width='11%'>订单金额：</td><td width='39%'>${dingdanxinxi.dingdanjine}</td>     <td width='11%'>购买人：</td><td width='39%'>${dingdanxinxi.goumairen}</td></tr><tr>     <td width='11%'>电话：</td><td width='39%'>${dingdanxinxi.dianhua}</td>     <td width='11%'>地址：</td><td width='39%'>${dingdanxinxi.dizhi}</td></tr><tr>     <td width='11%'>备注：</td><td width='39%'>${dingdanxinxi.beizhu}</td>     <td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" class="btn btn-info btn-small" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" class="btn btn-info btn-small" /></td></tr>
    
  </table>

  </body>
</html>

