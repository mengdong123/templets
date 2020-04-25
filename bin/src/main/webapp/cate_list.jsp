<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="./icd_meta.jsp"></jsp:include>
<jsp:include page="./icd_css.jsp"></jsp:include>
</head>
<body>
<jsp:include page="./icd_title2.jsp"></jsp:include>
<!-- 主内容 -->
<div class="wrapper">
    <ol class="breadcrumb" style="">
	  <li><span class="breadcrumb-title">当前位置：</span> <a href="${path}/index">首页</a></li>
	  <li class="active">${currentCategory.name}</li>
	</ol>
      
      
      <div class="list">        
        <section class="cards cards-borderless cards-products row">
        <c:forEach items="${page.res}" var="product">
            <div class="col-xs-2">
	            <div class="card">
	              <a href="${path}/prod_detail/${product.id}" target="_blank"><img src="${path}/img/${product.thumbnail}" alt="" height="180"/></a>
	              <div class="card-heading">
	                <span class="pull-right price">￥${product.sale_price}</span>
	                <a href="${path}/prod_detail/${product.id}" target="_blank">${product.name}&nbsp;&nbsp;&nbsp;</a>
	              </div>
	            </div>
	         </div>
          </c:forEach>
        </section>
        
        <footer class="clearfix" style="padding: 0 12px; border-top: 1px dotted #e5e5e5;">
            <ul class="pager pager-loose pull-right">
            	<c:forEach var="i" items="${page.pagerDisplay}">
            		<li class='${page.currentPage.toString() == i.key?"active":"" }'>
            			<a href='${search==null?"":"search?words="}${search}${search==null?"":"&currentPage="}${i.value}'>${i.key}</a>
            			
            		</li>
            	</c:forEach>
            </ul>
        </footer>
        <c:remove var="search"></c:remove>
      </div>
      <!-- /第2行 -->
</div>
<!-- /主内容 -->

<jsp:include page="./icd_bottom.jsp"></jsp:include>
<!-- 右侧浮动栏 -->
<jsp:include page="./icd_right.jsp"></jsp:include>

<jsp:include page="./icd_js.jsp"></jsp:include>
</body>
</html>