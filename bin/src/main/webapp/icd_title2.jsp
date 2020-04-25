<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
</script>
<!-- 顶部 -->
<header id="top">
	<!-- 工具条 -->
	<nav id="toobar">
		<div class="wrapper row">
			<div class="col-xs-2">欢迎来到卓讯商城！</div>
			<div class="col-xs-7"></div>
			<div class="col-xs-3" style="text-align: right;">
				<c:if test="${member==null}">
					<a href="${path}/member_login.jsp">登录</a>
					<a href="${path}/member_register.jsp">注册</a>
				</c:if>
				<c:if test="${member!=null}">
					<a href="${path}/mng/profile.jsp"><i
						class="icon-user icon-small"> </i>${member.real_name}</a>
					<a href="${path}/mng/member/exit">退出</a>
				</c:if>
			</div>
		</div>
	</nav>
	<!-- 工具条 -->

	<!-- 主题 -->
	<div id="subject">
		<div class="wrapper row">
			<div class="col-xs-2" id="logo">
				<a href="${path}/index"><img
					src="${path}/images/logo-zx.png" style="width: 160px;" /></a>
			</div>
			<div class="col-xs-2"></div>
			<div class="col-xs-4" id="searchbar">
				<form action="${path}/search" method="get" role="search">
					<div class="input-group">
						<input type="text" name="words" id="words" value=""
							class="form-control" placeholder="商品搜索">
						<div class="input-group-btn">
							<button class="btn btn-primary" type="submit">
								<i class="icon icon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-xs-2"></div>
			<div class="col-xs-2 pull-right" id="cart">
				<a href="${path}/mng/cart_browse.jsp"> <i class="icon-shopping-cart"></i>
					<span>购物车</span> <span class="label label-badge" style=' ${shopcar==""?"display:none;":""}
					background-color: #eba5a3;${fn:length(shopcar)==0?"display:none;":""}' id="cart_amount">
					${fn:length(shopcar)}</span>
				</a>
				<!-- 购物车商品显示 -->
				<div class="cart-list" id="cart-list" style="display: none">
					<table class="table">
						<tbody>
						  <c:forEach items="${shopcar}" var="i">
							<tr>
								<td width="66"><a class="pic"
									href="${path}/prod_detail/${i.product.id}"><img
										src="${path}/img/${i.product.thumbnail}" width="50px" height="50px"
										class="img-responsive" alt="${i.product.name}"></a></td>
								<td><a class="tit" href="${path}/prod_detail/${i.product.id}">
									${i.product.name}</a> <br />
								<span class="text-primary product_sale_price" data-p="${i.product.sale_price}" data-n="${i.amount}">￥${i.product.sale_price}</span>
								<small style="color:gray;"><small>*${i.amount}</small></small>
								</td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>
					
				</div>
				<!-- 购物车商品显示结束 -->
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<!-- /主题 -->

	<!-- 导航栏 -->
	<nav class="navbar navbar-inverse">
		<div class="wrapper row">
			<div class="navbar-header categories col-xs-3" id="categories">
				<div id="title">
					<i class="icon-th-large"></i>所有商品分类<i id="dropdown"></i>
				</div>
				<div id="menu">
					<ul class="cate-list">

						<!-- 循环显示菜单 -->
						<c:forEach var="ParentCategory" items="${categoryList}">
							<li><a href="${path}/productList/ParentCategory/${ParentCategory.id}/1" class="text-ellipsis">${ParentCategory.name}<i
									id="director" class="icon-angle-right"></i></a>
								<ul class="sub-list">

									<c:forEach var="sonCategory"
										items="${ParentCategory.childElement}">
										<li><a target="_blank" href="${path}/productList/${sonCategory.id}/1">${sonCategory.name}</a></li>
									</c:forEach>
								</ul></li>
						</c:forEach>
						<!-- 循环显示菜单结束 -->
					</ul>
				</div>
			</div>
			<ul class="nav navbar-nav col-xs-9" style="float: left; margin: 0;">
				<li><a href="${path}/index" target="_self">首页</a></li>
				<li><a href="${path}/index" target="_self">一元夺宝</a></li>
				<li><a href="${path}/index" target="_self">关于我们</a></li>
			</ul>
		</div>
	</nav>
	<!-- /导航栏 -->
</header>
<!-- /顶部 -->