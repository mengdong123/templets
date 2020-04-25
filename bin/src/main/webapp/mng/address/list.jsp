<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="../../icd_meta.jsp"></jsp:include>
<jsp:include page="../../icd_css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../../icd_title2.jsp"></jsp:include>
	<!-- 主内容 -->
	<div class="wrapper">
		<div class="row" style="padding: 20px 0px;">
			<!-- 左边 -->
			<jsp:include page="../left.jsp"></jsp:include>
			<!-- 右边 -->
			<div class="col-xs-10">
				<div class="panel" style="min-height: 370px">
					<div class="panel-heading">
						<strong><i class="icon-map-marker"></i> 地址管理</strong>
						<div class="panel-actions">
							<button class="btn btn-primary" data-toggle="modal"
								data-target="#addAddressModal">添加新地址</button>
						</div>
					</div>

					<table class="table table-hover table-striped tablesorter">
						<thead>
							<tr class="text-center">
								<td style="width: 80px">收件人</td>
								<td style="width: 110px">电话</td>
								<td>详情地址</td>
								<td style="width: 70px">邮编</td>
								<td style="width: 80px">默认地址</td>
								<td style="width: 170px">操作</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="address">
								<tr class="text-center">
									<td>${address.contact}</td>
									<td class="text-left">${address.mobile }</td>
									<td class="text-left" style="text-align: center">${address.street }</td>
									<td>${address.zipcode }</td>
									<td><c:if test="${address.default_value==1}" var="flag">
											<a href="#" style="color: gray;">设为默认</a>
										</c:if> <c:if test="${!flag }">
											<a href="${path}/mng/address/editvalue/${address.id}">设为默认</a>
										</c:if></td>
									<td><a href="${path }/mng/address/edit/${address.id}" 
										>编辑</a>&nbsp;&nbsp; <a
										href="${path}/mng/address/delete/${address.id}">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- /右边 -->
		</div>
	</div>
	<!-- /主内容 -->

	<jsp:include page="../../icd_bottom.jsp"></jsp:include>
	<jsp:include page="../../icd_right.jsp"></jsp:include>
	
	<!-- 新增地址的对话框 -->
	<div class="modal fade" id="addAddressModal">
		<div class="modal-dialog">
			<form action="${path}/mng/address/insert" method="post" id="ajaxForm"
				class="form-horizontal">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">关闭</span>
						</button>
						<h4 class="modal-title">新增地址</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-xs-2 control-label">收货人</label>
							<div class="col-xs-4 required">
								<input type="text" name="contact" id="contact"
									placeholder="收货人姓名" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label">电话</label>
							<div class="col-xs-4 required">
								<input type="text" name="mobile" id="mobile" placeholder="手机号"
									class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label">地址</label>
							<div class="col-xs-9 required">
								<input type="text" name="street" id="street" placeholder="详细地址"
									class="form-control" />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="reset" id="resetBtn" class="btn btn-default">重置</button>
						<button type="submit" id="submitBtn" class="btn btn-primary"
							style="min-width: 80px">保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- /新增地址 -->
	<jsp:include page="../../icd_js.jsp"></jsp:include>
</body>
</html>