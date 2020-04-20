<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="icd_meta.jsp"></jsp:include>
<jsp:include page="icd_css.jsp"></jsp:include>
</head>
<body>
<jsp:include page="icd_title2.jsp"></jsp:include>
<!-- 主内容 -->
<div class="wrapper" style="min-height: 400px;">
    <div class="panel" id="news_list">
	  <div class="panel-heading">
	    公告列表
	  </div>
	  <table class="table table-striped table-hover">
	  <tbody>
	  	<c:forEach items="${page.res}" var="i">
		    <tr>
		      <td>
			      <a href="${path}/news_detail/${i.id}">${i.title}</a>
			      <br/>
			      <fmt:formatDate value="${i.pub_time}" pattern="yyyy-MM-dd HH:mm" />
		      </td>
		      <td style="width: 180px;">
		       <a href="${path}/news_detail/${i.id}">查看详细&gt;&gt;</a>
		      </td>
		    </tr>
	    </c:forEach>
	  </tbody>
	  </table>
	  <div class="panel-footer">
		  <ul class="pager pager-loose">
		  	<c:forEach var="i" items="${page.pagerDisplay}">
            	<li class='${i.value == page.currentPage?"active":"" }'>
            		<a href="${i.value}">${i.key}</a>
            	</li>
            </c:forEach>
	      </ul>
	      <div class="clearfix"></div>
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