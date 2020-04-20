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
				<strong>会员注册</strong>
			</div>
			<div class="panel-body row">
				<div class="col-xs-6" style="padding: 30px 60px;">
					<div class="panel" style="border: none;">
						<div class="panel-heading" style="background: none;">
							<strong>开放登录，快捷方便</strong>
						</div>
						<div class="panel-body" style="text-align: center;">
							<a href="javascript:;" id="wx-login"
								class="btn btn-default btn-lg btn-block"> <i
								class="icon-wechat icon"></i> 微信
							</a> <img id="qrcode_wx" class="pic hide"
								src="./images/qrcode_wx.jpg" style="width: 160px;" />
						</div>
					</div>
				</div>

				<div class="col-xs-6" style="padding: 30px 60px">
					<div class="panel" style="border: none;">
						<div class="panel-heading" style="background: none;">
							<strong>欢迎注册成为会员</strong>
						</div>
						<div class="panel-body">
							<form action="${path }/member/register" method="post"
								id="registForm" class="form-horizontal" role="form"
								data-checkfingerprint="1">
								<div class="form-group">
									<label class="col-xs-3 control-label">手机号</label>
									<div class="col-xs-9 required">
										<input type="text" name="mobile" id="mobile" 
											class="form-control form-control" autocomplete="off"
											placeholder="必须是11位手机号">
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-3 control-label">真实姓名</label>
									<div class="col-xs-9 required">
										<input type="text" name="real_name" id="real_name" 
											class="form-control" placeholder="真实姓名">
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-3 control-label">密码</label>
									<div class="col-xs-9 required">
										<input type="password" name="pwd" id="pwd" value=""
											class="form-control" placeholder="数字和字母组成，六位以上">
									</div>
								</div>
								<div class="form-group">
									<label class="col-xs-3 control-label">请重复密码</label>
									<div class="col-xs-9 required">
										<input type="password" name="pwd_aginValidator" id="pwd_agin" 
											class="form-control" placeholder="两次密码必须一致">
									</div>
								</div>

								<div class="form-group">
									<div class="col-xs-3"></div>
									<div class="col-xs-9">
										<input type="submit" id="submit"
											class="btn btn-primary btn-block" value="注册"
											">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- /主内容 -->

	<jsp:include page="icd_bottom.jsp"></jsp:include>
	<!-- 右侧浮动栏 -->
	<jsp:include page="icd_right.jsp"></jsp:include>

	<jsp:include page="icd_js.jsp"></jsp:include>

</body>
</html>