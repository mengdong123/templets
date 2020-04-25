<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="../icd_meta.jsp"></jsp:include>
<jsp:include page="../icd_css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../icd_title2.jsp"></jsp:include>
	<!-- 主内容 -->
	<div class="wrapper">
		<div class="row" style="padding: 20px 0px;">
			<!-- 左边 -->
			<jsp:include page="left.jsp"></jsp:include>
			<!-- 右边 -->
			<div class="col-xs-10">
				<div class="panel" style="min-height: 370px">
					<div class="panel-heading">
						<strong><i class="icon-user"></i> 修改密码</strong>
					</div>
					<div class="panel-body">
						<form action="${path }/mng/member/updatepwd/${member.id}"
							method="post" id="defaultForm" class="form-horizontal">
							<div class="form-group">
								<label class="col-xs-2 control-label">原密码</label>
								<div class="col-xs-4 required">
									<input type="password" name="pwd" id="pwd" class="form-control"
										placeholder="请输入原密码" />
									<p style="color: red; font-size: 15px;">${msg }</p>
								</div>
							</div>

							<div class="form-group">
								<label class="col-xs-2 control-label">新密码</label>
								<div class="col-xs-4 required">
									<input type="password" name="newpwd" id="newpwd"
										class="form-control" placeholder="请输入新密码" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-10">
									<input type="submit"  class="btn btn-primary"
										style="min-width: 80px" value="修改"  />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /右边 -->
		</div>
	</div>
	<!-- /主内容 -->

	<jsp:include page="../icd_bottom.jsp"></jsp:include>
	<jsp:include page="../icd_right.jsp"></jsp:include>
	 <!-- 新增地址的对话框 
	<div class="modal fade" id="addAddressModal">
		<div class="modal-dialog">
			<form action="./profile" method="post" id="ajaxForm"
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
								<input type="text" name="phone" id="phone" placeholder="手机号"
									class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-2 control-label">地址</label>
							<div class="col-xs-9 required">
								<input type="text" name="address" id="address"
									placeholder="详细地址" class="form-control" />
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
	 /新增地址  -->
	<jsp:include page="../icd_js.jsp"></jsp:include>
	<!-- 表单验证==开始 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('#defaultForm').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					pwd : {
						message : '请输入原密码',
						validators : {
							notEmpty : {
								message : '原密码不能为空'
							},

						}
					},
					pwd : {
						message : '请输入原密码',
						validators : {
							notEmpty : {
								message : '新密码不能为空'
							},
							stringLength : {
								min : 6,
								max : 13,
								message : '密码长度为6-13位'
							},

						}
					},
				}
			})

		});
	</script>
</body>
</html>