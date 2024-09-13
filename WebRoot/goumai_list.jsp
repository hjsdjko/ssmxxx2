<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("gb2312");%>
<jsp:useBean id="goumaihsgb" scope="page" class="com.action.goumaiAction" /> 



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>购买查询</TITLE>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
	<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">   
	
		
		<script type='text/javascript' src='dwr/interface/loginService.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
        <script language="javascript">
		   function catelogAll()
           {
                   document.getElementById("indicator").style.display="block";
                   loginService.catelogAll(callback);
               
           }
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("catelog_id",data,"id","name");
           }
           function goumaiDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="goumaiDel.action?id="+id;
               }
           }
           
		   function goumaiDetail(id)
           {
                  // window.location.href="goumaiDetail.action?id="+id;
				   window.open("gmDetail.action?id="+id,"_blank");
           }
           function goumaiPre(id)
           {
                   window.location.href="goumaiPre.action?id="+id;
           }
		   function goumaiPrelb(id)
           {
                   window.location.href="goumaiPrelb.action?id="+id;
           }
           function goumaiIssh(id)
           {
                   window.location.href="goumaiIssh.action?id="+id;
           }
           function goumaiAdd()
           {
                 var url="goumaiAdd.jsp";
				 window.location.href=url;
           }
           
           
           function go(index)
           {
               document.form123.index.value=index;
               document.form123.action="goumaiList.action"
               document.form123.submit();
           }  
		    function check()
           {
               document.formAdd.submit();
           }
       </script>
	   
	</head>

	<body leftmargin="2" topmargin="9" background='img/allbg.gif' onload="catelogAll()">
	
	<form action="goumaiList.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="1" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="30" colspan="8" background="img/tbg.gif">所有购买列表</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="45">
						    
					      <td  bgcolor="#FFFFFF" align="left">
						  搜索:  药品编号：<input name="shangpinbianhao" type="text" id="shangpinbianhao" class="form-control2" />  药品名称：<input name="shangpinmingcheng" type="text" id="shangpinmingcheng" class="form-control2" />
					        <input name="button" type="button" onclick="check()" value="查询" class="btn btn-info btn-small"/> <input type="button" value="导出excel" onclick="javascript:location.href='goumai_listxls.jsp';" class="btn btn-info btn-small" />
					      
                          </td>
						</tr>
					 </table>
	</form>
			
			<table width="98%" border="1" align="center" cellpadding="4" cellspacing="1" bordercolor="#F3F3F3" bgcolor="#CBD8AC" style="margin-bottom:8px">
				
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="50" height="50" bgcolor="#FAFAF1">序号</td>
					<td >药品编号</td>
    <td >药品名称</td>
    <td >药品类别</td>
    <td >制药公司</td>
    <td >价格</td>
    <td >库存</td>
    <td >销量</td>
    <td >购买数量</td>
    <td >购买金额</td>
    <td >购买人</td>
    <td  width='80' align='center'>是否审核</td>
					
					<td width="140" height="50" bgcolor="#FAFAF1">添加时间</td>
					<td width="150" height="50" bgcolor="#FAFAF1">操作</td>
		        </tr>
				<%
					int i=0;
				%>
				<c:forEach items="${requestScope.page.data}" var="goumai" varStatus="sta">
				<%
					i++;
				%>
				<tr align="center" <%
  	if((i % 2)==0)
	{
		out.print("bgcolor='#F0F0F0'");
	}
	else
	{
		out.print("bgcolor='#FFFFFF'");
	}
	
	if((i % 2)==0)
	{
		%> onmouseover="this.style.backgroundColor='#F9DFEB'" onmouseout="this.style.backgroundColor='#F0F0F0'" <%
	}
	else
	{
		%> onmouseover="this.style.backgroundColor='#F9DFEB'" onmouseout="this.style.backgroundColor='#FFFFFF'" <%
	}
	
  %> >
					<td height="50"><%=i%></td>
					<td>${goumai.shangpinbianhao}</td>
    <td>${goumai.shangpinmingcheng}</td>
    <td>${goumai.shangpinleibie}</td>
    <td>${goumai.zhiyaogongsi}</td>
    <td>${goumai.jiage}</td>
    <td>${goumai.kucun}</td>
    <td>${goumai.xiaoliang}</td>
    <td>${goumai.goumaishuliang}</td>
    <td>${goumai.goumaijine}</td>
    <td>${goumai.goumairen}</td>
    <td align='center'>${goumai.issh} <input type="button" value="审核" onclick="goumaiIssh(${goumai.id})" class="btn btn-info btn-small" /></td>
    
					
					<td height="50">${goumai.addtime}</td>
					<td width="150" height="50"  align="center">
						     <input type="button" value="删除" onclick="goumaiDel(${goumai.id})" class="btn btn-info btn-small"/>
						     <input type="button" value="编辑" onclick="goumaiPre(${goumai.id})" class="btn btn-info btn-small"/>
							 
							 <input type="button" value="详细" onclick="goumaiDetail(${goumai.id})" class="btn btn-info btn-small"/>
				  </td>
				</tr>
				</c:forEach>
	</table>
			
			 <%
 int i2=0;
			String sql="select * from t_goumai where 1=1 ";
				
if(request.getParameter("shangpinbianhao")=="" ||request.getParameter("shangpinbianhao")==null ){}else{String nshangpinbianhao=new String(request.getParameter("shangpinbianhao").getBytes("8859_1"));if(nshangpinbianhao.contains("?")){nshangpinbianhao=request.getParameter("shangpinbianhao");}sql=sql+" and shangpinbianhao like '%"+nshangpinbianhao+"%'";}
if(request.getParameter("shangpinmingcheng")=="" ||request.getParameter("shangpinmingcheng")==null ){}else{String nshangpinmingcheng=new String(request.getParameter("shangpinmingcheng").getBytes("8859_1"));if(nshangpinmingcheng.contains("?")){nshangpinmingcheng=request.getParameter("shangpinmingcheng");}sql=sql+" and shangpinmingcheng like '%"+nshangpinmingcheng+"%'";}
			sql+=" order by id desc";
double goumaijinez=0;
							
							
			ResultSet RS_result=connDbBean.executeQuery(sql);
while(RS_result.next()){
				i2++;
						
						goumaijinez=goumaijinez+Float.valueOf(RS_result.getString("goumaijine")).floatValue();

						
						
			 }
			%>
		共计购买金额:<%=goumaijinez%>； 
			
			<%@ include file="hsgfenye.jsp"%> 
			
			
	</body>
</html>
