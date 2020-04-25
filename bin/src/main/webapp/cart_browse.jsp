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
<div class="wrapper" style="min-height: 400px;">
    <div class="panel" style="margin-top: 20px">
	  <div class="panel-heading" style="font-size: 18px">
	    <strong>我的购物车</strong>
	  </div>
	  <form action="./order_confirm.jsp" method="post">
      <div class="panel-body">
	      <table class="table">
	        <thead>
	          <tr class="text-center">
	            <td colspan="2" class="text-left">商品信息</td>
	            <td class="text-left">价格</td>
	            <td>数量</td>
	            <td>金额</td>
	            <td>操作</td>
	          </tr>
	        </thead>
	        <tbody id="cart-list">
	        <tr>
	          <td style="width: 100px">
	            <a href="./prod_detail.jsp"><img src="./img/iphone6s.jpg" title="phone1" alt=""/></a>
	          </td>
	          <td class="text-left">
	            <a href="./prod_detail.jsp" class="media-wrapper">iphone手机</a>
	          </td>
	          <td style="width:100px" > 
	             <div id="price">4880.02</div>
	          </td>
	          <td style="width:140px" >
	            <div class="input-group">
	              <span class="input-group-addon"><i class="icon icon-minus"></i></span>
	              <input type="text" name="amount" id="amount" value="1" class="form-control" style="text-align: center;"/>
	              <span class="input-group-addon"><i class="icon icon-plus"></i></span>
	            </div>
	          </td>
	          <td style="width: 160px" class="text-center text-middle">
	            <strong class="text-danger" id="sum">4880.00</strong>
	          </td>
	          <td style="width: 120px" class="text-middle text-center">
	            <a href="/cart-delete?id=11" class="deleter">删除</a>
	          </td>
	        </tr>
	        <tr>
              <td style="width: 100px">
                <a href="./prod_detail.jsp"><img src="./img/iphone6s.jpg" title="phone1" alt=""/></a>
              </td>
              <td class="text-left">
                <a href="./prod_detail.jsp" class="media-wrapper">ipad</a>
              </td>
              <td style="width:100px" > 
                 <div id="price">3288.68</div>
              </td>
              <td style="width:140px" >
                <div class="input-group">
                  <span class="input-group-addon"><i class="icon icon-minus"></i></span>
                  <input type="text" name="amount" id="amount" value="1" class="form-control" style="text-align: center;"/>
                  <span class="input-group-addon"><i class="icon icon-plus"></i></span>
                </div>
              </td>
              <td style="width: 160px" class="text-center text-middle">
                <strong class="text-danger" id="sum">3288.68</strong>
              </td>
              <td style="width: 120px" class="text-middle text-center">
                <a href="/cart-delete?id=11" class="deleter">删除</a>
              </td>
            </tr>
	        </tbody></table>
	    </div>
	    <div class="panel-footer text-right">
	      选择了 <strong class="text-danger" id="amount-sum">1</strong> 件商品，
	      共计：<strong id="price-sum" class="text-danger">4880.00</strong>
	      <input type="submit" id="submit" class="btn btn-primary" value="去结算" data-loading="稍候..."/>
	    </div>
	  </form>
	</div>
</div>
<!-- /主内容 -->

<jsp:include page="icd_bottom.jsp"></jsp:include>
<!-- 右侧浮动栏 -->
<jsp:include page="icd_right.jsp"></jsp:include>

<jsp:include page="icd_js.jsp"></jsp:include>
</body>
</html>