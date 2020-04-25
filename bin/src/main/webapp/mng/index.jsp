<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="../icd_meta.jsp"></jsp:include>
<title>用户中心—卓讯商城</title>
<jsp:include page="../icd_css.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../icd_title2.jsp"></jsp:include>

<!-- 主内容 -->
<div class="wrapper">
    <div class="row" style="padding: 20px 0px;">
      <jsp:include page="left.jsp">
      	<jsp:param value="orderType${orderType}" name="memberPageLocation"/>
      </jsp:include>
        <!-- 右边 -->
        <div class="col-xs-10">
            <div class="panel" style="min-height: 370px">
		        <div class="panel-heading">
		            <strong><i class="icon-shopping-cart"> </i>订单管理</strong>
		        </div>
		        <table class="table table-hover table-striped tablesorter table-bordered">
				    <thead>
				        <tr class="text-center">
				            <td class="text-left">商品信息</td>
				            <td class="text-left">单价</td>
				            <td>数量</td>
				            <td>实付款</td>
				            <td>交易状态</td>
				            <td style="width:150px">买家留言</td>
				            <td style="width:80px">操作</td>
				        </tr>
				    </thead>
				    <tbody>
				    
				      <c:forEach items="${orders}" var="order">
				      	
				        <tr>
				            <td class="text-middle">
				            
				              <h4>
				              	<br/>订单号：${order.number}
				              </h4>
				              <c:forEach items="${order.items}" var="item">
				              	<hr>
				                <div class="text-left">
				                    <a href="${path}/prod_detail/${item.product.id}">
				                    	${item.product.name}
				                    </a> <br/>
				                </div>
				                
				              </c:forEach>
				              <br/><br/>
				            </td>
				            <td class="text-middle">
				            <br/><br/>
				            	<c:forEach items="${order.items}" var="item">
				            		<hr>￥${item.product.sale_price}
				            	</c:forEach><br/><br/><br/>
				            </td>
				            <td class="text-middle">
				            <br/><br/>
				            	<c:forEach items="${order.items}" var="item">
				            		<hr>${item.amount}
				            	</c:forEach><br/><br/><br/>
				            </td>
				            <td class="text-right text-middle">
				            	￥${order.payment_price}
				            </td>
				            <td class="text-center text-middle">
				            	<c:choose>
				            		<c:when test="${order.status == 1}">
				            			待付款
				            		</c:when>
				            		<c:when test="${order.status == 2}">
				            			待发货
				            		</c:when>
				            		<c:when test="${order.status == 3}">
				            			待收货
				            		</c:when>
				            		<c:when test="${order.status == 4}">
				            			待评价
				            		</c:when>
				            		<c:when test="${order.status == 5}">
				            			退款/售后
				            		</c:when>
				            		<c:when test="${order.status == 6}">
				            			已完成
				            		</c:when>
				            	</c:choose>
				            </td>
				            <td class="text-left">${order.remark}</td>
				            <td class="text-center text-middle">
				            	<c:choose>
				            		<c:when test="${order.status == 1}">
				            			<a href="">付款</a><br/>
				            			<c:if test="${order.remark == ''}">
				            				<a data-toggle="modal" data-target="#myModal${order.id}">留言</a>
				            			</c:if>
				            			<c:if test="${order.remark != ''}">
				            				<a data-toggle="modal" data-target="#myModal${order.id}">修改留言</a>
				            			</c:if><br/>
				            			<a href="${path}/mng/order/delete/${order.id}" onClick="return confirm('真的要取消该订单吗？');">取消订单</a>
				            		</c:when>
				            		<c:when test="${order.status == 2}">
				            			<a href="">提醒发货</a><br/>
				            			<c:if test='${order.remark == ""}'>
				            				<a data-toggle="modal" data-target="#myModal${order.id}">留言</a>
				            			</c:if>
				            			<c:if test='${order.remark != ""}'>
				            				<a data-toggle="modal" data-target="#myModal${order.id}">修改留言</a>
				            			</c:if><br/>
				            			<a data-toggle="modal" data-target="#drawback${order.id}">申请退款</a>
				            		</c:when>
				            		<c:when test="${order.status == 3}">
				            			<a href="#">查看物流</a><br/>
				            			<a href="${path}/mng/order/receiving/${order.id}" onClick="return confirm('请确认收到货物后再点击确认收货');">确认收货</a> <br/>
				            			<c:if test='${order.remark == ""}'>
				            				<a data-toggle="modal" data-target="#myModal${order.id}">留言</a>
				            			</c:if>
				            			<c:if test='${order.remark != ""}'>
				            				<a data-toggle="modal" data-target="#myModal${order.id}">修改留言</a>
				            			</c:if><br/>
				            			<a data-toggle="modal" data-target="#drawback${order.id}">申请退款</a>
				            		</c:when>
				            		<c:when test="${order.status == 4}">
				            			<a href="#">查看物流</a><br/>
				            			<a href="#">评价</a> <br/>
				            			<a data-toggle="modal" data-target="#drawback${order.id}">申请退款</a>
				            		</c:when>
				            		<c:when test="${order.status == 5}">
				            			<a href="#">查看售后进度</a> <br/>
				            		</c:when>
				            		<c:when test="${order.status == 6}">
				            			<a href="#">追加评价</a> <br/>
				            			<a data-toggle="modal" data-target="#drawback${order.id}">申请退款</a>
				            		</c:when>
				            	</c:choose>
				              
				        </tr>
				      </c:forEach>
				    </tbody>
				     <!--<tfoot>
				        <tr>
				            <td colspan="8">
				            <div style="float: right; clear: none;margin: 0" class="pager">
			                    共 <strong>20</strong> 条记录
			                    <strong>1/1</strong> &nbsp; <i class="icon-step-backward"
			                        title="首页"></i> <i class="icon-play icon-rotate-180" title="上一页"></i>
			                    <i class="icon-play" title="下一页"></i> <i class="icon-step-forward"
			                        title="末页"></i>
			                </div></td>
				        </tr> 
				    </tfoot>-->
				</table>
		    </div>
        </div>
	    <!-- /右边 -->
    </div>
</div>
<!-- 模态框 -->
<c:forEach items="${orders}" var="order">
<form action="${path}/mng/order/editRemark/${order.id}" method="post">
	<div class="modal fade"  id="myModal${order.id}">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title">买家留言</h4>
	      </div>
	      <div class="modal-body">
	      	<input name="orderType" value="${orderType}" style="display: none"/>
	        <textarea class="form-control" name="remark" rows="6" placeholder="可以输入多行文本">${order.remark}</textarea>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="submit" class="btn btn-primary">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
</form>
<form action="${path}/mng/order/drawback/${order.id}" method="post">
	<div class="modal fade"  id="drawback${order.id}">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
	        <h4 class="modal-title">请选择退款原因</h4>
	      </div>
	      <div class="modal-body">
	      	<input name="orderType" value="${orderType}" style="display: none"/>
	      	<select class="form-control" name="reason">
				<option value="订单信息填写错误">订单信息填写错误</option>
			    <option value="退运费">退运费</option>
			    <option value="收到商品破损">收到商品破损</option>
			    <option value="商品错发、漏发">商品错发、漏发</option>
			    <option value="商品需要维修">商品需要维修</option>
			    <option value="发票问题">发票问题</option>
			    <option value="收到商品与描述不符">收到商品与描述不符</option>
			    <option value="商品质量问题">商品质量问题</option>
			    <option value="未按约定时间发货">未按约定时间发货</option>
			    <option value="其他">其他</option>
			</select>
	        <textarea class="form-control" name="reasonText" rows="6" placeholder="请输入退款具体原因">${order.remark}</textarea>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="submit" class="btn btn-primary">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
</form>
</c:forEach>
<!-- /模态框 -->
<!-- /主内容 -->
<jsp:include page="../icd_bottom.jsp"></jsp:include>
<jsp:include page="../icd_right.jsp"></jsp:include>
<!-- /右侧浮动栏 -->
<jsp:include page="../icd_js.jsp"></jsp:include>
</body>
</html>