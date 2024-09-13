<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="yaopinrukuhsgb" scope="page" class="com.action.yaopinrukuAction" />
<html>
  <head>
    <title>药品入库详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">   

  </head>

  <body >

  药品入库详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>药品编号：</td><td width='39%'>${yaopinruku.shangpinbianhao}</td>
     <td width='11%'>药品名称：</td><td width='39%'>${yaopinruku.shangpinmingcheng}</td></tr><tr>
     <td width='11%'>药品类别：</td><td width='39%'>${yaopinruku.shangpinleibie}</td>
     <td width='11%'>制药公司：</td><td width='39%'>${yaopinruku.zhiyaogongsi}</td></tr><tr>
     <td width='11%'>库存：</td><td width='39%'>${yaopinruku.kucun}</td>
     <td width='11%'>入库数量：</td><td width='39%'>${yaopinruku.rukushuliang}</td></tr><tr>
     <td width='11%'>入库日期：</td><td width='39%'>${yaopinruku.rukuriqi}</td>
     <td width='11%'>入库说明：</td><td width='39%'>${yaopinruku.rukushuoming}</td>
     </tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" class="btn btn-info btn-small" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" class="btn btn-info btn-small" /></td></tr>
    
  </table>

  </body>
</html>

