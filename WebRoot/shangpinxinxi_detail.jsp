﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ page isELIgnored="false" %> 
<jsp:useBean id="shangpinxinxihsgb" scope="page" class="com.action.shangpinxinxiAction" />
<html>
  <head>
    <title>药品信息详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">   

  </head>

  <body >

  药品信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" style="border-collapse:collapse">  
   <tr>
     <td width='11%' height=44>药品编号：</td><td width='39%'>${shangpinxinxi.shangpinbianhao}</td>
<td  rowspan=8 align=center><a href=${shangpinxinxi.tupian} target=_blank><img src=${shangpinxinxi.tupian} width=228 height=215 border=0></a></td>
</tr><tr>
<td width='11%' height=44>药品名称：</td><td width='39%'>${shangpinxinxi.shangpinmingcheng}</td>
</tr><tr>
<td width='11%' height=44>药品类别：</td><td width='39%'>${shangpinxinxi.shangpinleibie}</td>
</tr><tr>
<td width='11%' height=44>制药公司：</td><td width='39%'>${shangpinxinxi.zhiyaogongsi}</td>
</tr><tr>
<td width='11%' height=44>价格：</td><td width='39%'>${shangpinxinxi.jiage}</td>
</tr><tr>
<td width='11%' height=44>库存：</td><td width='39%'>${shangpinxinxi.kucun}</td>
</tr><tr>
<td width='11%' height=44>销量：</td><td width='39%'>${shangpinxinxi.xiaoliang}</td>
</tr><tr>


<td width='11%' height=44>药效：</td><td width='39%'>${shangpinxinxi.yaoxiao}</td>
</tr><tr>
<td width='11%' height=100  >药品简介：</td><td width='39%' colspan=2 height=100 >${shangpinxinxi.yaopinjianjie}</td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" class="btn btn-info btn-small" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" class="btn btn-info btn-small" /></td></tr>
    
  </table>

  </body>
</html>

