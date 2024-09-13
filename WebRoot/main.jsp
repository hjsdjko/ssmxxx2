<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<head>
    <title>管理员界面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="images/css/bootstrap.min.css" >
    <link href="images/css/style.css" rel='stylesheet' type='text/css' />
    <link href="images/css/style-responsive.css" rel="stylesheet"/>
    <link rel="stylesheet" href="images/css/font.css" type="text/css"/>
    <link href="images/css/font-awesome.css" rel="stylesheet"> 
    <link rel="stylesheet" href="images/css/morris.css" type="text/css"/>
    <link rel="stylesheet" href="images/css/monthly.css">
    <script src="images/js/jquery2.0.3.min.js"></script>
    <script src="images/js/raphael-min.js"></script>
    <script src="images/js/morris.js"></script>
</head>
<body>
    <section id="container">
        <header class="header fixed-top clearfix">
            <div class="brand">
                <a href="sy.php" target="hsgmain" class="logo">
                </a>
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars"></div>
                </div>
            </div>
            <div class="top-nav clearfix">
                <ul class="nav pull-right top-menu" >
                    <li>
                        <input type="text" class="form-control search" placeholder=" Search">
                    </li>
                    <li class="dropdown" >
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="images/2.png">
                            <span class="username">${sessionScope.username}[${sessionScope.cx}]</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <!--<li><a href="fanhui.php"><i class="fa fa-cog"></i> 返回</a></li>-->
                            <li><a href="logout.jsp" target="_parent"><i class="fa fa-key"></i> 退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </header>
        <aside>
            <div id="sidebar" class="nav-collapse">
                <div class="leftside-navigation">
					<ul class="sidebar-menu" id="nav-accordion">
						<li>
                            <a class="active" href="sy/sy.jsp" target="hsgmain">
                                <i class="fa fa-dashboard"></i>
                                <span>首页</span>
                            </a>
                        </li>
                        <%
if (request.getSession().getAttribute("cx").equals("超级管理员") || request.getSession().getAttribute("cx").equals("普通管理员")){%><%@ include file="left_guanliyuan.jsp"%><%}if (request.getSession().getAttribute("cx").equals("用户")){%><%@ include file="left_yonghu.jsp"%><%}
%>
                    </ul>
				</div>
            </div>
        </aside>
        <section id="main-content" >
            <section class="wrapper" >
                <div class="agil-info-calendar" >
                    <div class="col-md-6 w3agile-notifications" >
                        <div class="notifications" >
							 <iframe src="sy.jsp"  frameborder="0" height="600" width="100%" style="overflow:hidden; margin-bottom:10px;" id="hsgmain" name="hsgmain"></iframe>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>


            </section>
            <div class="footer">
                <div class="wthree-copyright">
                    <p>@ <script>document.write(new Date().getFullYear());</script> 医院药品管理系统.Design by XingHe</a></p>
                </div>
            </div>
        </section>
    </section>
    <script src="images/js/bootstrap.js"></script>
    <script src="images/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="images/js/scripts.js"></script>
    <script src="images/js/jquery.slimscroll.js"></script>
    <script src="images/js/jquery.nicescroll.js"></script>
    <script src="images/js/jquery.scrollTo.js"></script>
</body>
</html>
