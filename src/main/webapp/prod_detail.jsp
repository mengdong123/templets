<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <ol class="breadcrumb">
	  <li><span class="breadcrumb-title">当前位置：</span> <a href="${path}/index">首页</a></li>
	  <li><a href="${path}/productList/ParentCategory/${category.id}/1">${category.name}</a></li>
	  <li class="active">${product.name}</li>
	</ol>
      
    <!--  -->
    <div class="row">
        <!-- /左边 -->
        <div class="col-xs-9">
            <!-- 详情 -->
            <div class="panel panel-body">
		      <div class="row">
		         <div class="col-xs-5">
			          <div class="product-image">
			            <img src="${path}/img/${product.thumbnail}" title="" style="height:290px" alt="${product.thumbnail}"/>
			          </div>
		         </div>
		        <div class="col-xs-7">
		           <div class="product-property">
		           <form method="get">
		            <h1 class="header-dividing">${product.name}</h1>
		            <ul class="list-unstyled attr-list">
		              <li>
		                  <span class="attr-name">价格</span>
		                  <span class="attr-value">￥<del><strong>${product.price}</strong></del></span>
		              </li>
		              <li>
		                  <span class="attr-name">特价</span>
		                  <span class="attr-value">￥<strong class="text-danger" style="font-size: 16px">${product.sale_price}</strong></span>
		              </li>
		              <li id="countBox">
		                <span class="attr-name">数量</span>
		                <span class="attr-value">
		                  <div class="input-group" style="width:120px">
		                    <span class="input-group-addon"><i class="icon icon-minus"></i></span>
		                    <input type="text" name="count" id="count" value="1" class="form-control" style="text-align: center;"/>
		                    <span class="input-group-addon"><i class="icon icon-plus"></i></span>
		                  </div>
		                </span>
		              </li>
		            </ul>
		            <span>
		                <button type="submit" class="btn btn-warning" formaction="${path}/mng/order/buyNow/${product.id}">立即购买</button>&nbsp;&nbsp;&nbsp;
					    <button id="cartBtn" class="btn btn-primary" formaction="${path}/mng/addToShopCar/${product.id}" type="submit"><i class="icon icon-shopping-cart"></i> 加入购物车</button>
					</span>
					</form>
		          </div>
		        </div>
		      </div>
		      <h5 class="header-dividing"><i class="icon-file-text-alt text-muted"></i> 详情</h5>
		      <div class="article-content" id="product-detail">
		         ${product.selling_description}
		         ${product.detail_description}
              </div>
		    </div>
		    <!-- /详情 -->
		    
		    <!-- 评论 
		    <div id="comments">
				<div class="panel">
				  <div class="panel-heading">
				    <strong><i class="icon-comment-alt"></i> 发表评论</strong>
				  </div>
				  <div class="panel-body">
				        <form method="post" class="form-horizontal" 
				            id="commentForm" action="/message-post-comment.jsp">
				          <div class="form-group">
					        <label for="from" class="col-xs-1 control-label">称呼</label>
					        <div class="col-xs-5 required">
					          <input type="text" name="from" id="from" value="" class="form-control">
					        </div>
					      </div>
					      <div class="form-group">
					        <label for="email" class="col-xs-1 control-label">邮箱</label>
					        <div class="col-xs-5">
					          <input type="text" name="email" id="email" value="" class="form-control">
					        </div>
					      </div>
				          <div class="form-group">
					        <label for="content" class="col-xs-1 control-label">内容</label>
					        <div class="col-xs-11 required">
					            <textarea name="content" id="content" class="form-control"></textarea>
					        </div>
					      </div>
				          
				          <div class="form-group">
					        <div class="col-xs-11 col-md-offset-1">
					          <span><input type="submit" id="submit" class="btn btn-primary" value="保存" data-popover-container="false" data-loading="稍候..."> </span>
					          <span><small class="text-important">评论通过审核后显示。</small></span>
					        </div>
					      </div>
				    </form>
				  </div>
				</div>
		    </div>-->
		    <!-- /评论 -->
        </div>
        <!-- /左边 -->
        
        <!-- 右边热卖 -->
	    <div class="col-xs-3">
	       <div class="panel">
			  <div class="panel-heading">
			    <strong><i class="icon panel-icon icon-star"></i> 热销产品</strong>
			    <div class="pull-right"><a href="${path}/productList/ParentCategory/${category.id}/1">更多</a></div>
			  </div>
			  <div class="panel-body cards cards-borderless" id="product-hot">
			    <c:forEach var="otherproduct1" items="${otherProduct}" step="3">
				  <div class="card">
		              <a href="${path}/prod_detail/${otherproduct1.id}" target="_blank"><img src="${path}/img/${otherproduct1.thumbnail}" alt=""></a>
		              <div class="card-heading">
		                <span class="pull-right price">￥${otherproduct1.sale_price}</span>
		                <a href="${path}/prod_detail/${otherproduct1.id}" target="_blank">${otherproduct1.name}</a>
		              </div>
		          </div>
				</c:forEach>
			  </div>
		    </div>
	    </div>
	    <!-- /右边热卖 -->
    </div>
</div>
<!-- /主内容 -->
<script type="text/javascript">
	function fun(){
		alert("添加成功");
	}
	${addMark}
	
</script>
<c:remove var="addMark"/>
<jsp:include page="icd_bottom.jsp"></jsp:include>
<!-- 右侧浮动栏 -->
<jsp:include page="icd_right.jsp"></jsp:include>

<jsp:include page="icd_js.jsp"></jsp:include>
</body>
</html>