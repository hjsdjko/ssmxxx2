<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="banner">
	<div class="banner-hd">
		<ul class="ydl c">
		<%
			List sybht=connDbBean.getShouyebht();
			if(!sybht.isEmpty()){
				for(int i=0;i<sybht.size();i++){
					if (i<=5)
					{
					List sybht2 =(ArrayList)sybht.get(i);
			

			%>
			<li style="display: none;"><img src="<%=sybht2.get(2)%>" width="100%"></li>
			<%
			}
			}
			}
			%>

		</ul>
		
		<div class="hd">
			<ul><li class=""></li><li class="on"></li><li class=""></li><li class=""></li><li class=""></li></ul>
		</div>
	</div>
	
	
	<script type="text/javascript">
		$('.banner-hd').find(".prev,.next").fadeTo("show",0.4);
		$(".banner-hd").slide({ titCell:".hd ul" , mainCell:".ydl" ,  autoPlay:true, delayTime:700 , autoPage:"<li></li>" });
	</script>
</div>
