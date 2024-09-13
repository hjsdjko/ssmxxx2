<%@ page language="java" pageEncoding="UTF-8"%>
<form action="" name="form123" method="post">
                  <input type="hidden" name="index"/>
            </form>
					               
			<br/>
		    <table border='0' cellpadding='0' cellspacing='0' align="center">
		        <tr>
			        <td width='98%' align="right">
			                  共<span style='color:#FF0000'>${requestScope.page.totle}</span>条记录&nbsp;&nbsp;&nbsp;&nbsp;
			                  每页<span style='color:#FF0000'>${requestScope.page.pageSize}</span>条&nbsp;&nbsp;&nbsp;&nbsp;
			                  第<span style='color:#FF0000'>${requestScope.page.index}</span>页/共${requestScope.page.totlePage}页&nbsp;&nbsp;&nbsp;&nbsp;
			                <c:if test="${requestScope.page.index==1}">
			                       首&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;
			                </c:if>
			                <c:if test="${requestScope.page.index!=1}">
			                       <a style='color: red' href='#' onclick="go(1)">首&nbsp;&nbsp;页</a>
			                       &nbsp;&nbsp;&nbsp;&nbsp;
			                       <a style='color: red' href='#' onclick="go(${requestScope.page.index-1})">上一页</a>
			                       &nbsp;&nbsp;&nbsp;&nbsp;
			                </c:if>
			                <c:if test="${requestScope.page.index >= requestScope.page.totlePage}">
			                          下一页&nbsp;&nbsp;&nbsp;&nbsp;末&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;
			                </c:if>
			                <c:if test="${requestScope.page.index < requestScope.page.totlePage}">
			                       <a style='color: red' href='#' onclick="go(${requestScope.page.index+1})">下一页</a>
			                       &nbsp;&nbsp;&nbsp;&nbsp;
			                       <a style='color: red' href='#' onclick="go(${requestScope.page.totlePage})">末&nbsp;&nbsp;页</a>
			                </c:if>
			        </td>
		       </tr>
		    </table>  