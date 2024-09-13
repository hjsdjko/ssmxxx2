<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="goumaihsgb" scope="page" class="com.action.goumaiAction" />
<html>
  <head>
    <title>购买详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">   

  </head>

  <body >

  购买详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>药品编号：</td><td width='39%'>${goumai.shangpinbianhao}</td>
     <td width='11%'>药品名称：</td><td width='39%'>${goumai.shangpinmingcheng}</td></tr><tr>
     <td width='11%'>药品类别：</td><td width='39%'>${goumai.shangpinleibie}</td>
     <td width='11%'>制药公司：</td><td width='39%'>${goumai.zhiyaogongsi}</td></tr><tr>
     <td width='11%'>价格：</td><td width='39%'>${goumai.jiage}</td>
     <td width='11%'>库存：</td><td width='39%'>${goumai.kucun}</td></tr><tr>
     <td width='11%'>销量：</td><td width='39%'>${goumai.xiaoliang}</td>
     <td width='11%'>购买数量：</td><td width='39%'>${goumai.goumaishuliang}</td></tr><tr>
     <td width='11%'>购买金额：</td><td width='39%'>${goumai.goumaijine}</td>
     <td width='11%'>购买人：</td><td width='39%'>${goumai.goumairen}</td>
     </tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" class="btn btn-info btn-small" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" class="btn btn-info btn-small" /></td></tr>
    
  </table>

  </body>
</html>

