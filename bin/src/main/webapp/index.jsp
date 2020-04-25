<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="icd_meta.jsp"></jsp:include>
<jsp:include page="icd_css.jsp"></jsp:include>
</head>
<body>
<!-- 顶部 -->
<jsp:include page="icd_title.jsp"></jsp:include>

<!-- 轮播图+公告 -->
<div class="wrapper row" style="margin:12px auto 20px auto;">
	<!-- 轮播图 -->
	<div class="col-xs-9">
	    <div id="myNiceCarousel" class="carousel slide" data-ride="carousel">
		  <!-- 圆点指示器 -->
		  <ol class="carousel-indicators">
		    <li data-target="#myNiceCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="#myNiceCarousel" data-slide-to="1"></li>
		    <li data-target="#myNiceCarousel" data-slide-to="2"></li>
		  </ol>
		  <!-- 轮播项目 -->
		  <div class="carousel-inner">
		  	  <c:forEach var="slideshow1" items="${slideshow}" begin="0" end="0">
              	<div class="item active">
		     	 <a href="./news_detail/${slideshow1.id}"><img alt="First slide" src="./img/${slideshow1.thumbnail}"/></a>
		   		</div>
              </c:forEach>
              <c:forEach var="slideshow1" items="${slideshow}" begin="1" end="2">
              	<div class="item">
		     	 <a href="./news_detail/${slideshow1.id}"><img alt="First slide" src="./img/${slideshow1.thumbnail}"/></a>
		   		</div>
              </c:forEach>
          </div>
		
		  <!-- 项目切换按钮 -->
		  <a class="left carousel-control" href="#myNiceCarousel" data-slide="prev">
		    <span class="icon icon-chevron-left"></span>
		  </a>
		  <a class="right carousel-control" href="#myNiceCarousel" data-slide="next">
		    <span class="icon icon-chevron-right"></span>
		  </a>
		</div>
	</div>
	<!-- /轮播图 -->
        <!-- 公告 -->
    <div id="news" class="col-xs-3">
        <div class="panel">
          <div class="panel-heading">
            <span style="font-size: 16px">卓讯快报</span> <a href="./news_list/1" class="pull-right" style="margin-top: 4px">更多 <i class="icon-angle-right"></i></a>
          </div>
          <div class="panel-body">
            <ul>
              <c:forEach var="new1" items="${news}" begin="0" end="0">
              	<li class="text-ellipsis"><a class="hot" target="_blank" href="./news_detail/${new1.id}">${new1.title}</a></li>
              </c:forEach>
              <c:forEach var="new1" items="${news}" begin="1" end="6">
              	<li class="text-ellipsis"><a target="_blank" href="./news_detail/${new1.id}">${new1.title}</a></li>
              </c:forEach>
            </ul>
          </div>
        </div>
    </div>
    <!-- /公告 -->
</div>
<!-- /轮播图+公告 -->

<!-- 主内容 -->
<div class="wrapper">
        <!-- 第1行 -->
    <div class="list">
        <header style="border: 0">
          <strong><i class="icon panel-icon icon-heart" style="color: #d9534f"></i> 热门产品</strong>
          <div class="pull-right"><a href="${path}/productList/all/1">更多</a></div>
        </header>
        <section class="cards cards-condensed row" style="margin: 0">
        <c:forEach var="product" items="${popularProduct}" begin="0" end="4">
		  <div class="col-xs-2">
            <div class="card">
              <a href="./prod_detail/${product.id}" target="_blank"><img src="./img/${product.thumbnail}" alt=""/></a>
              <div class="card-heading">
                <span class="pull-right price">￥${product.sale_price}</span>
                <a href="./prod_detail/${product.id}" target="_blank">${product.name}</a>
              </div>
            </div>
          </div>
		</c:forEach>
        </section>
      </div>
      <!-- /第1行 -->
      
      <!-- 广告条 -->
      <div class="list">
        <a target="_blank" href="http://www.zhuoxun365.com"><img src="./img/banner_ad.jpg" alt=""/></a>
      </div>
      <!-- /广告条 -->
     <!-- 第2行 -->
      <div class="list">
        <header style="border: 0">
          <strong><i class="icon-tablet" style="color: #d9534f"></i> 手机</strong>
          <div class="pull-right"><a href="${path}/productList/ParentCategory/1/1">更多</a></div>
        </header>
        <section class="cards cards-condensed row" style="margin-left: 0">
        	<c:forEach var="product" items="${popularPhone}">
        		<div class="col-xs-2">
		            <div class="card">
		              <a href="${path}/prod_detail/${product.id}" target="_blank"><img src="./img/${product.thumbnail}" alt=""/></a>
		              <div class="card-heading">
		                <span class="pull-right price">￥${product.sale_price}</span>
		                <a href="${path}/prod_detail/${product.id}" target="_blank">${product.name}</a>
				      </div>
				    </div>
		        </div>
        	
        	</c:forEach>
        </section>
      </div>
      <!-- /第2行 -->
      
      <!-- 第3行 -->
      <div class="list" style="border: 0">
        <header>
          <strong><i class="icon-desktop" style="color: #d9534f"></i> 电脑</strong>
          <div class="pull-right"><a href="${path}/productList/ParentCategory/2/1">更多</a></div>
        </header>
        <section class="cards cards-condensed row" style="margin-left: 0">
        	<c:forEach var="product" items="${popularPC}">
        		<div class="col-xs-2">
		            <div class="card">
		              <a href="${path}/prod_detail/${product.id}" target="_blank"><img src="./img/${product.thumbnail}" alt=""/></a>
		              <div class="card-heading">
		                <span class="pull-right price">￥${product.sale_price}</span>
		                <a href="${path}/prod_detail/${product.id}" target="_blank">${product.name}</a>
		              </div>
		            </div>
		         </div>
        		
        	</c:forEach>
        </section>
      </div>
      <!-- /第3行 -->
</div>
<!-- /主内容 -->
<!-- 底部 -->
<jsp:include page="icd_bottom.jsp"></jsp:include>
<!-- 右侧浮动栏 -->
<jsp:include page="icd_right.jsp"></jsp:include>
<jsp:include page="icd_js.jsp"></jsp:include>
</body>
</html>