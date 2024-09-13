<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");%>
<%
  String lb=request.getParameter("lb");
  //String lb=new String(request.getParameter("lb").getBytes("8859_1"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
  <title><%=lb%></title>
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
 <script language="javascript">
           function go(index,lb)
           {
               document.form123.index.value=index;
               document.form123.action="news.action?lb="+lb
               document.form123.submit();
           }  
       </script>
<body>
<%@ include file="qttop.jsp"%>
<%@ include file="sidebufen1.jsp"%>


<div class="news">
	<div class="container">
		<div class="index-title txt-c">
			<em>你的梦想我很在意 更支持</em>
			<div class="line">
				<h3><%=lb%><img src="qtimages/en-news.png" height="16" width="93"></h3>
			</div>
		</div>
		<div class="news-list c">
			<ul>
				  
				  
				  <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#FA9090" class="newsline" style="border-collapse:collapse">
				
				<%
					int i=0;
				%>
				<c:forEach items="${requestScope.page.data}" var="xinwentongzhi" varStatus="sta">
				<%
					i++;
				%>
				<tr align='center' bgcolor="#FFFFFF" onMouseOver="this.style.backgroundColor='#EDDCC2'" onMouseOut="this.style.backgroundColor='#ffffff'" height="30">
					<td width="23"><img src="qtimages/1.png" height="7"></td>
					<td width="735" align="left"><a href="ggdetail.action?id=${xinwentongzhi.id}">${xinwentongzhi.biaoti}</a></td>
    
    
    <td width="160">被点击${xinwentongzhi.dianjilv}次</td>
    <td width="170">${xinwentongzhi.addtime}</td>
				  </tr>
				</c:forEach>
			</table>
			               
						   
						   <form action="" name="form123" method="post">
                  <input type="hidden" name="index"/>
            </form>
                      <br/>
		    <table border='0' cellpadding='0' cellspacing='0' align="center">
		        <tr>
			        <td width='98%' align="right">
			                 <div class="fy"> 共<span style='color:#FF0000'>${requestScope.page.totle}</span>条记录&nbsp;&nbsp;&nbsp;&nbsp;
			                  每页<span style='color:#FF0000'>${requestScope.page.pageSize}</span>条&nbsp;&nbsp;&nbsp;&nbsp;
			                  第<span style='color:#FF0000'>${requestScope.page.index}</span>页/共${requestScope.page.totlePage}页&nbsp;&nbsp;&nbsp;&nbsp;
			                <c:if test="${requestScope.page.index==1}">
			                       首&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;
			                </c:if>
			                <c:if test="${requestScope.page.index!=1}">
			                       <a style='color: red' href='#' onClick="go(1,'<%=lb%>')">首&nbsp;&nbsp;页</a>
			                       &nbsp;&nbsp;&nbsp;&nbsp;
			                       <a style='color: red' href='#' onClick="go(${requestScope.page.index-1},'<%=lb%>')">上一页</a>
			                       &nbsp;&nbsp;&nbsp;&nbsp;
			                </c:if>
			                <c:if test="${requestScope.page.index >= requestScope.page.totlePage}">
			                          下一页&nbsp;&nbsp;&nbsp;&nbsp;末&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;
			                </c:if>
			                <c:if test="${requestScope.page.index < requestScope.page.totlePage}">
			                       <a style='color: red' href='#' onClick="go(${requestScope.page.index+1},'<%=lb%>')">下一页</a>
			                       &nbsp;&nbsp;&nbsp;&nbsp;
			                       <a style='color: red' href='#' onClick="go(${requestScope.page.totlePage},'<%=lb%>')">末&nbsp;&nbsp;页</a>
			                </c:if>
							</div>
			        </td>
		       </tr>
		    </table>
					
					
							</ul>
		</div>
		
	</div>
</div>
<%@ include file="qtdown.jsp"%>

</body></html>