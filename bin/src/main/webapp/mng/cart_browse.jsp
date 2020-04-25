<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="../icd_meta.jsp"></jsp:include>
<jsp:include page="../icd_css.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../icd_title2.jsp"></jsp:include>
<!-- 主内容 -->
<div class="wrapper" style="min-height: 400px;">
    <div class="panel" style="margin-top: 20px">
	  <div class="panel-heading" style="font-size: 18px">
	    <strong>我的购物车</strong>
	  </div>
	  <form action="${path}/mng/order/buyFormCart" method="post">
      <div class="panel-body">
	      <table class="table">
	        <thead>
	          <tr class="text-center">
	          	<td></td>
	            <td colspan="2" class="text-left">商品信息</td>
	            <td class="text-left">价格</td>
	            <td>数量</td>
	            <td>金额</td>
	            <td>操作</td>
	          </tr>
	        </thead>
	        <tbody id="cart-list">
	        	<c:forEach items="${shopcar}" var="i">
	        		<tr>
	        		  <td>
	        		  	<input type="checkbox" checked="checked" class="checkBox" data-id="${i.product.id}" name="check" value="${i.product.id}">
	        		  	<input type="checkbox" checked="checked" id="countCheckBox${i.product.id}" name="count" value="${i.amount}" style="display:none;">
	        		  </td>
			          <td style="width: 100px">
			            <a href="${path}/prod_detail/${i.product.id}"><img src="${path}/img/${i.product.thumbnail}" title="${i.product.name}" alt=""/></a>
			          </td>
			          <td class="text-left">
			            <a href="${path}/prod_detail/${i.product.id}" class="media-wrapper">${i.product.name}</a>
			          </td>
			          <td style="width:100px" > 
			             <div id="price">${i.product.sale_price}</div>
			          </td>
			          <td style="width:140px" >
			            <div class="input-group">
			            	<c:if test="${i.amount == 1}">
			            	  <span class="input-group-addon">
				              	<i class="icon icon-minus" style="color: #d0d0d0"></i>
				              </span>
			            	</c:if>
			              	<c:if test="${i.amount != 1}">
			              	  <span class="input-group-addon" onclick="location='${path}/mng/cart_minus/${i.product.id}'">
				              	<i class="icon icon-minus"></i>
				              </span>
			              	</c:if>
			              	<input type="text" name="amount" id="amount${i.product.id}" value="${i.amount}" class="form-control" style="text-align: center;"/>
			              	<span class="input-group-addon" id="span${i.product.id}"><i id="btn_plus" class="icon icon-plus" onclick="location='${path}/mng/cart_plus/${i.product.id}'"></i></span>
			            </div>
			          </td>
			          <td style="width: 160px" class="text-center text-middle">
			            <strong class="text-danger" id="sum${i.product.id}" data-price="${i.product.sale_price}">${i.product.sale_price}</strong>
			          </td>
			          <td style="width: 120px" class="text-middle text-center">
			            <a href="${path}/mng/cart_delete/${i.product.id}" onClick="return confirm('确定要删除该商品吗？');" class="deleter">删除</a>
			          </td>
			        </tr>
	        	</c:forEach>
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



<jsp:include page="../icd_bottom.jsp"></jsp:include>
<!-- 右侧浮动栏 -->
<jsp:include page="../icd_right.jsp"></jsp:include>

<jsp:include page="../icd_js.jsp"></jsp:include>
</body>
<script type="text/javascript">
function formatMoney(s, n)   
{   
   n = n > 0 && n <= 20 ? n : 2;   
   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";   
   var l = s.split(".")[0].split("").reverse(),   
   r = s.split(".")[1];   
   t = "";   
   for(i = 0; i < l.length; i ++ )   
   {   
      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");   
   }   
   return t.split("").reverse().join("") + "." + r;   
}
$(document).ready(function(){ 
	var sumPrice = 0.0;
	var sumCount = 0;
	//计算总价
	$(".checkBox").each(function(){
		var eachId = $(this).data("id");
		if($(this).is(':checked')){
			sumPrice += ($("#sum"+eachId).data("price")*$("#amount"+eachId).val());
			sumCount += parseInt($("#amount"+eachId).val());
		}
	})
	$("#price-sum").html(formatMoney(sumPrice,2));
	$("#amount-sum").text(sumCount);
}); 
$(".checkBox").on("click",function(){
	var thisCheckBox = $(this);
	var id = thisCheckBox.data("id");
	//同步两个按钮
	if(thisCheckBox.is(':checked')){
		$("#countCheckBox"+id).prop("checked","checked");
	}else{
		$("#countCheckBox"+id).removeAttr("checked");
	}
	var sumPrice = 0.0;
	var sumCount = 0;
	//计算总价
	$(".checkBox").each(function(){
		var eachId = $(this).data("id");
		if($(this).is(':checked')){
			sumPrice += ($("#sum"+eachId).data("price")*$("#amount"+eachId).val());
			sumCount += parseInt($("#amount"+eachId).val());
		}
	})
	$("#price-sum").html(formatMoney(sumPrice,2));
	$("#amount-sum").text(sumCount);
})
</script>
</html>