<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<jsp:useBean id="shangpinxinxihsgb" scope="page" class="com.action.shangpinxinxiAction" />

<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title>药品信息</title>

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
				<h3>药品信息<img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  
				  <div class="content-form">
				  
   <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
      <tr>
		 <td width='11%' height=44>药品编号：</td><td width='39%'>${shangpinxinxi.shangpinbianhao}</td><td  rowspan=8 align=center><a href=${shangpinxinxi.tupian} target=_blank><img src=${shangpinxinxi.tupian} width=228 height=215 border=0></a></td></tr><tr>
         <td width='11%' height=44>药品名称：</td><td width='39%'>${shangpinxinxi.shangpinmingcheng}</td></tr><tr>
         <td width='11%' height=44>药品类别：</td><td width='39%'>${shangpinxinxi.shangpinleibie}</td></tr><tr>
         <td width='11%' height=44>制药公司：</td><td width='39%'>${shangpinxinxi.zhiyaogongsi}</td></tr><tr>
         <td width='11%' height=44>价格：</td><td width='39%'>${shangpinxinxi.jiage}</td></tr><tr>
         <td width='11%' height=44>库存：</td><td width='39%'>${shangpinxinxi.kucun}</td></tr><tr>
         <td width='11%' height=44>销量：</td><td width='39%'>${shangpinxinxi.xiaoliang}</td></tr><tr>
         
         
         <td width='11%' height=44>药效：</td><td width='39%'>${shangpinxinxi.yaoxiao}</td></tr><tr>
         <td width='11%' height=100  >药品简介：</td><td width='39%' colspan=2 height=100 >${shangpinxinxi.yaoxiao}</td></tr><tr><td colspan=3 align=center>点赞数:<a href="spxxDetail.action?id=<%=request.getParameter("id")%>&dztp=d"><img src="qtimages/ding.gif" width="40" height="40"> ${shangpinxinxi.dianzan_d} </a> <a href="spxxDetail.action?id=<%=request.getParameter("id")%>&dztp=c"><img src="qtimages/cai.gif" width="40" height="40">${shangpinxinxi.dianzan_c}</a> </td></tr><tr>							 
                                <td colspan="3">
								
								<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse" class="newsline">
                                  <tr>
                                    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
                                    <td width="471" bgcolor='#CCFFFF'>评价内容</td>
                                    <td width="88" bgcolor='#CCFFFF'>评分</td>
                                    <td width="88" bgcolor='#CCFFFF'>评论人</td>
                                    <td width="138" align="center" bgcolor="CCFFFF">评论时间</td>
                                  </tr>
                                  <%
			List pagelist3=connDbBean.getPinglunlist("shangpinxinxi",request.getParameter("id"),7);
			if(!pagelist3.isEmpty()){
				for(int ipl=0;ipl<pagelist3.size();ipl++){
					List pagelist2 =(ArrayList)pagelist3.get(ipl);
			%>
                                  <tr>
                                    <td width="30" align="center" ><%=ipl+1%></td>
                                    <td width="471"><%=pagelist2.get(2).toString() %></td>
                                    <td width="88" ><%=pagelist2.get(4).toString() %></td>
                                    <td width="88" ><%=pagelist2.get(3).toString() %></td>
                                    <td width="138" align="center" ><%=pagelist2.get(6).toString() %></td>
                                  </tr>
                                  <%
								  }}
								  %>
                                </table>
								
								</td>
                                </tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />
<input type=button name=Submit52 value=打印 onClick="javascript:window.print()" /> <!--jixaaxnnxiu-->
<input type=button name=Submit53 value=评论 onClick="javascript:hsgpinglun('shangpinxinxi','<%=request.getParameter("id")%>')" <%if((String)request.getSession().getAttribute("username")==null){%> disabled="disabled" <%}%> />
<input type=button name=Submit52 value=收藏 onClick="javascript:location.href='jrsc.jsp?id=<%=request.getParameter("id")%>&biao=shangpinxinxi&ziduan=shangpinmingcheng&biaoj=spxx';"  <%if((String)request.getSession().getAttribute("username")==null){%> disabled="disabled" <%}%> />
</td></tr>
    
  </table>
					</div>
					
					
							</ul>
		</div>
		
	</div>
</div>
<%@ include file="qtdown.jsp"%>

<a class='bshareDiv' href='http://www.bshare.cn/share'>分享按钮</a><script type='text/javascript' charset='utf-8' src='http://static.bshare.cn/b/buttonLite.js#uuid=&amp;style=3&amp;fs=4&amp;textcolor=#fff&amp;bgcolor=#9C3&amp;text=分享到'></script>
</body>
</html>

