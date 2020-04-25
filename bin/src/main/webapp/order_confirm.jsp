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
	    <strong>会员登录</strong>
	  </div>
      <div class="panel-body row">
        <div class="col-xs-6" style="padding: 30px 60px;">
          <div class="panel" style="border: none;">
            <div class="panel-heading" style="background: none;"><strong>开放登录，快捷方便</strong></div>
            <div class="panel-body" style="text-align: center;">
              <a href="javascript:;" id="wx-login" class="btn btn-default btn-lg btn-block">
                <i class="icon-wechat icon"></i> 微信</a>
              <img id="qrcode_wx"  class="pic hide" src="./images/qrcode_wx.jpg" style="width: 160px;"/>
            </div>
          </div>
        </div>
      
        <div class="col-xs-6" style="padding: 30px 60px">
	      <div class="panel" style="border: none;">
	        <div class="panel-heading" style="background: none;"><strong>已有帐号</strong></div>
	        <div class="panel-body">
	          <form action="./member/index.jsp" method="post" id="ajaxForm" role="form">
	            <div class="form-group hide"><div id="formError" class="alert alert-danger"></div></div>
	            <div class="form-group"><input type="text" name="account" id="account" value="" placeholder="请输入用户名" class="form-control input-lg"></div>
	            <div class="form-group"><input type="password" name="password" id="password" value="" placeholder="请输入密码" class="form-control input-lg"></div>
	            <a href="./mng/index.jsp" id="submit" class="btn btn-primary btn-wider btn-lg">登录</a>  &nbsp; &nbsp; 
	            
	            <a href="/user-register.jsp">注册</a>&nbsp; &nbsp; 
	            <a href="/user-resetpassword.jsp">忘记密码</a>
	            <input type="hidden" name="referer" id="referer" value="http://mall.demo.chanzhi.org/phone/zentaophone-1.jsp">
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