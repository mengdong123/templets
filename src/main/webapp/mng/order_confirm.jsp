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
	    <strong>确认订单信息</strong>
	  </div>
	  <form action="${path}/mng/order/orderSubmit" method="post">
      <div class="panel-body">
	      <table class="table">
	        <thead>
	          <tr class="text-center">
	            <td colspan="2" class="text-left">商品信息</td>
	            <td class="text-left">价格</td>
	            <td class="text-left">数量</td>
	            <td class="text-left">金额</td>
	          </tr>
	        </thead>
	        <tbody id="cart-list">
	        	<c:forEach items="${map}" var="i">
	        		<input type="checkbox" name="check" value="${i.key.id}" checked style="display:none">
	        		<input type="checkbox" name="count" value="${i.value}" checked style="display:none">
	        		<tr>
			          <td style="width: 100px">
			            <a href="${path}/prod_detail/${i.key.id}"><img src="${path}/img/${i.key.thumbnail}" title="${i.key.name}" alt=""/></a>
			          </td>
			          <td class="text-left">
			            <a href="${path}/prod_detail/${i.key.id}" class="media-wrapper">${i.key.name}</a>
			          </td>
			          <td style="width:100px" > 
			             <div id="price" data-count="${i.value}">${i.key.sale_price}</div>
			          </td>
			          <td style="width:140px" >
			            <div class="input-group">
			              	<span class="each_count">${i.value}</span>
			            </div>
			          </td>
			          <td style="width: 160px" >
			            <strong class="text-danger sum_price" id="sum">${i.key.sale_price*i.value}</strong>
			          </td>
			        </tr>
	        	</c:forEach>
	        </tbody></table>
	        <br/>请选择地址：
          <select class="form-control" name="address_id">
	          <c:forEach items="${address}" var="i" >
				  <option value="${i.id}" >&nbsp;&nbsp;&nbsp;${i.street}
				  &nbsp;&nbsp;&nbsp;${i.contact}&nbsp;&nbsp;&nbsp;${i.mobile}
				  </option>
	          </c:forEach>
          </select>
          <br/>添加留言：
          <textarea class="form-control" rows="3" placeholder="在此处撰写留言" name="remark"></textarea>
	    </div>
	    <div class="panel-footer text-right">
	      共计 <strong class="text-danger" id="amount-sum">1</strong> 件商品，
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
$(function(){ 
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
	
	var sum = 0.0;
	$(".sum_price").each(function(){
		sum += parseFloat($(this).html());
	})
	var count = 0
	$(".each_count").each(function(){
		count += parseInt($(this).html());
	})
	$("#amount-sum").html(parseInt(count));
	$("#price-sum").html(formatMoney(sum,2));

}); 
	
</script>
</html>