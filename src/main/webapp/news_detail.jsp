<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="icd_meta.jsp"></jsp:include>
<jsp:include page="icd_css.jsp"></jsp:include>
</head>
<body>
<jsp:include page="icd_title2.jsp"></jsp:include>
<!-- 主内容 -->
<div class="wrapper">
   <div class="panel" id="news_detail">
	  <div class="panel-heading">
	    <span>${news.title}</span>
	    <p id="pubtime">时间：<fmt:formatDate value="${news.pub_time}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
	  </div>
	  <div class="panel-body">
	    ${news.content}
	  </div>
	</div>
</div>
<!-- /主内容 -->
<jsp:include page="icd_bottom.jsp"></jsp:include>
<!-- 右侧浮动栏 -->
<jsp:include page="icd_right.jsp"></jsp:include>

<jsp:include page="icd_js.jsp"></jsp:include>
</body>
</html>