<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台主页</title>
  <link href="images/css/bootstrap-theme.css" rel="stylesheet">
  <link href="images/css/font-awesome.min.css" rel="stylesheet" />
  <link href="images/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
  <link href="images/css/style.css" rel="stylesheet">
</head>
<body>
<section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-laptop"></i> 后台主页</h3>
            <ol class="breadcrumb">
     			我们的势力范围：网络覆盖得到的地方，就是我们的疆土！
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-9 col-md-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h2><i class="fa fa-map-marker red"></i><strong>地区</strong></h2>
                <div class="panel-actions">
                  <a href="#" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
                  <a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
                  <a href="#" class="btn-close"><i class="fa fa-times"></i></a>                </div>
              </div>
              <div class="panel-body-map">
                <div id="map" style="height:380px;"></div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <ul class="today-datas">
              <li>
                <div><span id="todayspark1" class="spark"></span></div>
                <div class="datas-text">11,500 名访客/天</div>
              </li>
              <li>
                <div><span id="todayspark2" class="spark"></span></div>
                <div class="datas-text">15,000 次浏览量</div>
              </li>
              <li>
                <div><span id="todayspark3" class="spark"></span></div>
                <div class="datas-text">30.55% 购买率</div>
              </li>
              <li>
                <div><span id="todayspark4" class="spark"></span></div>
                <div class="datas-text">$16,00 收入</div>
              </li>
              <li>
                <div><span id="todayspark5" class="spark"></span></div>
                <div class="datas-text">每月 12,000000 名访客</div>
              </li>
            </ul>
          </div>
        </div>
      </section>
  <script src="images/js/jquery-1.8.3.min.js"></script>
  <script src="images/js/bootstrap.min.js"></script>
  <script src="images/js/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="images/jquery-knob/js/jquery.knob.js"></script>
  <script src="images/js/jquery.sparkline.js" type="text/javascript"></script>
  <script src="images/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
  <script src="images/js/owl.carousel.js"></script>
  <script src="images/js/jquery.customSelect.min.js"></script>
  <script src="images/js/jquery-jvectormap-1.2.2.min.js"></script>
  <script src="images/js/jquery-jvectormap-world-mill-en.js"></script>
  <script src="images/js/gdp-data.js"></script>
  <script src="images/js/charts.js"></script>
  <script src="images/js/jquery.slimscroll.min.js"></script>
    <script>
      $(function() {
        $('#map').vectorMap({
          map: 'world_mill_en',
          series: {
            regions: [{
              values: gdpData,
              scale: ['#000', '#000'],
              normalizeFunction: 'polynomial'
            }]
          },
          backgroundColor: '#eef3f7',
          onLabelShow: function(e, el, code) {
            el.html(el.html() + ' (GDP - ' + gdpData[code] + ')');
          }
        });
      });
    </script>
</body>
</html>