<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<jsp:useBean id="yaopinrukuhsgb" scope="page" class="com.action.yaopinrukuAction" />

<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>药品入库</title>

	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta name="author" content="">
	<meta name="format-detection" content="telephone=no">
	<link href="qtimages/Layout.css" rel="stylesheet" type="text/css">
	<script src="qtimages/getjs_bdtj"></script><script charset="utf-8" src="qtimages/insert_bdtj"></script><script src="qtimages/conv.js"></script><script src="qtimages/hm.js"></script>					<script type="text/javascript" src="qtimages/jquery1.42.min.js"></script>
	<script type="text/javascript" src="qtimages/jquery.SuperSlide.2.1.1.js"></script>
	<script src="qtimages/scrollReveal.js"></script> 
	 <link rel="stylesheet" href="./qtimages/sl_common_form.css">
</head>

<script language=javascript> 
function hsgpinglun(nbiao,nid){ 
popheight=450;
pop('hsgpinglun.jsp?biao='+nbiao+'&id='+nid,'在线评论',550,250) ;
}
</script> 
<%
	
	
     %>
<body>
<%@ include file="qttop.jsp"%>
<%@ include file="sidebufen1.jsp"%>


<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			<em>你的梦想我很在意 更支持</em>
			<div class="line">
				<h3>药品入库<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  
				  <div class="content-form">
				  
   <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
      <tr>
		 <td width='11%'>药品编号：</td><td width='39%'>${yaopinruku.shangpinbianhao}</td>
     <td width='11%'>药品名称：</td><td width='39%'>${yaopinruku.shangpinmingcheng}</td></tr><tr>
     <td width='11%'>药品类别：</td><td width='39%'>${yaopinruku.shangpinleibie}</td>
     <td width='11%'>制药公司：</td><td width='39%'>${yaopinruku.zhiyaogongsi}</td></tr><tr>
     <td width='11%'>库存：</td><td width='39%'>${yaopinruku.kucun}</td>
     <td width='11%'>入库数量：</td><td width='39%'>${yaopinruku.rukushuliang}</td></tr><tr>
     <td width='11%'>入库日期：</td><td width='39%'>${yaopinruku.rukuriqi}</td>
     <td width='11%'>入库说明：</td><td width='39%'>${yaopinruku.rukushuoming}</td>
     </tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />
<input type=button name=Submit52 value=打印 onClick="javascript:window.print()"  /> <!--jixaaxnnxiu-->
</td></tr>
    
  </table>
					</div>
					
					
							</ul>
		</div>
		
	</div>
</div>
<%@ include file="qtdown.jsp"%>


</body>
</html>

