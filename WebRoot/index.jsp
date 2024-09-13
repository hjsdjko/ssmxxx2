<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<title>医院药品管理系统</title>
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta name="author" content="">
	<meta name="format-detection" content="telephone=no">
	<link href="qtimages/Layout.css" rel="stylesheet" type="text/css">
	<script src="qtimages/getjs_bdtj"></script><script charset="utf-8" src="qtimages/insert_bdtj"></script><script src="qtimages/conv.js"></script><script src="qtimages/hm.js"></script>					<script type="text/javascript" src="qtimages/jquery1.42.min.js"></script>
	<script type="text/javascript" src="qtimages/jquery.SuperSlide.2.1.1.js"></script>
	<script src="qtimages/scrollReveal.js"></script> 
</head>
<body>
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<div class="pannel">
	<div class="container c">
		<div class="pannel-txt fl">
			<img src="qtimages/pannel-title.png" height="26" width="221" alt="" title="">
			<em>绿色通道</em>
		</div>
		<div class="fl">
			<div class="search c">
				<form action="" method="post"><input type="text" name="title" class="search-text fl" value="请输入搜索关键词" onclick="this.value=&#39;&#39;">
					<input class="search-btn fr" type="submit" value=""></form>			</div>
			<div class="keyword">
				<ul>
					<em class="fl">请输入关键词搜索!</em>
			  </ul>
			</div>
		</div>
		<div class="pannel-tel fr">
			<span>咨询热线</span>
			<strong>131-868-35580</strong>
		</div>
	</div>
</div>
<%@ include file="sidebufen1.jsp"%>
<div class="course">
	<div class="container">
		<div class="index-title txt-c">
			<em>药品推荐</em>
			
		</div>
		<div class="course-list">
			<div class="hd">
				<a class="next"></a>
				<a class="prev"></a>
			</div>
			<div class="bd">
				<div class="tempWrap" style="overflow:hidden; position:relative; width:1155px"><div class="ulWrap" style="width: 1925px; left: 0px; position: relative; overflow: hidden; padding: 0px; margin: 0px;">
					 <s:iterator value="#request.shangpinxinxiznxwList" id="shangpinxinxiznxw">
					<ul style="float: left; width: 385px;">
						<li>
								<a href="spxxDetail.action?id=<s:property value='#shangpinxinxiznxw.id'/>" title="<s:property value='#shangpinxinxiznxw.shangpinmingcheng'/>">
									<div class="pic">
										<img src="<s:property value='#shangpinxinxiznxw.tupian'/>" height="270" width="370" alt="<s:property value='#shangpinxinxiznxw.shangpinmingcheng'/>" title="<s:property value='#shangpinxinxiznxw.shangpinmingcheng'/>">
									</div>
									<em><s:property value='#shangpinxinxiznxw.shangpinmingcheng'/></em>
								</a>
					  </li></ul>
				</s:iterator>	
					
				</div></div>
			</div>
		</div>
		<a href="spxxList.action" class="more product-more">查看更多</a>
	</div>
</div>

<script type="text/javascript">
	jQuery(".course-list").slide({titCell:".hd ul",mainCell:".bd .ulWrap",autoPage:true,effect:"left",vis:3});
</script>
<div class="about">
	<div class="container">
		<div class="about-title txt-c">
			<h3>关于我们</h3>
		</div>
		<div class="info">
			 <p> 公司行为准则:忠信仁义，以人为本。 <br>
                忠：即忠诚，包括三重含义：企业忠于国家、忠于民族；企业忠于客户；员工忠于企业。 <br>
                信：即诚信，做企业要立足根本道德、信义，要诚实、讲信用。 <br>
                义：即大义，公司在与合作伙伴、客户的交往过程中，不做损人利己的事，维护自己利益的前提是不损害他人利益；对民族、社会要共襄义举，要识大义，明是非。 <br>
		  </p>
		</div>
		<a href="dx_detail.jsp?lb=关于我们" class="about-more hvr-shutter-out-horizontal">查看更多</a>
	</div>
</div>
<div class="campus"></div>

<div class="why"></div>
<div class="news"></div>
<script type="text/javascript">
	jQuery(".case").slide({mainCell:".case-list ul",autoPlay:true,effect:"leftMarquee",vis:4,interTime:50,trigger:"click"});
</script>
<%@ include file="qtdown.jsp"%>
</body></html>