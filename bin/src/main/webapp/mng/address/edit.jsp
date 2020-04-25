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
			<!-- /左边 -->
			<!-- 右边 -->
			<div class="col-xs-10">
			<div class="panel" style="min-height: 370px">
			<form action="${path}/mng/address/insert" method="post" id="ajaxForm"
				class="form-horizontal">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">关闭</span>
						</button>
						<h4 class="modal-title">地址编辑</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-xs-2 control-label">收货人</label>
							<div class="col-xs-4 required">
								<input type="text" name="contact" id="contact"
									value="${editAddress.contact}" class="form-control"  />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label">电话</label>
							<div class="col-xs-4 required">
								<input type="text" name="mobile" id="mobile" value="${editAddress.mobile}"
									class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label">地址</label>
							<div class="col-xs-4 required">
								<input type="text" name="street" id="street" value="${editAddress.street}"
									class="form-control" />
							</div>
						</div>
					</div>
					<div style="margin-left:200px;">
						<button type="reset" id="resetBtn" class="btn btn-default">重置</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="submit" id="submitBtn" class="btn btn-primary"
							style="min-width: 80px">保存</button>
					</div>
				</div>
			</form>
			</div>
			</div>
			<!-- /右边 -->
					</div>
	</div>
	<!-- /主内容 -->

	<jsp:include page="../../icd_bottom.jsp"></jsp:include>
	<jsp:include page="../../icd_right.jsp"></jsp:include>
		<jsp:include page="../../icd_js.jsp"></jsp:include>
</body>
</html>